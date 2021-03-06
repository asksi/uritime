module UsersHelper
    def icon_url(user)
        if user.image?
            image_tag user.image.url, size: '50x50', class: "mr-2 rounded-circle"
        else
            image_tag "l_e_others_501.png", alt: "default icon", id: "assets", class: "image, rounded-circle", size: '50x50'
        end
    end
    
    def mini_url(user)
        if user.image?
            image_tag user.image.url, size: '15x15', class: "rounded-circle"
        else
            image_tag "l_e_others_501.png", alt: "default icon", id: "assets", class: "image, rounded-circle", size: '15x15'
        end
    end
    
    def image_url(user)
        if user.image?
            image_tag user.image.url, size: '250x250', class: "rounded-circle"
        else
            image_tag "l_e_others_501.png", alt: "default icon", id: "assets", class: "image, rounded-circle", size: '250x250'
        end
    end
end
