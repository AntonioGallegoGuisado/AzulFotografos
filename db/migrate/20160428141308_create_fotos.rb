class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :titulo
      t.string :descripcion
      t.integer :posicion
      t.boolean :visible
      t.boolean :presentacion
      
      t.references :galery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
