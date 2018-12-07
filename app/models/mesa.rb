class Mesa < ApplicationRecord
	has_many :pedido, dependent: :destroy
end
