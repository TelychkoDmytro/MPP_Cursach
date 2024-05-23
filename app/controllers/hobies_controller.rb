class HobiesController < ApplicationController
  before_action :set_hoby, only: [:show]
  def new
  end

  def edit
  end

  def index
    @hobies = Hoby.all
  end

  def show
    @posts = @hoby.posts
  end

  private

  def set_hoby
    @hoby = Hoby.find(params[:id])
  end
end
