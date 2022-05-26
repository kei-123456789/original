class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end
  def show
    @prefecture = Prefecture.find(params[:id])
    @content = Content.new
    @contents = @prefecture.contents.order("visit DESC")
  end
end
