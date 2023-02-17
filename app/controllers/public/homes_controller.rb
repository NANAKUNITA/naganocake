class Public::HomesController < ApplicationController
#ここではログインする必要がないので、before_action :authenticate_モデル名！はいらない
 def top
  @items = Item.limit(4)
 end
 
 def about
 end
 
end
