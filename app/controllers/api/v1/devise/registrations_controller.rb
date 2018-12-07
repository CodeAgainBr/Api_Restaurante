class Api::V1::Devise::RegistrationsController < Devise::SessionsController
	def create
    build_resource
 
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        return render :json => {:success => true}
      end
    else
      clean_up_passwords resource
      return render :json => {:success => false}
    end
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
end
