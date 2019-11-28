class UserRegistrationMailer < Devise::Mailer

  def headers_for(action, opts)
    headers= {
      :subject        => subject_for(action),
      :from           => mailer_sender(devise_mapping),
      :to             => resource.email,
      :template_path  => template_paths
    }
  end

  def new_user(resource)
    @resource = resource
    mail(:to => "rcalderon@capsf.org", :subject => "User Registration #{@resource.email}" )
  end
    

end
