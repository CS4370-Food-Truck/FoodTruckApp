class CreateTrucks < ActiveRecord::Migration[7.0]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :schedule
      t.string :website
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6
      t.string :menu

      t.timestamps
    end
  end
end
