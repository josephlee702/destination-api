class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :zip
      t.text :description
      t.string :image_url
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
