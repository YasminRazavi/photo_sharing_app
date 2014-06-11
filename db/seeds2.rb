

#Generating 2 users

user4 = User.create(:first_name=>"Lisa", :last_name => "Smith", :avatar => "http://www.thewellingtonplasticsunit.com/images/side2.jpg", :email => "lisa@gmail.com", :password =>"password", :role => "user")
user5 = User.create(:first_name=>"Bob", :last_name => "Jones", :avatar => "http://www.brocku.ca/brock-news/wp-content/uploads/cache/3395_NpAdvHover.jpg", :email => "bob@gmail.com", :password =>"password", :role => "user")


# Generating two collections per user3

col7 = Collection.create(:title => "surfboards", :description => "Nice surfboards", :user_id=>4)
col8 = Collection.create(:title => "teapots", :description => "Lovely teapots", :user_id=>4)
col9 = Collection.create(:title => "bow ties", :description => "My favorite bow-ties", :user_id=>5)
col10 = Collection.create(:title => "umbrellas", :description => "Amazing umbrellas", :user_id=>5)

# Generating four photos per collection
#surfboards
photo1 = Photo.create(:title=> "Silver pen", :user_id=>4, :collection_id=>4, :caption=>"pen from van", :image=>"http://johnlewis.scene7.com/is/image/JohnLewis/230953752?$prod_main$")

photo2 = Photo.create(:title=> "black pen", :user_id=>4, :collection_id=>4, :caption=>"pen from london", :image=>"http://fpgeeks.com/wp-content/uploads/2013/04/parker_duofold_mandarin_yellow_fountain_pen_limited_edition-e1366989899963.jpg")
photo3 = Photo.create(:title=> "red pen", :user_id=>4, :collection_id=>4, :caption=>"pen from van", :image=>"http://s7ondemand4.scene7.com/is/image/Signet/9890300?$detail$")

photo4 = Photo.create(:title=> "green pen", :user_id=>4, :collection_id=>4, :caption=>"pen from paris", :image=>"http://mont-blanc-pens.info/wp-content/uploads/2008/10/montblanc_limited_edition_boheme_papillon_fountain_pen.png")

