class ContentsController < ApplicationController
  def new
    @content = Content.new
  end
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @content = Content.find(params[:id])
  end
  def search
    @contents = Content.search(params[:keyword]).order("visit DESC")
  end
  
  private

  def content_params
    params.require(:content).permit(:explain, :visit, :prefecture_id, {images: []}).merge(user_id: current_user.id)
  end

end
