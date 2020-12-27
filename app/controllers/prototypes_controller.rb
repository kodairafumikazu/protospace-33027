class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  #before_action :authenticate_user!
  #before_action :configure_permitted_parameters, if: :devise_controller?


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
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
    @prototype = Prototype.find(params[:id])
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
    # @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)#s: [])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
