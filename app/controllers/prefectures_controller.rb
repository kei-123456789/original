class PrefecturesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @prefectures = Prefecture.all
    @content = Content.new
  end
  def show
    @prefecture = Prefecture.find(params[:id])
    @content = Content.new
    @contents = @prefecture.contents.order("visit DESC")
  end
end
