class Pedido < ApplicationRecord
  belongs_to :produto
  belongs_to :mesa
end
