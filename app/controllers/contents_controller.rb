class ContentsController < ApplicationController
  def new
    @content = Content.new
  end
  def create
    @content = Content.new(content_params)
  end

  private

  def content_params
    params.require(:content).permit(:explain, :visit, :prefecture_id, :image).merge(user_id: current_user.id)
  end

end
