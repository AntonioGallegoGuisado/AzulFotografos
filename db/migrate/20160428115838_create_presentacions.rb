class CreatePresentacions < ActiveRecord::Migration
  def change
    create_table :presentacions do |t|
      t.integer :posicion
      t.references :fotos, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
