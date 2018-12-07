class Produto < ApplicationRecord
	has_many :pedido, dependent: :destroy
end
