class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:session][:username])
        if user !=nil && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully."
            redirect_to(trucks_path)
        else
            flash[:notice] = "There was something wrong with your login.  Please re-enter your login."
            render('new')
        end
    end

    def destroy
        #session.delete(:current_user_id)
        session[:user_id] = nil
        #@_current_user = nil
        flash[:notice] = "You are now logged out."
        redirect_to(trucks_path)
    end

    
end