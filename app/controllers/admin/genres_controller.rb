class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
  @genres=Genre.all
  @genre=Genre.new #新規に取得したレコードなので、自動的にcreateアクションが動く。
  end
  
  def create
    @genre=Genre.new(genre_params)
    @genre.save
    redirect_back(fallback_location: root_path) #redirect_backは、直前のページにリダイレクトすること。詳しくは、https://railsdoc.com/page/redirect_backを参照。
  end
  
  def edit
    @genre=Genre.find(params[:id]) #既存のレコードを取得しているのでupdateアクションへ自動的に振り分けられ、動く。
  end
  
  def update
    @genre=Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
    #updateしたらindexに遷移するため、パスはadmin_genres_path
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name) #:valid_invalid_statusを記入する場合は、例えば季節限定で販売するような商品がある場合。そのときに販売中か販売停止中かを表示するステータス。
  end
    
end
