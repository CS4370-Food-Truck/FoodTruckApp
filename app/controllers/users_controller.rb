class UsersController < ApplicationController
    
    #New user instance
    def new
        @user = User.new
    end
    
    #Creats a new user and redirects to the trucks table
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User created."
            redirect_to(trucks_path)
       else
            render('new')
       end
    end

    #These are the only parameters permitted for the user sign up form
    private
        def user_params
            params.require(:user).permit(:username, :password)
        end


end