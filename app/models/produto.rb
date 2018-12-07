class Produto < ApplicationRecord
	has_many :item, dependent: :destroy
end
