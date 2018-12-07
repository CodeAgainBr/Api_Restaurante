class Api::V1::SessionsController < Devise::SessionsController
	def create
		respond_to do |format|
			format.json do
				self.resorce = warden.authenticate!(auth_options)
				sign_in(resource_name, resource)
				respond_with_authentication_token(resource)
			end
		end
	end

	protected
		def respond_with_authentication_token(resource)
			render json: {
				success: true,
				auth_token: resource.authentication_token,
				email: resource.email
			}
		end
end
