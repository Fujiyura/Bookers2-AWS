class CreatePofileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :pofile_images do |t|
      t.string :image_id

      t.timestamps
    end
  end
end
