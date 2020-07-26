class CalendarsController < ApplicationController
  before_action :require_user_logged_in
  
  before_action :correct_user, only: [:show, :edit, :destroy, :update]
  
  
  def show
    # @calendar = current_user.calendars.find(params[:id])
  end
  
  def new
    @calendar = current_user.calendars.new
  end
  
  def create
    @calendar = current_user.calendars.build(calendar_params)
      if @calendar.save
        flash[:success] = "予定を追加しました。"
        redirect_to root_url
      else
        @calendars = current_user.calendars
        flash.now[:danger] = "予定が追加できませんでした。"
        render :new
      end
  end
  
  def edit
    # @calendar = current_user.calendars.find(params[:id])
  end
  
  def update
    # @calendar = current_user.calendars.find(params[:id])

    if @calendar.update(calendar_params)
      flash[:success] = "予定を更新しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "予定を更新できませんでした。"
      render :edit
    end
  end
  
  def destroy
    @calendar.destroy
    flash[:success] = "予定を削除しました。"
    redirect_to root_url
  end
  
  private
  
  def calendar_params
    params.require(:calendar).permit(:title, :content, :start_time, :end_time)
  end
  
  
  def correct_user
    @calendar = current_user.calendars.find_by(id: params[:id])
    unless @calendar
      redirect_to root_url
    end
  end
  
  

end