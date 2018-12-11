module Api::V1
 
 	class ApiController < ApplicationController

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
 	end
end