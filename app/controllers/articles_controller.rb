class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
  end
  def create
    render plain: params[:article].inspect
  end
end
