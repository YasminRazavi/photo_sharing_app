User.delete_all
Comment.delete_all
Photo.delete_all
Collection.delete_all

#Generating users

user1 = User.new(:first_name=>"Sarah", :last_name => "Knight", :remote_avatar_url => "https://avatars0.githubusercontent.com/u/6461304?s=400", :email => "sara@gmail.com", :password =>"password", :role => "user", :bio => "I'm from Oxford, and I love t-shirts and pens.")
user2 = User.new(:first_name=>"Yasmin", :last_name => "Razavi", :remote_avatar_url => "https://scontent-a-lhr.xx.fbcdn.net/hphotos-xpa1/t1.0-9/10341937_10201334716164102_507462187152992426_n.jpg", :email => "yasmin@gmail.com", :password =>"password", :role => "user")
user3 = User.new(:first_name=>"Sri", :last_name => "Mohan", :remote_avatar_url => "https://avatars2.githubusercontent.com/u/5783383?s=400", :email => "sri@gmail.com", :password =>"password", :role => "user")
user4 = User.new(:first_name=>"Liz", :last_name => "Smith", :remote_avatar_url => "http://www.thewellingtonplasticsunit.com/images/side2.jpg", :email => "liz@gmail.com", :password =>"password", :role => "user")
user5 = User.new(:first_name=>"Bob", :last_name => "Jones", :remote_avatar_url => "http://www.brocku.ca/brock-news/wp-content/uploads/cache/3395_NpAdvHover.jpg", :email => "bob@gmail.com", :password =>"password", :role => "user")
user6 = User.new(:first_name=>"Daisy", :last_name => "Simmons", :email => "daisy@gmail.com", :password =>"password", :role => "user", :bio => "I really just love collecting stuff.")
user7 = User.new(:first_name=>"Ed", :last_name => "Woodward", :email => "ed@gmail.com", :password =>"password", :role => "user", :bio => "My passion is sharing photos.")
sriUserMatt = User.new(:first_name=>"Matt", :last_name => "Smith",:remote_avatar_url => "http://upload.wikimedia.org/wikipedia/en/2/28/Deep_Fried_Man_portrait_-_real_name_Daniel_Friedman_-_South_African_Comedian.jpg", :email => "matt@gmail.com", :password =>"password", :role => "user", :bio => "I love collecting vintage vinyl")
sriUserLisa = User.new(:first_name=>"Lisa", :last_name => "Andrews",:remote_avatar_url => "http://10ambeauty.com/wp-content/uploads/2013/01/Wearing-NARS-And-God-Created-The-Woman.jpg", :email => "lisa2@gmail.com", :password =>"password", :role => "user", :bio => "Flowers are amazing")

[user1, user2, user3, user4, user5, user6, user7, sriUserMatt, sriUserLisa].each(&:skip_confirmation!).each(&:save!)

# Generating two collections per user

col1 = Collection.create(:title => "pens", :description => "My favorite pens", :user_id=>1)
col2 = Collection.create(:title => "t-shirts", :description => "My favorite t-shirts", :user_id=>1)
col3 = Collection.create(:title => "sneakers", :description => "My favorite sneakers", :user_id=>3)
col4 = Collection.create(:title => "bikes", :description => "awesome bikes", :user_id=>3)
col5 = Collection.create(:title => "Heels", :description => "freaking high", :user_id=>2)
col6 = Collection.create(:title => "sunglasses", :description => "shades for the sunny days", :user_id=>2)
col7 = Collection.create(:title => "teapots", :description => "Lovely teapots", :user_id=>4)
col8 = Collection.create(:title => "bow ties", :description => "My favorite bow-ties", :user_id=>5)
col9 = Collection.create(:title => "umbrellas", :description => "Amazing umbrellas", :user_id=>5)
col10 = Collection.create(:title => "surfboards", :description => "Nice surfboards", :user_id=>6)
col11 = Collection.create(:title => "shells", :description => "Beautiful shells", :user_id=>6)
col12 = Collection.create(:title => "Fancy Watches", :description => "Vintage watches", :user_id=>2)
sriLisaColFlowers= Collection.create(:title => "flowers", :description => "Lovely Flowers", :user => sriUserLisa)
sriMattColBalls= Collection.create(:title => "Sports Equipment", :description => "Different type of balls", :user => sriUserMatt)
sriMattColVinyl= Collection.create(:title => "Vinyl Covers", :description => "Different type of balls", :user => sriUserMatt)



