class Pedido < ApplicationRecord
  belongs_to :mesa
  belongs_to :user
  has_many :item, dependent: :destroy
end
