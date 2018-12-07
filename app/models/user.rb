class User < ApplicationRecord
	acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :pedido, dependent: :destroy

  # def reset_authentication_token!
  # 	authentication_token = nil
  # 	save
  # 	authentication_token
  # end
end