sriLisaColFlowers= Collection.create(:title => "flowers", :description => "Lovely Flowers", :user => sriUserLisa)
sriMattColBalls= Collection.create(:title => "Sports Equipment", :description => "Different type of balls", :user => sriUserMatt)
sriMattColVinyl= Collection.create(:title => "Vinyl Covers", :description => "Different type of balls", :user => sriUserMatt)
# Generating four photos per collection
#pens
photo1 = Photo.create(:title=> "Silver pen", :user_id=>1, :collection_id=>1, :caption=>"pen from van", :remote_image_url=>"http://johnlewis.scene7.com/is/image/JohnLewis/230953752?$prod_main$")

photo2 = Photo.create(:title=> "black pen", :user_id=>1, :collection_id=>1, :caption=>"pen from london", :remote_image_url=>"http://fpgeeks.com/wp-content/uploads/2013/04/parker_duofold_mandarin_yellow_fountain_pen_limited_edition-e1366989899963.jpg")
photo3 = Photo.create(:title=> "red pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://static.jetpens.com/images/a/000/024/24764.jpg")

photo4 = Photo.create(:title=> "green pen", :user_id=>1, :collection_id=>1, :caption=>"pen from paris", :remote_image_url=>"http://mont-blanc-pens.info/wp-content/uploads/2008/10/montblanc_limited_edition_boheme_papillon_fountain_pen.png")

#t-shirts
photo5 = Photo.create(:title=> "smiley tshirt", :user_id=>1, :collection_id=>2, :caption=>"mom bought this pour moi when I was 5", :remote_image_url=>"http://www.articlesweb.org/blog/wp-content/gallery/fun-shirts-a-new-dressing-tradition-among-youngsters/fun-shirts-a-new-dressing-tradition-among-youngsters-4.jpg")
photo6 = Photo.create(:title=> "great t-shirt", :user_id=>1, :collection_id=>2, :caption=>"Tres bon", :remote_image_url=>"http://creatiwittyblog.com/wp-content/uploads/2012/09/t-shirt-designs-inpiration-25.jpg")
photo7 = Photo.create(:title=> "Comme de garcon", :user_id=>1, :collection_id=>2, :remote_image_url=>"http://www.monsieurjerome.com/wp-content/uploads/2012/08/a-bathing-ape-x-play-comme-des-garcons-2012-capsule-collection-4.jpg")
photo8 = Photo.create(:title=> "cool t", :user_id=>1, :collection_id=>2, :caption=>"KWEL", :remote_image_url=>"http://www.songhi.com/wp-content/uploads/2014/02/staycool.jpg")


#sneakers
photo9 = Photo.create(:title=> "Nikes", :user_id=>3, :collection_id=>3, :caption=>"Airmax", :remote_image_url=>"http://www.theoriginators.com/wp-content/uploads/2013/06/nike-air-max-1-sp-zig-zag-2.jpg")
photo10 = Photo.create(:title=> "New Balances", :user_id=>3, :collection_id=>3, :caption=>"UHUMMMMMM!!!!", :remote_image_url=>"http://i.telegraph.co.uk/multimedia/archive/02437/NB_2437889b.jpg")
photo11 = Photo.create(:title=> "adidas", :user_id=>3, :collection_id=>3, :caption=>"San Smiths", :remote_image_url=>"http://designyoutrust.com/wp-content/uploads/2014/01/adidas-stan-smith-reissue-large-650x745.jpg")
photo12 = Photo.create(:title=> "Converse", :user_id=>3, :collection_id=>3, :caption=>"All Stars heehee", :remote_image_url=>"http://1.bp.blogspot.com/_4XVETITnjzg/TN1wVeInsuI/AAAAAAAAALs/1R2-feTs174/s1600/7420_converse-all-star-pins-hi-black-blue-l.jpg")

