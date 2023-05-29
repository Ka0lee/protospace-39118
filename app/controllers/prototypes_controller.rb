class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
    @prototypes=Prototype.all
  end

  def new
    @user = User.new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)

    if @prototype.save
 
      redirect_to root_path  # 保存成功時の処理
    else
      render :new #保存失敗時の処理
    end
  end

  def destroy
    @Prototype.find(params[:id])
    @prototype.destroy
    redirect_to prototypes_path
  end
  
  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image,).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
