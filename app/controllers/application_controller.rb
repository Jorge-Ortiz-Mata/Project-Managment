class ApplicationController < ActionController::Base

    helper_method :current_user, :user_has_profile?

    private
        def user_has_sign_in?
            if !(current_user)
                redirect_to new_user_session_path, notice: "Please, sign in."
            end
        end

        def user_has_profile?
            if current_user.profile.nil?
                redirect_to new_profile_path, notice: "Now, create your own profile."
            end 
        end
end
