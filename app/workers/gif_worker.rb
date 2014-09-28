#require "mechanize"
require "mini_magick"
require "RMagick"
include Magick

class GifWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 3

  def perform(delay, image_blobs)

    begin
      AWS.config({:access_key_id => ENV['aws_access_key_id'], :secret_access_key => ENV['aws_secret_access_key']})
      bucket = ENV['aws_bucket']
      write_bucket = AWS::S3.new.buckets[bucket]
      write_bucket.acl = :public_read

      # image = MiniMagick::Image.open(image_url)
      # make an image list to convert/write as gif eventually
      image_list = Magick::ImageList.new
      image_list.delay = delay
      image_blobs.each do |t|
        image = Magick::Image::from_blob(t)
        image_list << image
      end

      image_list.write("animated.gif")
      # x = Digest::SHA1.hexdigest(gifs.first) + ".gif"
      # write_bucket.objects[x].write(gifs)

      puts '==========='
      puts x.inspect
      puts '-============'

      #begin Micropost.find(id).update_attributes(:image_url => "https://d1k32l7ajctgfq.cloudfront.net/" + x) end
    end
  end

end
