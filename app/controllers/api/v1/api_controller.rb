module Api::V1
 
 	class ApiController < ApplicationController
	 	acts_as_token_authentication_handler_for User
		before_action :require_authentication!

		def require_authorization_funcionario!
			unless current_user.funcionario
				render json: {}, status: :forbidden
			end
		end

		def require_authorization_admin!
			unless current_user.admin
				render json: {}, status: :forbidden
			end
		end

		private
			def require_authentication!
				throw(:warden, scope: :user) unless current_user
			end
 	end
end