class GroupCalendarsController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_group_calendar, only: [:show, :edit, :update, :destroy]
    
    def show
        # @group_calendar = GroupCalendar.find_by(id: params[:id])
        # params[:group_id] = @group_calendar.group_id
        # @group = Group.find(params[:group_id])
    end

    def create
        @group_calendar = current_user.group_calendars.build(group_calendar_params)
        @group_id = params[:group_id]
        @group_calendar.group_id = @group_id
        @group = Group.find_by(id: params[:group_id])
          if @group_calendar.save
            flash[:success] = "予定を追加しました。"
            redirect_to calendar_group_path(@group)
          else
            @group_calendars = current_user.group_calendars
            flash.now[:danger] = "予定が追加できませんでした。"
            redirect_back(fallback_location: root_url)
          end
    end
    
    def edit
    end
    
    def update
        @group_calendar = current_user.group_calendars.find(params[:id])
        if @group_calendar.update(group_calendar_params)
          flash[:success] = "予定を更新しました。"
          redirect_to calendar_group_path(@group)
        else
          flash.now[:danger] = "予定を更新できませんでした。"
          render :edit
        end
    end
    
    def destroy
        @group_calendar = current_user.group_calendars.find(params[:id])
        @group_calendar.destroy
        flash[:success] = "予定を削除しました。"
         redirect_to calendar_group_path(@group)
    end
    
       
    
    private
    
   
    
    def set_group_calendar
        @group_calendar = GroupCalendar.find_by(id: params[:id])
        params[:group_id] = @group_calendar.group_id
        @group = Group.find_by(id: params[:group_id])
         
        unless current_user.join?(current_group)
            redirect_to groups_user_path(current_user)
        end
    end
    
    def group_calendar_params
        params.require(:group_calendar).permit(:title, :content, :start_time, :end_time, :group_id, :user_id)
    end
  
end
