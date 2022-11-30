class ApplicationController < ActionController::Base

    #methods that's used in our views to control what data is shown 
    helper_method :current_user, :logged_in?

    #holds data of the currently authenticated user
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    #verifies if there is a user thats logged in
    def logged_in?
        !!current_user
    end

    #used in trucks controller to restrict views if no luser is logged in
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to(login_path)
        end
    end

    
    #detect device type and request corresponding variant
    before_action :detect_device_type

    private
    def detect_device_type
        case request.user_agent
        when /iPad/i
            request.variant = :phone
        when /iPhone/i
            request.variant = :phone
        when /Android/i && /mobile/i
            request.variant = :phone
        when /Android/i
            request.variant = :phone
        when /Windows Phone/i
            request.variant = :phone
        end
    end

end
