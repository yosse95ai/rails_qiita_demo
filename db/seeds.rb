# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cmp1 = Company.create(name: "販売店１", company_code: "v-001")
cmp2 = Company.create(name: "販売店２", company_code: "v-002")
cmp3 = Company.create(name: "販売店３", company_code: "v-003")
cmp4 = Company.create(name: "製造業者１", company_code: "m-001")
cmp5 = Company.create(name: "製造業者２", company_code: "m-002")
cmp6 = Company.create(name: "製造業者３", company_code: "m-003")
itm = Item.create(name: "製品１")
itm.vendor = cmp1
itm.manufacturer = cmp4
itm.save
itm2 = Item.create(name: "製品２")
itm2.vendor = cmp2
itm2.manufacturer = cmp5
itm2.save
itm3 = Item.create(name: "製品３")
itm3.vendor = cmp3
itm3.manufacturer = cmp6
itm3.save
f = Prefecture.create(name: "福岡県")
t = Prefecture.create(name: "東京都")
k = Prefecture.create(name: "京都府")
o = Prefecture.create(name: "大阪府")
h = Prefecture.create(name: "北海道")
cmp1.branches = [f, k]
cmp2.branches = [k]
cmp3.branches = [f, k, o, h]
cmp4.branches = [k, h]
cmp5.branches = [f, k, o]
cmp6.branches = [t]
cmp1.prefecture = t
cmp2.prefecture = t
cmp3.prefecture = t
cmp4.prefecture = t
cmp5.prefecture = t
cmp6.prefecture = h
cmp1.save
cmp2.save
cmp3.save
cmp4.save
cmp5.save
cmp6.save
us = User.create(name: "usr01")
us2 = User.create(name: "usr02")
us.friending(us2)
us2.wishlists = [itm3]
