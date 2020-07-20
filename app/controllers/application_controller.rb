class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    # def correct_user
    #     @calendar = current_user.calenders.find_by(id: params[:id])
    #     unless @calendar
    #       redirect_to root_url
    #     end
    # end
  
end
