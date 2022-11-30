class SessionsController < ApplicationController
    
    #This is what lets a user "sign-in"
    def create
        user = User.find_by(username: params[:session][:username])
        if user !=nil && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully."
            redirect_to(trucks_path)
        else
            flash[:notice] = "There was something wrong with your login.  Please re-enter your login."
            redirect_to(login_path)
        end
    end

    #This is what signs a user out
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You are now logged out."
        redirect_to(trucks_path)
    end

    
end