#teapots
photo5 = Photo.create(:title=> "smiley tshirt", :user_id=>4, :collection_id=>5, :caption=>"mom bought this pour moi when I was 5", :image=>"http://www.articlesweb.org/blog/wp-content/gallery/fun-shirts-a-new-dressing-tradition-among-youngsters/fun-shirts-a-new-dressing-tradition-among-youngsters-4.jpg")
photo6 = Photo.create(:title=> "upset t-shirt", :user_id=>4, :collection_id=>5, :caption=>"i lost a running competition", :image=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS5WLLVgPSac_Nz-e9pBAi7v1FFb-rLJunGAfnZrmAFPH9iY9h2nQL7xrQ")
photo7 = Photo.create(:title=> "Comme de garcon", :user_id=>4, :collection_id=>5, :image=>"http://www.monsieurjerome.com/wp-content/uploads/2012/08/a-bathing-ape-x-play-comme-des-garcons-2012-capsule-collection-4.jpg")
photo8 = Photo.create(:title=> "cool t", :user_id=>4, :collection_id=>5, :caption=>"KWEL", :image=>"http://www.songhi.com/wp-content/uploads/2014/02/staycool.jpg")


#bowties
photo9 = Photo.create(:title=> "Nikes", :user_id=>5, :collection_id=>6, :caption=>"Airmax", :image=>"http://www.theoriginators.com/wp-content/uploads/2013/06/nike-air-max-1-sp-zig-zag-2.jpg")
photo10 = Photo.create(:title=> "New Balances", :user_id=>5, :collection_id=>6, :caption=>"UHUMMMMMM!!!!", :image=>"http://i.telegraph.co.uk/multimedia/archive/02437/NB_2437889b.jpg")
photo11 = Photo.create(:title=> "adidas", :user_id=>5, :collection_id=>6, :caption=>"San Smiths", :image=>"http://designyoutrust.com/wp-content/uploads/2014/01/adidas-stan-smith-reissue-large-650x745.jpg")
photo12 = Photo.create(:title=> "Converse", :user_id=>5, :collection_id=>6, :caption=>"All Stars heehee", :image=>"http://1.bp.blogspot.com/_4XVETITnjzg/TN1wVeInsuI/AAAAAAAAALs/1R2-feTs174/s1600/7420_converse-all-star-pins-hi-black-blue-l.jpg")

#umbrellas
photo13 = Photo.create(:title=> "Cool bike", :user_id=>5, :collection_id=>7, :image=>"http://www.skyhdwallpapers.com/wp-content/uploads/2013/03/lge_e350-orange.jpg")
photo14 = Photo.create(:title=> "kinda mehhh acutally", :user_id=>5, :collection_id=>7, :image=>"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRztDDV1ZYJpnSugABJ9Twa18c_xjmR-boT_V6qHiuefR_WJacx")

photo15 = Photo.create(:title=> "Cervelo", :user_id=>5, :collection_id=>7, :image=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRWBABS3ImVoXKb-60WgSb5LOFbAhRTjsuU9Z1Se6Zz0v5Ok6_E")

photo16 = Photo.create(:title=> "Cervelo", :user_id=>5, :collection_id=>7, :image=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSe_tKGcu8VT3ojeU_XL9qZe6ERCyiuOZ59gfj7ORnzVudYUEqrTg")


#shoes
photo17 = Photo.create(:title=> "YSL Mohawk Pumps", :user_id=>2, :collection_id=>5, :image=>"http://www.shoewawa.com/assets_c/2010/10/kylie-minogue-ysl-thumb-435x290-109494.jpg", :caption=> "these are actually 7inches!")
photo18 = Photo.create(:title=> "Carven Bow Heels", :user_id=>2, :collection_id=>5, :image=>"http://media-cache-ec0.pinimg.com/236x/2d/98/49/2d98498e037f31a741927e24015b02bd.jpg", :caption=> "Love from Paris :)")
photo19 = Photo.create(:title=> "Brian Atwoods", :user_id=>2, :collection_id=>5, :image=>"https://lh3.googleusercontent.com/-yLPsgJYkVNs/TXWNypQjgSI/AAAAAAAABmM/NNtNGtElUhc/s1600/Mai-Lamore-black-feather-platform-heel3.jpg", :caption=> "these bad bad girls")
photo20 = Photo.create(:title=> "Acne Boots", :user_id=>2, :collection_id=>5, :image=>"http://donnellygroup.ca/wp-content/uploads/2012/03/Acne-Boots-1.jpg", :caption=> "Acnes are the best")

#sunglasses
photo21 = Photo.create(:title=> "Gross and Cutler", :user_id=>2, :collection_id=>6, :image=>"http://graceormonde.com/wp-content/uploads/2012/06/cutler-and-gross-sunglasses.jpg", :caption=> "So hip haha")

photo22 = Photo.create(:title=> "Karen Walker", :user_id=>2, :collection_id=>6, :image=>"http://madisonplus.com/wp-content/uploads/2010/04/sunglasses01.jpg", :caption=> "vintage 89")
photo23 = Photo.create(:title=> "Prada Flower Sunglasses", :user_id=>2, :collection_id=>6, :image=>"http://images2.trendnstylez.com/wp-content/uploads/2013/02/sunglasses-trends-2013-prada-floral-sunglasses.jpg", :caption=> "bought summer 2012")
photo24 = Photo.create(:title=> "Prada Flower Sunglasses", :user_id=>2, :collection_id=>6, :image=>"https://s3.amazonaws.com/assets.svpply.com/large/708696.jpg?1401214165", :caption=> "my dad's")