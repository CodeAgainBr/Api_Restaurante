class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.string :status, default: "aberto"
      t.belongs_to :mesa, foreign_key: true

      t.timestamps
    end
  end
end
