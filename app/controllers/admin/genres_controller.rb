class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
  @genres=Genre.page(params[:page]).per(8)
  @genre=Genre.new
  end
  
  def create
    @genre=Genre.new(genre_params)
    @genre.save
    redirect_back(fallback_location: root_path) #redirect_backは、直前のページにリダイレクトすること。詳しくは、https://railsdoc.com/page/redirect_backを参照。
  end
  
  def edit
    @genre=Genre.find(params[:id])
  end
  
  def update
    @genre=Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name, :) #statusを記入。
  end
    

end
