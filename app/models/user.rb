class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: {maximum: 255 }, 
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, 
                     uniqueness: { case_sensitive: false }
    validates :profile, length: { maximum: 500 }
    mount_uploader :image, ImageUploader
    has_secure_password
    
    has_many :calendars
    has_many :groups
    has_many :group_users
    has_many :join_groups, through: :group_users, source: :group
    
    def join(group)
        group_users.find_or_create_by(group_id: group.id)
    end
    
    def leave(group)
        group_user = group_users.find_by(group_id: group.id)
        group_user.destroy if group_user
    end
    
    def join?(group)
        self.join_groups.include?(group)
    end
    
    # 自分が加入するグループを一覧で表示するための定義
    def feed_groups
        # id_list = Group.where(id: self.join_group_ids) + Group.where(user_id: self.id)
        # Group.where(id: id_list)
        id_list1 = Group.where(id: self.join_group_ids)
        id_list2 = Group.where(user_id: self.id)
        Group.where(id: id_list1 + id_list2)
        # これだと.orderが使えない
        # Group.where(id: self.join_group_ids) + Group.where(user_id: self.id)
    end

end
