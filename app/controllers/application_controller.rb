class ApplicationController < ActionController::Base
    
    include SessionsHelper
    include GroupsHelper
    
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    # いらないかもしれないお
    # def correct_group
    #     @group = current_user.join_groups.find_by(user_id: params[:id])
    #     unless @group
    #         redirect_back(fallback_location: group_path)
    #     end
    # end
end
