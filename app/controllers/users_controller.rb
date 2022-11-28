class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        if Figaro.env.TESTING == "true"
            @user = User.new(user_params)
            if @user.save
                flash[:notice] = "User created."
                redirect_to(trucks_path)
            else
                render('new')
            end
        else
            flash[:notice] = "You are not allowed to create a user."
            redirect_to(trucks_path)
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end


end