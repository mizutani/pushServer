# -*- coding: utf-8 -*-
module AppUsersHelper
    def extend_app_user_path app_user
        app_user_path({:id => app_user[:id]})
    end
    def extend_edit_app_user_path app_user
        edit_app_user_path(:id => app_user[:id])
    end
    def app_user_form_path app_user
        if app_user.id.nil?
            app_users_path
        else
            extend_app_user_path app_user
        end
    end
end