#bikes
photo13 = Photo.create(:title=> "Cool bike", :user_id=>3, :collection_id=>4, :remote_image_url=>"http://www.skyhdwallpapers.com/wp-content/uploads/2013/03/lge_e350-orange.jpg")
photo14 = Photo.create(:title=> "kinda mehhh acutally", :user_id=>3, :collection_id=>4, :remote_image_url=>"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRztDDV1ZYJpnSugABJ9Twa18c_xjmR-boT_V6qHiuefR_WJacx")

photo15 = Photo.create(:title=> "Cervelo", :user_id=>3, :collection_id=>4, :remote_image_url=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRWBABS3ImVoXKb-60WgSb5LOFbAhRTjsuU9Z1Se6Zz0v5Ok6_E")

photo16 = Photo.create(:title=> "Cervelo", :user_id=>3, :collection_id=>4, :remote_image_url=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSe_tKGcu8VT3ojeU_XL9qZe6ERCyiuOZ59gfj7ORnzVudYUEqrTg")


#shoes
photo17 = Photo.create(:title=> "YSL Mohawk Pumps", :user_id=>2, :collection_id=>5, :remote_image_url=>"http://www.shoewawa.com/assets_c/2010/10/kylie-minogue-ysl-thumb-435x290-109494.jpg", :caption=> "these are actually 7inches!")
photo18 = Photo.create(:title=> "Carven Bow Heels", :user_id=>2, :collection_id=>5, :remote_image_url=>"http://media-cache-ec0.pinimg.com/236x/2d/98/49/2d98498e037f31a741927e24015b02bd.jpg", :caption=> "Love from Paris :)")
photo19 = Photo.create(:title=> "Brian Atwoods", :user_id=>2, :collection_id=>5, :remote_image_url=>"https://lh3.googleusercontent.com/-yLPsgJYkVNs/TXWNypQjgSI/AAAAAAAABmM/NNtNGtElUhc/s1600/Mai-Lamore-black-feather-platform-heel3.jpg", :caption=> "these bad bad girls")
photo20 = Photo.create(:title=> "Acne Boots", :user_id=>2, :collection_id=>5, :remote_image_url=>"http://donnellygroup.ca/wp-content/uploads/2012/03/Acne-Boots-1.jpg", :caption=> "Acnes are the best")

#sunglasses
photo21 = Photo.create(:title=> "Gross and Cutler", :user_id=>2, :collection_id=>6, :remote_image_url=>"http://graceormonde.com/wp-content/uploads/2012/06/cutler-and-gross-sunglasses.jpg", :caption=> "So hip haha")

photo22 = Photo.create(:title=> "Karen Walker", :user_id=>2, :collection_id=>6, :remote_image_url=>"http://madisonplus.com/wp-content/uploads/2010/04/sunglasses01.jpg", :caption=> "vintage 89")
photo23 = Photo.create(:title=> "Prada Flower Sunglasses", :user_id=>2, :collection_id=>6, :remote_image_url=>"http://images2.trendnstylez.com/wp-content/uploads/2013/02/sunglasses-trends-2013-prada-floral-sunglasses.jpg", :caption=> "bought summer 2012")
photo24 = Photo.create(:title=> "Prada Flower Sunglasses", :user_id=>2, :collection_id=>6, :remote_image_url=>"https://s3.amazonaws.com/assets.svpply.com/large/708696.jpg?1401214165", :caption=> "my dad's")

#teapots
photo25 = Photo.create(:title=> "Teapot", :user_id=>4, :collection_id=>7, :caption=>"Cool teapot", :remote_image_url=>"http://www.fantes.com/images/120664tea_pots.jpg")
photo26 = Photo.create(:title=> "Teapot", :user_id=>4, :collection_id=>7, :caption=>"Cool teapot", :remote_image_url=>"http://4.bp.blogspot.com/-oBPzYjoHBp0/TzKU61208rI/AAAAAAAAJGI/IxTP8a46nlM/s1600/Dotty%2BTeapot-600x600.jpg")
photo27 = Photo.create(:title=> "Teapot", :user_id=>4, :collection_id=>7, :caption=>"Cool teapot", :remote_image_url=>"http://4.bp.blogspot.com/-oVeT2KdWlbw/T2B8XFkp6QI/AAAAAAAAJMI/rAKn1Wx-0Ps/s1600/Racing-Flame-Teapot.jpg")
photo28 = Photo.create(:title=> "Teapot", :user_id=>4, :collection_id=>7, :caption=>"Cool teapot", :remote_image_url=>"http://www.kristinalogan.com/objects/teapot-blue.jpg")
photo29 = Photo.create(:title=> "Teapot", :user_id=>4, :collection_id=>7, :caption=>"Cool teapot", :remote_image_url=>"http://www.frontporchgiftshop.com/kitchen/39166.jpg")
photo30 = Photo.create(:title=> "Teapot", :user_id=>4, :collection_id=>7, :caption=>"Cool teapot", :remote_image_url=>"http://www.velvetcushion.com/files/media/july-teapot-andrew-bannecker.jpg")


#bowties
photo31 = Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://www.slaters.co.uk/media/catalog/product/cache/1/image/a4e40ebdc3e371adff845072e1c73f37/i/m/image_65168_1_8114.jpg")
photo32 = Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://cdn.smartturnout.co.uk/media/catalog/product/cache/2/image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/h/d/hdbowtie-lrg_2.jpg")
photo33 = Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://images.cdn.bigcartel.com/bigcartel/product_images/127407312/-/Paisley_2_Bow_tie_by_OoOtie_Boston_Bow_ties.jpg")
photo34 = Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://images.cdn.bigcartel.com/bigcartel/product_images/126993069/-/Honey_Badger_Bow_tie_by_OoOtie_Boston_Bow_ties.JPG")

#umbrellas

photo35 = Photo.create(:title=> "Umbrella", :user_id=>5, :collection_id=>9, :caption=>"Gorgeous umbrella", :remote_image_url=>"http://static2.businessinsider.com/image/50d3417e6bb3f70f3600000b/the-moma-sky-umbrella-brightens-any-rainy-day.jpg")
photo36 = Photo.create(:title=> "Umbrella", :user_id=>5, :collection_id=>9, :caption=>"Gorgeous umbrella", :remote_image_url=>"http://www.kidorable.com/cart/images/T/umb_spacehero_040813.jpg")
photo37 = Photo.create(:title=> "Umbrella", :user_id=>5, :collection_id=>9, :caption=>"Gorgeous umbrella", :remote_image_url=>"http://blog.beatthebrochure.com/wp-content/uploads/2012/04/a-z-umbrella.jpg")
photo38 = Photo.create(:title=> "Umbrella", :user_id=>5, :collection_id=>9, :caption=>"Gorgeous umbrella", :remote_image_url=>"http://www.techdigest.tv/assets_c/2009/05/lightsaber-umbrella-thumb-300x257-89200.jpg")
photo39 = Photo.create(:title=> "Umbrella", :user_id=>5, :collection_id=>9, :caption=>"Gorgeous umbrella", :remote_image_url=>"https://s3.amazonaws.com/assets.svpply.com/large/766570.jpg?1400281072")

#surfboards
photo41 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://icons.iconarchive.com/icons/visualpharm/vacation/256/surfboard-icon.png")
photo42 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://d3nevzfk7ii3be.cloudfront.net/igi/PCxpNTLAvxG6hATf")
photo43 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://www.shopgsd.com/images/products/large/137.jpg")
photo44 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://jellyflash.com/images/uploads/SurfBoard/QuikSilver/Quiksilver_Cypher_Alpha_Surfboard_USB_Flash_Memory_Drive.jpg")
photo45 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://www.ronjonsurfshop.com/assets/item/large/10670030004--ronjon_6_4_rocket_fish_surfboard.jpg")
photo46 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://www.laweekly.com/imager/b/blog/4202672/5fa8/Timmy_Patterson_Surfboard_Rising_Sun.jpg?cb=1390201303")
photo47 = Photo.create(:title=> "Surfboard", :user_id=>6, :collection_id=>10, :caption=>"Nice surfboard", :remote_image_url=>"http://static.iwantmoretoys.com/images/products/totally-bamboo-surfboard-cutting-board.jpg")

#shells
photo48 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shells", :remote_image_url=>"http://i.huffpost.com/gadgets/slideshows/5871/slide_5871_79165_large.jpg")
photo49 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shell", :remote_image_url=>"http://andwithyourspirit.files.wordpress.com/2014/05/shells-026.jpg")
photo50 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shell", :remote_image_url=>"http://www.gurusfeet.com/files/blogpics/shells%20020.JPG")
photo51 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shell", :remote_image_url=>"http://www.thephotoargus.com/wp-content/uploads/2011/09/seashells03.jpg")
photo52 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shell", :remote_image_url=>"http://4.bp.blogspot.com/-4JD7S5LUQRY/Uawm__wixLI/AAAAAAAAALQ/77ash8evMjw/s1600/blue+shells.jpg")
photo53 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shell", :remote_image_url=>"http://img.xcitefun.net/users/2010/05/171039,xcitefun-shell19.jpg")
photo54 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"Cool shell", :remote_image_url=>"http://images.forwallpaper.com/files/thumbs/preview/25/251459__photo-macro-landscapes-beaches-beautiful-wallpaper-sand-shells-shell-shell-shells-sun_p.jpg")


<<<<<<< HEAD



=======
####################
# more pens
photo401 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://www.gadgetpens.com/images/products/stainless.gif")
photo402 = Photo.create(:title=> "Pens", :user_id=>1, :collection_id=>1, :caption=>"nice pens", :remote_image_url=>"http://www.kepu.gov.cn/weekly/test/201405/W020140510640397914607.jpg")
photo403 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://celestial-members.com/images/stella/fountainpen2.jpg")
photo404 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://upload.wikimedia.org/wikipedia/commons/8/8f/Fountain-pen-nib.jpg")
photo405 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://ulugtekin.com/pen/Ulugtekin%20Pelikan/Pelikan_800_Fountain_pen/Pelikan_800_Fountain_pen_10.JPG")
photo406 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://www.mjfreelancer.com/wp-content/uploads/2010/01/dip-pens2.jpg")
photo407 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://img.auctiva.com/imgdata/1/7/7/6/4/6/1/webimg/680591178_tp.jpg")
photo408 = Photo.create(:title=> "Pen", :user_id=>1, :collection_id=>1, :caption=>"pen", :remote_image_url=>"http://www.men-access.com/wp-content/uploads/2010/12/montegrappa_Pen_Gold.jpg")

# more shirts
photo409 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://www.honcho-sfx.com/images/mens-retro-star-wars-tie-interceptor-t-shirt-red-p2513-8872_zoom.jpg")
photo410 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://www.theshirtlist.com/wp-content/uploads/2012/10/Super-Mario-Bullet-Bill.jpg")
photo411 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://images.teamsugar.com/files/upl1/1/13839/49_2008/3e4285318241cc01_guy-tshirt-web.xlarge.jpg")
photo412 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://thehouseoffun.com/images/D/T-Shirt%20Adventure%20Time%20BMO.jpg")
photo413 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=20840474")
photo414 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://www3.images.coolspotters.com/photos/853284/david-and-goliath-come-to-the-dark-side-t-shirt-profile.jpg")
photo415 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://www.tokidoki-blog.com/images/spring08_men5.jpg")
photo416 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=35489633")
photo417 = Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://media-cache-ak0.pinimg.com/236x/a5/e8/43/a5e8432753df48e5c34636c2908bee09.jpg")

Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://skreened.com/render-product/t/a/x/taxytemisuiuaagktyfd/happiness-is-fleeting-zombie.american-apparel-unisex-fitted-tee.white.w760h760b3.jpg")
Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"great shirt", :remote_image_url=>"http://i.kinja-img.com/gawker-media/image/upload/s--L4gxgO3_--/c_fit,fl_progressive,q_80,w_320/18ms4bybrr44tjpg.jpg")
Photo.create(:title=> "T-shirt", :user_id=>1, :collection_id=>2, :caption=>"http://www.awkwardgeeks.com/wp-content/uploads/2013/04/Lego-Star-Wars-Tee.jpg")



