class CreateScreenshotToScreenrecordings < ActiveRecord::Migration
  def change
    create_table :screenshot_to_screenrecordings do |t|
      t.integer :screenshot_id
      t.integer :screenrecording_id

      t.timestamps
    end
  end
end
