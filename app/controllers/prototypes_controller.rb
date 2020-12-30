class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :destory]
  before_action :move_to_edit, except: [:index, :show]  #edit
  before_action :set_prototype, only: [:edit, :show]
  
  #before_action :configure_permitted_parameters, if: :devise_controller?


  def index
    @prototypes = Prototype.all #.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def edit
    #@comment = Comment.new
    #@comments = @prototype.comments.includes(:user)
    #@prototype = Prototype.find(params[:id])
  end
  
  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)

    if #current_prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
     @comment = Comment.new
     @comments = @prototype.comments.includes(:user)
     #@prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  
  def move_to_edit #index
    unless user_signed_in?
      redirect_to action: :index #index
    end
  end

end
