class Notifier < ActionMailer::Base
  default :from => "Lodgemaster <thelodgemaster@gmail.com>"
  
  def registration_instructions(user)
    from "Lodgemaster <thelodgemaster@gmail.com>"
    @registration_url = register_url(user.perishable_token)
    
    mail(:to => user.email_address_with_name,
         :subject => "You've been invited to join the Lodge!",
         :from => from,
         :fail_to => from
    ) do |format|
      format.text
    end
  end
  
  def activation_instructions(user)
    from "Lodgemaster <thelodgemaster@gmail.com>"
    @account_activation_url = activate_account_url(user.perishable_token)
    
    mail(:to => user.email_address_with_name,
         :subject => "Activation Instructions",
         :from => from,
         :fail_to => from
    ) do |format|
      format.text
    end
  end
  
  def activation_confirmation(user)
    from "Lodgemaster <thelodgemaster@gmail.com>"
    
    mail(:to => user.email_address_with_name,
         :subject => "Welcome to the Lodge",
         :from => from,
         :fail_to => from
    ) do |format|
      format.text
    end
  end
  
end
