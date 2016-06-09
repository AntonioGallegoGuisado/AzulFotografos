class CreateNovedads < ActiveRecord::Migration
  def change
    create_table :novedads do |t|
      t.text :texto
      t.string :enlace
      t.string :url

      t.timestamps null: false
    end
  end
end
