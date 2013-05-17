class CreateBrigades < ActiveRecord::Migration
  def change
    create_table :brigades do |t|
      t.string :title
      t.integer :count_of_workers
      t.decimal :price
      t.integer :country_id

      t.timestamps
    end
  end
end
