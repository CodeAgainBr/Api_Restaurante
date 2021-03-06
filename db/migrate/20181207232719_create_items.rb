class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :quantidade, default: 0
      t.belongs_to :produto, foreign_key: true
      t.belongs_to :pedido, foreign_key: true

      t.timestamps
    end
  end
end
