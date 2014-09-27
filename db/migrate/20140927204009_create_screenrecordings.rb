class CreateScreenrecordings < ActiveRecord::Migration
  def change
    create_table :screenrecordings do |t|
      t.text :image_url

      t.timestamps
    end
  end
end
