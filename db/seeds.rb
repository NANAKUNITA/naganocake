# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者アカウント
Admin.create(:email => 'chan@mail', :password => 'chan1234')

#customerの人物
Customer.create(:email => 'nihonbashi@nihonbashi', :password => 'nihonbashi1234', :last_name => "山田", :first_name => "洋次", :last_name_kana => "ヤマダ", :first_name_kana => "ヨウジ", :telephone_number => "08000000000", :postal_code => "3000001", :address => "東京都港区海岸町1")
Customer.create(:email => 'okachimachi@okachimachi', :password => 'okachimachi1234', :last_name => "田村", :first_name => "優", :last_name_kana => "タムラ", :first_name_kana => "ユウ", :telephone_number => "02000000000", :postal_code => "1000001", :address => "東京都練馬区下赤塚1")
Customer.create(:email => 'daimon@daimon', :password => 'daimon1234', :last_name => "尾上", :first_name => "右近", :last_name_kana => "オノエ", :first_name_kana => "ウコン", :telephone_number => "04000000000", :postal_code => "4000001", :address => "東京都江東区有明1")
Customer.create(:email => 'mita@mita', :password => 'mita1234', :last_name => "佐久間", :first_name => "大輔", :last_name_kana => "サクマ", :first_name_kana => "ダイスケ", :telephone_number => "05000000000", :postal_code => "5000001", :address => "東京都台東区1")

#
Address.create!(:customer_id => 1, :name => "近藤麻美", :postal_code => "6000001", :address => "東京都港区台場1")
Address.create!(:customer_id => 2, :name =>"山崎仁", :postal_code => "7000001", :address => "東京都杉並区高円寺1")
Address.create!(:customer_id => 3, :name => "中川大知", :postal_code => "9000001", :address => "東京都渋谷区笹塚1")

#genre
Genre.create!(:name => "ケーキ")
Genre.create!(:name => "マフィン")
Genre.create!(:name => "ムース")
Genre.create!(:name => "プリン")
Genre.create!(:name => "クッキー")

#item
Item.create!(:name => "ショートケーキ", :price => 900, :genre_id => 1, :introduction => "大粒イチゴを使用した、定番のケーキ")
Item.create!(:name => "モンブラン", :price => 900, :genre_id => 1, :introduction => "丹波栗を使用した、秋の味覚")
Item.create!(:name => "カラフルカップケーキ", :price => 800, :genre_id => 1, :introduction => "一度は食べたい！アメリカンなカラフルなカップケーキ")
Item.create!(:name => "チョコレートムース", :price => 900, :genre_id => 3, :introduction => "カカオ７０％で作った、濃厚なチョコレートムース")
Item.create!(:name => "いちごムース", :price => 900, :genre_id => 3, :introduction => "とちおとめを使用した、当店大人気のいちごムース")
Item.create!(:name => "バニラプリン", :price => 700, :genre_id => 4, :introduction => "昔ながらの硬めプリン。クセになります！")
Item.create!(:name => "バタークッキー", :price => 700, :genre_id => 5, :introduction => "レシピは創業当時から同じ！後味が軽く、最後まで美味しく食べられます")

#order
Order.create!(:customer_id => 1, :name => "伊野混", :postal_code => "1234567", :address => "北海道札幌市123-456", :shipping_cost => 800, :payment_method => 0, :total_payment => 4550, :status => 0)
Order.create!(:customer_id => 2, :name => "古太", :postal_code => "1324567", :address => "北海道倶知安町123-456", :shipping_cost => 800, :payment_method => 0, :total_payment => 5550, :status => 1)
Order.create!(:customer_id => 3, :name => "三田参", :postal_code => "1235467", :address => "千葉県木更津市123-456", :shipping_cost => 800, :payment_method => 1, :total_payment => 6550, :status => 3)
Order.create!(:customer_id => 1, :name => "来栖翔", :postal_code => "1234576", :address => "京都府上条区123-456", :shipping_cost => 800, :payment_method => 0, :total_payment => 8550, :status => 2)
Order.create!(:customer_id => 2, :name => "迫田さこ", :postal_code => "1238567", :address => "東京都西東京市123-456", :shipping_cost => 800, :payment_method => 1, :total_payment => 9550, :status => 4)

#order_detail
OrderDetail.create!(:order_id => 1, :item_id => 1, :price => 900, :amount => 1, :making_status => 0)
OrderDetail.create!(:order_id => 2, :item_id => 2, :price => 4500, :amount => 5, :making_status => 1)
OrderDetail.create!(:order_id => 3, :item_id => 3, :price => 900, :amount => 1, :making_status => 2)
OrderDetail.create!(:order_id => 4, :item_id => 4, :price => 900, :amount => 1, :making_status => 3)