# more shells
photo418 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"shell!", :remote_image_url=>"http://static.ddmcdn.com/gif/willow/shell-info0.gif")
photo419 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"shell!", :remote_image_url=>"http://shells.tricity.wsu.edu/ArcherdShellCollection/Illustrations/shell.jpg")
photo420 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"shell!", :remote_image_url=>"http://www.thearubahouse.com/images2006/hugh_shells_1_400.jpg")
photo421 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"shell!", :remote_image_url=>"http://www.islandimages.co.uk/photographic_galleries/shell_photography/circular_shells_thb.jpg")
photo422 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"shell!", :remote_image_url=>"http://1.bp.blogspot.com/_DoHR7WYShjg/SWYWxcS_FDI/AAAAAAAAAFA/RO7hn0tuSJo/s1600/Rare+shell.JPG")
photo423 = Photo.create(:title=> "Shell", :user_id=>6, :collection_id=>11, :caption=>"shell!", :remote_image_url=>"http://www.publicdomainpictures.net/pictures/10000/nahled/shell2.jpg")

#Yasmin collection
Photo.create(:title=> "Celine", :user_id=>2, :collection_id=>6, :remote_image_url=>"http://billidollarbaby.com/wp-content/uploads/2014/04/kim-kardashian-in-celine-skate-sunglasses-arriving-to-la-after-thailand-vacation-2.jpg", :caption=> "Vintage Celine's")
Photo.create(:title=> "Gross and Cutler", :user_id=>2, :collection_id=>6, :remote_image_url=>"http://opticalvisionresources.com/wp-content/uploads/2012/03/Cutler_Gross-2012.jpg", :caption=> "coolest brand in the world")

