class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :valor, default: 0.0
      t.string :descrição

      t.timestamps
    end
    add_index :produtos, :nome, unique: true
  end
end
