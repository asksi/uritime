module GroupsHelper
    
    # 定義しなおす必要アリ　グループIDを選択したものにグループなびばーを追加できるようにしたい
    def current_group
        @current_group ||= Group.find_by(id: params[:group_id])
    end
    
    def current_group?
        !!current_group
    end
    
     # これ必要かな？
    def adimin_user
         @admin_user = @group.user
    end
    
end
