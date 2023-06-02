class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user_name = current_user.user_name(params[:id])
    @prototypes = current_user.prototypes
  end
end
