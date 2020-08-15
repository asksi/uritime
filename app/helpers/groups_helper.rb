module GroupsHelper
    
    # 定義しなおす必要アリ　グループIDを選択したものにグループなびばーを追加できるようにしたい
    def current_group
        @current_group ||= Group.find_by(id: params[:group_id])
    end
    
    def current_group?
        !!current_group
    end
    
    # _2navbar, layouts/groups.html.erb
    def current__group
        @current__group ||= Group.find_by(id: params[:id])
    end
    
    def current__group?
        !!current__group
    end
    
    
end
