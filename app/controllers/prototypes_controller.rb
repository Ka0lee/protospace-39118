class PrototypesController < ApplicationController
  def index
  end

  def new
    @user = user.new
  end

  
end
