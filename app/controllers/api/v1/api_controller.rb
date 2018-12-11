module Api::V1
 
 	class ApiController < ApplicationController
 		def require_authorization_funcionario!
 			unless params[:cod].to_i == 1
 				render json: {}, status: :forbidden
 			end
 		end
 	end
end