class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)

    if @user.save
      # 保存成功時の処理
      redirect_to action: :index
    else
       #保存失敗時の処理
      render :new
    end
  end

  def show
    
  end
  
  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
