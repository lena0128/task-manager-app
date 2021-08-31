class SessionsController < ApplicationController

    def new
        #@user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            flash[:message] = 'You have successfully logged in'
            redirect_to user_path(@user)
        else
            flash[:message] = 'Invalid username or password. Please try again.'
            render :new
        end
    end

    def destroy
        session.clear
        flash[:message] = "Goodbye!"
        redirect_to login_path
    end

end