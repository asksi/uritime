class GroupsController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show]
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    before_action :set_admin_user, only: [:edit, :update, :destroy]
    
    
    
    
    def show
        @admin_user = @group.user
        # @group_users = GroupUser.find_by(group_id: params[:id])
        
        @users = @group.users.order(id: :desc).page(params[:page]).per(10)
  
    end
    
    def index
        # 自分の所属するグループを一覧で表示したい。feed_groupsはmodels/userで定義
        @groups = current_user.feed_groups.order(id: :desc).page(params[:page]).per(10)
        
    end
    
    def create
        @group = Group.new
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def set_admin_user
        # @user = User.find(params[:id])
        @admin_user = @group.user
        unless current_user == @admin_user
            redirect_back(fallback_location: groups_path)
        end
        
    end
  
    
    def set_group
        @group = Group.find(params[:id])
    end
  
    def group_params
        params.require(:group).permit(:name, :introduction)
    end
end
