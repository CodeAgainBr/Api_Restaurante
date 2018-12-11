class Pedido < ApplicationRecord
  belongs_to :mesa
  has_many :item, dependent: :destroy
end
