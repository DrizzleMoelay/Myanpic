class PicsController < ApplicationController
  before_action :set_pic, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @pics = Pic.includes(:user).order("created_at DESC")
  end

  def new
    @pic = Pic.new
  end

  def create
    Pic.create(pic_params)
  end

  def destroy
    pic = Pic.find(params[:id])
    pic.destroy
  end

  def edit
  end

  def update
    pic = Pic.find(params[:id])
    pic.update(pic_params)
  end

  def show
    @comment = Comment.new
    @comments = @pic.comments.includes(:user)
  end 

  def search
    @pics = Pic.search(params[:keyword])
  end

  private
  def pic_params
    params.require(:pic).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_pic
    @pic = Pic.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
