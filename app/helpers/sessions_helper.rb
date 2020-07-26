module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
    
    def current_group
        @current_group ||= Group.find_by(id: params[:id])
    end
    
    def current_group?
        !!current_group
    end
end
