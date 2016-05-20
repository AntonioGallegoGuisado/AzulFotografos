class CreateGaleries < ActiveRecord::Migration
  def change
    create_table :galeries do |t|
      t.string :titulo
      t.string :descripcion
      t.integer :posicion
      t.boolean :visible
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
