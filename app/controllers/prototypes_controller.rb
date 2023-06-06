class PrototypesController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show,:new]
  before_action :set_prototype,only:[:show,:edit,:update,:destroy]
  before_action :contributor_confirmation, only: [:edit, :update,:destroy]

  def index
    @prototypes=Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototype.build(prototype_params)

    if @prototype.save
      redirect_to root_path  # 保存成功時の処理
    else
      render :new #保存失敗時の処理
    end
  end

def show
   @comment = Comment.new
   @comments = @prototype.comments.includes(:user)

end

def edit

end

def update
  if @prototype.update(prototype_params)
    redirect_to root_path
  else
    render :edit
  end
end

def destroy
  @prototype.destroy
  redirect_to prototypes_path
end
  

  private

    def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image,).merge(user_id: current_user.id)
    end

    def set_prototype
      @prototype = Prototype.find(params[:id]) 
    end


    def contributor_confirmation
      redirect_to root_path unless @prototype.user == current_user
    end
   
  
  end  