# Watches
Photo.create(:title=> "Vacheron Constantin", :user_id=>2, :collection_id=>12, :caption=>"Fine swiss watchmaker", :remote_image_url=>"http://www.thewatchquote.com/IMG_neuf/imgStd/Vacheron-Constantin-47070-000J-9084.jpg")
Photo.create(:title=> "Blancpain", :user_id=>2, :collection_id=>12, :caption=>"Mooned!", :remote_image_url=>"http://www.timezone.com/2003/07/01/pre-basel-2003-blancpain-celebrates-20-years-of-its-moon-phase-watch-4103/img/articles/news631848283582968750/Blancpain20YrsMoonPhaseWatch.jpg")
Photo.create(:title=> "Frank Muller, Crazy Hours", :user_id=>2, :collection_id=>12, :caption=>"Graduation watch!!", :remote_image_url=>"http://i.ebayimg.com/00/s/NjQwWDQyNw==/z/U1sAAOxyaTxRSjqz/$T2eC16NHJGkE9no8gFuVBRSjq0HIbg~~60_35.JPG")
Photo.create(:title=> "IWC", :user_id=>2, :collection_id=>12, :caption=>"Sportyyy", :remote_image_url=>"http://ecx.images-amazon.com/images/I/51jdWVF8baL.jpg")
Photo.create(:title=> "Audemars Piguet", :user_id=>2, :collection_id=>12, :caption=>"Royal Oak", :remote_image_url=>"http://www.upscalehype.com/wp-content/uploads/2009/04/audemarsoffshorerose1_profilejpg.jpeg")

