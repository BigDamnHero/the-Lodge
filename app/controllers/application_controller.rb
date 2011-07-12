class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :setup_session

    helper :all
    helper_method :current_user, :is_admin
        
    private
    
    def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
    end
    
    def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.record
    end
    
    def has_role(role)
        return current_user && current_user.roles.include?(role)
    end
    
    def require_user
        unless current_user
            store_location
            redirect_to(login_url, :notice => 'You must be logged in to access this page')
            return false
        end
    end
    
    def is_admin
        has_role Role::ADMIN
    end
    
    def require_admin
        require_role Role::ADMIN
    end
    
    def require_role(role)
        unless has_role role
            redirect_to :root
            return false
        end
    end
    
    def require_no_user
        if current_user
            store_location
            redirect_to(:root, :notice => 'You must be logged out to access this page')
            return false
        end
    end
    
    def require_one_perm(permSet)
    
    end
    
    def require_all_perms(permSet)
    
    end
    
    def store_location
        session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default, notice)
        redirect_to(session[:return_to] || default, :notice => notice)
        session[:return_to] = nil
    end
    
    def setup_session
        @user_session = current_user_session || UserSession.new
    end
end
