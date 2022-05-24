class PrefecturesController < ApplicationController
  def index
    @prefecture = Prefecture2.all
  end
  def show
    @prefecture = Prefecture2.find(params[:id])
  end
end
