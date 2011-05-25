class User < ActiveRecord::Base
    acts_as_authentic
    serialize :roles
    
    has_many  :characters
    
    def after_initialize
      self[:roles] = self[:roles] || []
    end
    
    def active?
      active
    end
    
    def activate!
      self.active = true
      save
    end
    
    def deactivate!
      self.active = false
      save
    end
    
    def send_registration_instructions!
      reset_perishable_token!
      Notifier.registration_instructions(self).deliver
    end
    
    def send_activation_instructions!
      reset_perishable_token!
      Notifier.activation_instructions(self).deliver
    end
    
    def send_activation_confirmation!
      reset_perishable_token!
      Notifier.activation_confirmation(self).deliver
    end
    
    def email_address_with_name
      #"#{self.name} <#{self.email}>"
      self.email
    end
    
    def admin?
      self[:roles] && self[:roles].include?(Role::ADMIN)
    end
end
