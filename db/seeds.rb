# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

# CSVファイルを読み込み、DB（テーブル）へ保存
CSV.foreach('db/csv/prefecture.CSV', encoding: "Shift_JIS:UTF-8") do |row|
  prefecture_name = row[CSVROW_PREFNAME]
  city_name = row[CSVROW_CITYNAME]
  prefecture = Prefecture.find_or_create_by(name: prefecture_name)
  City.find_or_create_by(name: city_name, prefecture_id: prefecture.id)
end

Admin.create!(
   email: 'admin@admin',
   password: 'testmao'
)
