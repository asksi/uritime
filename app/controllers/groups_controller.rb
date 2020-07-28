class GroupsController < ApplicationController
    before_action :require_user_logged_in, only: [:index]
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    before_action :set_admin_user, only: [:edit, :update, :destroy]
    
    def new
        @users = User.all
        # @group_user = GroupUser.build
        # groups/newのアクション
        @group = Group.new
        @group.users << current_user
    end
    
    
    def show
        if current_user.join?(@group)
            @admin_user = @group.user
            @users = @group.users.order(id: :desc).page(params[:page]).per(10)
        else
            redirect_back(fallback_location: groups_path)
        end
    end
    
    def index
        # 自分の所属するグループを一覧で表示したい。feed_groupsはmodels/userで定義
        @groups = current_user.feed_groups.order(id: :desc).page(params[:page]).per(10)
        
    end
    
    def create
        @group = current_user.groups.build(group_params)
        if @group.save
            # チェックボックスに自分のチェックを外した場合、グループに入ることはできない。どうしたら？？
            # unless @group.users << @group.user
            #      @group.users << @group.user
            # end
            flash[:success] = 'グループを作成しました'
            redirect_to groups_path
        else
            @users = User.all
            flash.now[:danger] = 'グループの作成に失敗しました'
            render :new
        end
    end
    
    def edit
        @users = User.all

    end
    
    def update
        if @group.update(group_params)
            flash[:success] = 'グループを編集しました'
            redirect_to group_path
        else
            @users = User.all
            flash.now[:danger] = 'グループを編集できませんでした。'
            render :edit
        end
    end
    
    def destroy
        @group.destroy
        flash[:success] = 'グループを削除しました。'
        redirect_to groups_path
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
        params.require(:group).permit(:name, {user_ids: []}, :introduction)
    end
    

end
