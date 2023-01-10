class Admin < ApplicationRecord
  has_many :items, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # devise :database_authenticatable, :registerable,の:registerable,の部分を今回はconsoleからしか登録できないようにするため削除（誰でも登録できないようにする）
  # この次、Adminのアカウントを追加するのだが、db/seeds.rbに移動
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
