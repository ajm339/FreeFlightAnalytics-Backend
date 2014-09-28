# require "mechanize"
require "mini_magick"


class PngWorker

  include Sidekiq::Worker
  sidekiq_options :retry => 3

  def perform(id, image_url)

    begin
      AWS.config({:access_key_id => ENV['aws_access_key_id'], :secret_access_key => ENV['aws_secret_access_key']})
      bucket = ENV['aws_bucket']
      write_bucket = AWS::S3.new.buckets[bucket]
      write_bucket.acl = :public_read

      image =  MiniMagick::Image.open(image_url)
      image.combine_options do |c|
        c.resize('280x1000')
      end
      image.format("jpg")

      x = Digest::SHA1.hexdigest(image_url) + ".jpg"
      write_bucket.objects[x].write(image.to_blob)

      begin Micropost.find(id).update_attributes(:image_url => "https://d1k32l7ajctgfq.cloudfront.net/" + x) end
    end

  end

end