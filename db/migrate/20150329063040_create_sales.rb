class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :number
      t.date :date
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
