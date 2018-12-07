class CreateMesas < ActiveRecord::Migration[5.0]
  def change
    create_table :mesas do |t|
      t.integer :numero
      t.boolean :status, default: false

      t.timestamps
    end
    add_index :mesas, :numero, unique: true
  end
end
