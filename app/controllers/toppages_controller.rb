class ToppagesController < ApplicationController
  def index
    if logged_in?
      
        # カレンダー表示にする今はまだ。
        @calendars = current_user.calendars
    end
  end
  
  private
  
  
end