# more bowties
Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"https://img0.etsystatic.com/005/0/7252247/il_fullxfull.371129128_4r45.jpg")
Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://coolmompicks.com/wp-content/uploads/2013/11/ScreenShot2013-05-30at82138PM.png")
Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://www.theworkingwardrobe.com/wp-content/uploads/2012/03/reversible-Bow-tie.jpg")
Photo.create(:title=> "Bowtie", :user_id=>5, :collection_id=>8, :caption=>"nice bowtie", :remote_image_url=>"http://cdn.fashionablygeek.com/wp-content/uploads/2013/01/tie6.jpg?22a92a")


#balls
sriBallOne = Photo.create(:title=> "Play Balls", :user => sriUserMatt , :collection => sriMattColBalls, :remote_image_url=>"http://upload.wikimedia.org/wikipedia/commons/b/bf/Toy_balls_with_different_Colors.jpg", :caption=> "My ball collection")
sriBallTwo = Photo.create(:title=> "Football", :user => sriUserMatt, :collection => sriMattColBalls, :remote_image_url=>"http://leicesterexchanges.com/wp-content/uploads/2013/06/Football.jpg", :caption=> "My football")
sriBallThree = Photo.create(:title=> "Baseball", :user => sriUserMatt, :collection => sriMattColBalls, :remote_image_url=>"http://upload.wikimedia.org/wikipedia/en/1/1e/Baseball_(crop).jpg", :caption=> "Got these in New York")
sriBallFour = Photo.create(:title=> "NFL", :user => sriUserMatt, :collection => sriMattColBalls, :remote_image_url=>"http://www.markthompson.us/gameballs/NFL/NFL2006LG.jpg", :caption=> "Got this in New York too")






 
 
 
 

