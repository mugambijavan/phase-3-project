class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)    # Not the final implementation!

    if @user.save
      # Handle a successful save by creating a new User
      # redirect to User welcome page
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
