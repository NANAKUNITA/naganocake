# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者アカウント
Admin.create(:email => 'chan@mail', :password => 'chan1234')


#genre
Genre.create!(:name => "ケーキ")
Genre.create!(:name => "マフィン")
Genre.create!(:name => "ムース")
Genre.create!(:name => "プリン")
Genre.create!(:name => "クッキー")

#item
Item.create!(:name => "ショートケーキ", :price => 900, :genre_id => 1, :introduction => "大粒イチゴを使用した、定番のケーキ")
Item.create!(:name => "モンブラン", :price => 900, :genre_id => 1, :introduction => "丹波栗を使用した、秋の味覚")
Item.create!(:name => "カラフルカップケーキ", :price => 900, :genre_id => 1, :introduction => "一度は食べたい！アメリカンなカラフルなカップケーキ")
Item.create!(:name => "チョコレートムース", :price => 900, :genre_id => 3, :introduction => "カカオ７０％で作った、濃厚なチョコレートムース")
Item.create!(:name => "いちごムース", :price => 900, :genre_id => 3, :introduction => "とちおとめを使用した、当店大人気のいちごムース")
Item.create!(:name => "バニラプリン", :price => 900, :genre_id => 4, :introduction => "昔ながらの硬めプリン。クセになります！")
Item.create!(:name => "バタークッキー", :price => 900, :genre_id => 5, :introduction => "レシピは創業当時から同じ！後味が軽く、最後まで美味しく食べられます")