#flowers
sriFlowerOne = Photo.create(:title=> "Roses", :user => sriUserLisa , :collection => sriLisaColFlowers, :remote_image_url=>"http://i.telegraph.co.uk/multimedia/archive/02489/roses_2489378b.jpg", :caption=> "I love roses!")
sriFlowerTwo = Photo.create(:title=> "Pansy", :user => sriUserLisa, :collection => sriLisaColFlowers, :remote_image_url=>"http://upload.wikimedia.org/wikipedia/commons/7/76/Viola_tricolor_pansy_flower_close_up.jpg", :caption=> "Had never heard of pansies")
sriFLowerThree = Photo.create(:title=> "Sunflower", :user => sriUserLisa, :collection => sriLisaColFlowers, :remote_image_url=>"http://upload.wikimedia.org/wikipedia/commons/d/d5/Sunflowers.jpg", :caption=> "Sunflowers are amazing!")
sriFlowerFour = Photo.create(:title=> "Orchid", :user => sriUserLisa, :collection => sriLisaColFlowers, :remote_image_url=>"http://upload.wikimedia.org/wikipedia/commons/3/30/Orchid_Phalaenopsis_hybrid.jpg", :caption=> "Orchids are Singapore's national flower")






 
 
 
 

#vinly
sriVinlyOne = Photo.create(:title=> "Black Eyed Peas", :user => sriUserMatt , :collection => sriMattColVinyl, :remote_image_url=>"http://2.bp.blogspot.com/_zqFoq3qej2c/TTESjWiBaoI/AAAAAAABno8/dWnc1Zu8fgo/s640/bep.jpg", :caption=> "I love roses!")
sriVinlyTwo = Photo.create(:title=> "Aerosmith", :user => sriUserMatt, :collection => sriMattColVinyl, :remote_image_url=>"http://ecx.images-amazon.com/images/I/51CJ1kPHPHL._SY300_.jpg", :caption=> "Had never heard of pansies")
sriVinlyThree = Photo.create(:title=> "Madonna", :user => sriUserMatt, :collection => sriMattColVinyl, :remote_image_url=>"http://www.images.noizesolution.co.uk/pdg/7/m/madonna-vogue-picture-disc-a.jpg", :caption=> "Sunflowers are amazing!")
sriVinlyFour = Photo.create(:title=> "Jamiroquai", :user => sriUserMatt, :collection => sriMattColVinyl, :remote_image_url=>"http://m1.behance.net/rendition/modules/26209957/disp/2ab8f849b69eff7335a04b5d888df00c.jpg", :caption=> "Orchids are Singapore's national flower")



