class UsersController < ApplicationController
   def create
      @user = User.new(user_params)
      if @user.save
         flash[:success] = "Thanks for registering!"
         redirect_to @user
      else
         render 'new'
      end
   end

   def new
      @user = User.new
   end

   def show
      @user = User.find(params[:id])
   end

   private
      def user_params
         params.require(:user).permit(:first_name,
                                      :last_name,
                                      :email,
                                      :password,
                                      :password_confirmation,
                                      :photo)
      end
end
