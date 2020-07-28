module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
    
    def current_group
        @current_group ||= Group.find_by(id: params[:group_id])
    end
    
    def current_group?
        !!current_group
    end
    
    # def current_group?
        
    #     if current_user == group.users or group.user_id
end
