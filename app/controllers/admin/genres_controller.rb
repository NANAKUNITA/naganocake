class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
  @genres=Genre.page(params[:page]).per(8)
  @genre=Genre.new
  end

end
