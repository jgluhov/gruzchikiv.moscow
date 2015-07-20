class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
