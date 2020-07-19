module UsersHelper
    def icon_url(user)
        if user.image?
            image_tag user.image.url, size: '100x100', class: "rounded-circle"
        else
            image_tag "l_e_others_501.png", alt: "default icon", id: "assets", class: "image, rounded-circle", size: '100x100'
        end
    end
    
    def image_url(user)
        if user.image?
            image_tag user.image.url, size: '250x250', class: "rounded-circle"
        else
            image_tag "l_e_others_501.png", alt: "default icon", id: "assets", class: "image, , rounded-circle", size: '250x250'
        end
    end
end
