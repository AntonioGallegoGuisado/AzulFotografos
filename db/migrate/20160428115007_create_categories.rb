class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :titulo
      t.string :descripcion
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
