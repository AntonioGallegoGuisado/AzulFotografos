class CreateIntros < ActiveRecord::Migration
  def change
    create_table :intros do |t|
      t.text :introduccion

      t.timestamps null: false
    end
  end
end
