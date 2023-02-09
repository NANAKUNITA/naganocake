class Public::HomesController < ApplicationController
#ここではログインする必要がないので、before_action :authenticate_モデル名！はいらない
 def top
     #販売中は他の表記に変えるかどうか
     @items=Items.where(is_active: "販売中")
 end
 
 def about
 end
 
end
