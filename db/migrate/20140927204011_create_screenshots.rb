class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.text :image_url

      t.timestamps
    end
  end
end
