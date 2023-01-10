# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# models/admin.rbから移動し、10-13行目を記入。
Admin.create!(
    email: 'test@test.com',
    password: 'mamo9292',
)
# rails db:seedを実行。
# rails cを実行し、Admin.allかAdmin.lastを入力。
# 次、Adminトップページを作成。
# model-migration-routing-controller-viewの順で作成。
# routes.rbに移動。