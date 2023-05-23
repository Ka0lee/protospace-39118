class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
  end

  def new
    @user = user.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 保存成功時の処理
      redirect_to @user
    else
      # 保存失敗時の処理
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :password_confirmation)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
