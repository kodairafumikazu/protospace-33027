class PrototypesController < ApplicationController
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype.create(prototype_params)
  end

  # def message_params
  #   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  # end
end
