class AnimalsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_animal, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @animals = Animal.includes(:user).order("created_at DESC")
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @animal.comments.includes(:user)
  end

  def search
    @animals = Animal.search(params[:keyword]) 
  end
  

  def edit
    @animal = Animal.find(params[:id])
  end 

  def update
    if @animal.update(animal_params)
       redirect_to animal_path  
    else
      render :edit
    end
  end

  def destroy
    if @animal.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end



  private

  def animal_params
    params.require(:animal).permit(:name, :charm_point, :genre, :gender, :birthday, :age, :prefecture, :image).merge(user_id: current_user.id)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

