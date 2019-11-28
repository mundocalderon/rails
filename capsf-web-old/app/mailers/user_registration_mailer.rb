class UserRegistrationMailer < Devise::Mailer
  default from: "no-reply@capsf.org"

  def headers_for(action)
    headers= {
      :subject        => translate(devise_mapping, action),
      :from           => mailer_sender(devise_mapping),
      :to             => resource.email,
      :template_path  => template_paths
    }
  end

  def new_user(resource)
    @resource = resource
    mail(:to => "sitemaster@capsf.org", :subject => "USER REGISTRATION #{@resource.email}" )
  end
    

end
