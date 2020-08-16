--TABLE ENTRIES BEGIN HERE

-- Table: public.productv
-- DROP TABLE public.productv;
CREATE TABLE public.productv (
    productvid bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    seller text NOT NULL,
    rating decimal,
	user_rating integer,
	tag boolean,
	tag_title text,
	category text,
	category_link text,
	similar_item text
) TABLESPACE pg_default;
ALTER TABLE public.productv OWNER to postgres;
COMMENT ON TABLE public.productv IS 'Product table specifically for Product Variant component.';
COMMENT ON COLUMN public.productv.productvid IS 'product variant ids';
COMMENT ON COLUMN public.productv.seller IS 'who is selling the product';
COMMENT ON COLUMN public.productv.rating IS 'the rating from all users in star value';
COMMENT ON COLUMN public.productv.user_rating IS 'the number of users rating';
COMMENT ON COLUMN public.productv.tag IS 'whether there is a tag or not a tag';
COMMENT ON COLUMN public.productv.tag_title IS 'if there is a tag then should have a title';
COMMENT ON COLUMN public.productv.category IS 'the category of the product';
COMMENT ON COLUMN public.productv.category_link IS 'a link to a category page ';
COMMENT ON COLUMN public.productv.similar_item IS 'any similar item ads go here';

-- Table: public.selector
-- DROP TABLE public.selector;
CREATE TABLE public.selector (
    selectorid bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
		productvid bigint NOT NULL,
		title text NOT NULL,
		type_selector integer,
		selector_num integer,
		price decimal NOT NULL,
		shipping boolean NOT NULL,
		ship_price decimal,
		discount boolean NOT NULL,
		list_price decimal,
		about_item text,
		selector_text text,
		selector_img text,
		isdefault boolean NOT NULL,
		instock integer NOT NULL,
		message text,
		lowstock_message text NOT NULL,
		shipping_message text NOT NULL,
		type_title text

) TABLESPACE pg_default;
ALTER TABLE public.selector OWNER to postgres;
COMMENT ON TABLE public.selector IS 'the selection table everything in here updates based on the selection';
COMMENT ON COLUMN public.selector.selectorid IS 'id for the selection';
COMMENT ON COLUMN public.selector.productvid IS 'id based on the product';
COMMENT ON COLUMN public.selector.title IS 'the title of the product';
COMMENT ON COLUMN public.selector.type_selector IS 'the type of selection if multiple';
COMMENT ON COLUMN public.selector.selector_num IS 'number for the selection - not sure if necessary any longer';
COMMENT ON COLUMN public.selector.price IS 'the price of the product';
COMMENT ON COLUMN public.selector.shipping IS 'determine if shipping';
COMMENT ON COLUMN public.selector.ship_price IS 'the price if shipping';
COMMENT ON COLUMN public.selector.discount IS 'determine if discount';
COMMENT ON COLUMN public.selector.list_price IS 'the priginal price if discount';
COMMENT ON COLUMN public.selector.about_item IS 'a list about the product put into a string and not another table';
COMMENT ON COLUMN public.selector.selector_text IS 'text for multiple selections';
COMMENT ON COLUMN public.selector.selector_img IS 'image if want image for selection';
COMMENT ON COLUMN public.selector.isdefault IS 'determine if default for product';
COMMENT ON COLUMN public.selector.instock IS 'number in stock';
COMMENT ON COLUMN public.selector.message IS 'the message for prices under prices if want';
COMMENT ON COLUMN public.selector.lowstock_message IS 'message for lowstock items';
COMMENT ON COLUMN public.selector.shipping_message IS 'message for shipping items';
COMMENT ON COLUMN public.selector.type_title IS 'multiple selection headings';

-- Table: public.detailv
-- DROP TABLE public.detailv;
CREATE TABLE public.detailv (
    detailid bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    selectorid bigint NOT NULL,
	feature text,
	detail text

) TABLESPACE pg_default;
ALTER TABLE public.detailv OWNER to postgres;
COMMENT ON TABLE public.detailv IS 'Detail table specifically for Product Variant component.';
COMMENT ON COLUMN public.detailv.detailid IS 'detail id';
COMMENT ON COLUMN public.detailv.selectorid IS 'selection id';
COMMENT ON COLUMN public.detailv.feature IS 'feature for the product';
COMMENT ON COLUMN public.detailv.detail IS 'detail of the feature based on product';

-- Table: public.detailv
-- DROP TABLE public.detailv;
CREATE TABLE public.featurev (
    featureid bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    productvid bigint NOT NULL,
	title text,
	rating decimal

) TABLESPACE pg_default;
ALTER TABLE public.featurev OWNER to postgres;
COMMENT ON TABLE public.featurev IS 'Detail table specifically for Product Variant component.';
COMMENT ON COLUMN public.featurev.featureid IS 'feature id';
COMMENT ON COLUMN public.featurev.productvid IS 'product id';
COMMENT ON COLUMN public.featurev.title IS 'the title of the feature';
COMMENT ON COLUMN public.featurev.rating IS 'the total star rating of the feature';


--TABLE ENTRIES END HERE





--SEEDED DATA BEGINS HERE

--ENTRY PRODUCT 1
INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'R2-D2',
    3.4,
    3400,
    true,
    '#1 Best Seller',
    'microwave stuff',
    '/microwave_stuff',
    'https://www.clipartmax.com/png/middle/195-1957849_microwave-oven-microwave-cartoon-png.png'
);

--   PRODUCT 1 SELECTION 1(1)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price, shipping,
    ship_price, discount, list_price, about_item, selector_text, selector_img, isdefault, instock,
    message, lowstock_message, shipping_message, type_title ) VALUES (
    1,
    'Toshiba 0.9 Cu.ft Microwave in black',
    1,
    1,
    100.00,
    true,
    14.99,
    true,
    150.00,
    '360 degree content marketing pool can we align on lunch orders.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    'Black',
    '',
    false,
    9,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and order today!',
    'Shipping free with approval of Amazin Store Card',
    'color'
);

 INSERT INTO public.detailv ( selectorid, feature, detail) VALUES (
    1,
    'color',
    'black'
 );

INSERT INTO public.detailv ( selectorid, feature, detail) VALUES (
    1,
    'modes',
    '6'
);

INSERT INTO public.detailv (  selectorid, feature,detail)VALUES (
    1,
    'sound',
    'yes'
);

INSERT INTO public.detailv (selectorid,feature,detail) VALUES (
    1,
    'power (watts)',
    '900'
);



--   PRODUCT 1 SELECTION 2 DEFAULT (2)

INSERT INTO public.selector (
            productvid,
    		title,
    		type_selector,
    		selector_num,
    		price,
    		shipping,
    		ship_price,
    		discount,
    		list_price,
    		about_item,
    		selector_text,
    		selector_img,
    		isdefault,
    		instock,
    		message,
    		lowstock_message,
    		shipping_message,
    		type_title
    )
VALUES (
            1,
            'Toshiba 0.9 Cu.ft Microwave, Stainless Steel',
    		1,
    		1,
    		100.00,
    		true,
    		14.99,
    		true,
    		150.00,
    		'360 degree content marketing pool can we align on lunch orders.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    		'Stainless Steel',
    		'',
    		true,
    		54,
    		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    		'Currently this item is low in stock. Hurry and order today!',
    		'Shipping free with approval of Amazin Store Card',
    		'color'
        );

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    2,
    'color',
    'stainless steel'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    2,
    'modes',
    '6'
);


INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    2,
    'sound',
    'yes'
);

INSERT INTO public.detailv (selectorid,feature,detail )VALUES (
    2,
    'power (watts)',
    '800'
);

--   PRODUCT 1 SELECTION 3 (3)

   INSERT INTO public.selector (
            productvid,
       		title,
       		type_selector,
       		selector_num,
       		price,
       		shipping,
       		ship_price,
       		discount,
       		list_price,
       		about_item,
       		selector_text,
       		selector_img,
       		isdefault,
       		instock,
       		message,
       		lowstock_message,
       		shipping_message,
       		type_title
       )
   VALUES (
              1,
       		'Toshiba 0.9 Cu.ft Microwave in white',
       		1,
       		1,
       		100.00,
       		true,
       		14.99,
       		true,
       		150.00,
       		'360 degree content marketing pool can we align on lunch orders.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
       		'White',
       		'',
       		false,
       		34,
       		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
       		'Currently this item is low in stock. Hurry and order today!',
       		'Shipping free with approval of Amazin Store Card',
       		'color'
           );

            INSERT INTO public.detailv (
                selectorid,
            	feature,
            	detail
            )
            VALUES (
                3,
                'color',
                'white'
            );

            INSERT INTO public.detailv (
                 selectorid,
             	feature,
             	detail
             )
             VALUES (
                 3,
                 'modes',
                 '6'
             );


             INSERT INTO public.detailv (
                selectorid,
              	feature,
              	detail
              )
              VALUES (
                  3,
                  'sound',
                  'yes'
              );

              INSERT INTO public.detailv (
                selectorid,
               	feature,
               	detail
               )
               VALUES (
                   3,
                   'power (watts)',
                   '800'
               );

INSERT INTO public.featurev (productvid,title,rating)VALUES (
    1,
    'hotness',
    5.0
);

INSERT INTO public.featurev (productvid,title,rating)VALUES (
    1,
    'really cooking',
    3.7
);

 INSERT INTO public.featurev (productvid,title,rating)VALUES (
     1,
     'noise',
     2.1
 );


--ENTRY PRODUCT 2

INSERT INTO public.productv (seller,rating,user_rating,tag,tag_title,category,category_link,similar_item
    ) VALUES (
    'Darth Vader',
    1.87,
    1234,
    false,
    '',
    'microwave stuff',
    '/microwave_stuff',
    'https://1001freedownloads.s3.amazonaws.com/vector/thumb/82494/1337106329.png'
);




--PRODUCT 2 SELECTION 1 DEFAULT (4)

   INSERT INTO public.selector (productvid,title,type_selector,selector_num,price,shipping,ship_price,discount,
    list_price,about_item,selector_text,selector_img,isdefault,instock,message,lowstock_message,shipping_message,
    type_title)VALUES (
    2,
    'Stainless Steel Toshiba 1.2 Cu.ft Microwave with Sensor',
    1,
    1,
    140.00,
    true,
    20.00,
    false,
    0.00,
    '360 degree content marketing pool can we align on lunch orders.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    'Stainless Steel with Sensor',
    '',
    true,
    300,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and order today!',
    'Shipping free with approval of Amazin Store Card',
    'color + sensor'
);


INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    4,
    'color',
    'stainless steel'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    4,
    'modes',
    '6'
);

INSERT INTO public.detailv (selectorid,feature,detail )VALUES (
    4,
    'sound',
    'yes'
);

INSERT INTO public.detailv (selectorid,feature,detail )VALUES (
    4,
    'power (watts)',
    '110'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    4,
    'sensing',
    'yes'
);

--PRODUCT 2 SELECTION 2 (5)

  INSERT INTO public.selector (
             productvid,
        		title,
        		type_selector,
        		selector_num,
        		price,
        		shipping,
        		ship_price,
        		discount,
        		list_price,
        		about_item,
        		selector_text,
        		selector_img,
        		isdefault,
        		instock,
        		message,
        		lowstock_message,
        		shipping_message,
        		type_title
        )
    VALUES (
             2,
             'Stainless Steel Toshiba 1.2 Cu.ft Microwave, Without Sensor',
        		1,
        		1,
        		120.00,
        		true,
        		20.00,
        		false,
        		0.00,
        		'Crank this out roll back strategy so cannibalize.*Lets not solutionize this right now parking lot it big boy pants can you ballpark the cost per unit for me*Due diligence big picture, product management breakout fastworks loop back.*',
        		'Stainless Steel without Sensor',
        		'',
        		false,
        		300,
        		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
        		'Currently this item is low in stock. Hurry and order today!',
        		'Shipping free with approval of Amazin Store Card',
        		'color + sensor'
            );


INSERT INTO public.detailv (
                  selectorid,
              	feature,
              	detail
              )VALUES (
                  5,
                  'color',
                  'stainless steel'
              );

INSERT INTO public.detailv (
                   selectorid,
               	feature,
               	detail
               ) VALUES (
                   5,
                   'modes',
                   '6'
               );


INSERT INTO public.detailv (
                  selectorid,
                	feature,
                	detail
                )
                VALUES (
                    5,
                    'sound',
                    'yes'
                );

INSERT INTO public.detailv (
                  selectorid,
                 	feature,
                 	detail
                 )
                 VALUES (
                     5,
                     'power (watts)',
                     '110'
                 );

INSERT INTO public.detailv (
                              selectorid,
                             	feature,
                             	detail
                             )
                             VALUES (
                                 5,
                                 'sensing',
                                 'no'
                             );

    --PRODUCT 2 SELECTION 3 (6)

   INSERT INTO public.selector (
            productvid,
       		title,
       		type_selector,
       		selector_num,
       		price,
       		shipping,
       		ship_price,
       		discount,
       		list_price,
       		about_item,
       		selector_text,
       		selector_img,
       		isdefault,
       		instock,
       		message,
       		lowstock_message,
       		shipping_message,
       		type_title
       )
   VALUES (
            2,
            'Toshiba 1.2 Cu.ft Microwave with Sensor in Black',
       		1,
       		1,
       		130.00,
       		true,
       		20.00,
       		false,
       		0.00,
       		'Low engagement to be inspired is to become creative, innovative and energized we want this philosophy to trickle down to all our stakeholders*we need to make the new version clean and sexy,Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
       		'Black with Sensor',
       		'',
       		false,
       		100,
       		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
       		'Currently this item is low in stock. Hurry and order today!',
       		'Shipping free with approval of Amazin Store Card',
       		'color + sensor'
           );

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    6,
    'color',
    'black'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    6,
    'modes',
    '6'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    6,
    'sound',
    'yes'
);

INSERT INTO public.detailv (selectorid, feature, detail) VALUES (
    6,
    'power (watts)',
    '110'
);

INSERT INTO public.detailv (selectorid,feature,detail) VALUES (
    6,
    'sensing',
    'yes'
);

--PRODUCT 2 SELECTION 4 (7)

INSERT INTO public.selector (productvid, title, type_selector, selector_num, price, shipping,
    ship_price, discount, list_price, about_item, selector_text, selector_img, isdefault,
    instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    2,
    'Toshiba 1.2 Cu.ft Microwave with Sensor in White',
    1,
    1,
    130.00,
    true,
    20.00,
    false,
    0.00,
    '360 degree content marketing pool can we align on lunch orders.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    'White with Sensor',
    '',
    false,
    250,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and order today!',
    'Shipping free with approval of Amazin Store Card',
    'color + sensor'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    7,
    'color',
    'white'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    7,
    'modes',
    '6'
);

INSERT INTO public.detailv (selectorid,feature,detail) VALUES (
    7,
    'sound',
    'yes'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    7,
    'power (watts)',
    '110'
);

INSERT INTO public.detailv (selectorid,	feature,detail)VALUES (
    7,
    'sensing',
    'yes'
);

INSERT INTO public.featurev ( productvid,title,rating)VALUES (
    2,
    'sensing ability',
    4.3
);

INSERT INTO public.featurev (productvid,title,rating)VALUES (
    2,
    'noise',
    1.5
);


--ENTRY PRODUCT 3

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item) VALUES (
    'C-3PO',
    1.2,
    902,
    true,
    'Amazins Choice',
    'microwave stuff',
    '/microwave_stuff',
    'https://i.pinimg.com/originals/87/ee/04/87ee04ef15919002d0e0674eab05a707.jpg'
);

--PRODUCT 3 SELECTION 1 DEFAULT (8)

INSERT INTO public.selector (
            productvid,
    		title,
    		type_selector,
    		selector_num,
    		price,
    		shipping,
    		ship_price,
    		discount,
    		list_price,
    		about_item,
    		selector_text,
    		selector_img,
    		isdefault,
    		instock,
    		message,
    		lowstock_message,
    		shipping_message,
    		type_title
    )
VALUES (
            3,
    		'Toshiba 1.3 Cu.ft Smart Microwave work with Alexa',
    		1,
    		1,
    		170.00,
    		false,
    		0.00,
    		false,
    		0.00,
    		'Alexa voice commands included*Free book on Alexa app microwave voice commands*Scope creep today shall be a cloudy day, thanks to blue sky thinking, we can now deploy our new ui to the cloud quick-win and can you send me an invite? so free lunch.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    		'With Alexa',
    		'',
    		true,
    		4,
    		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    		'Currently this item is low in stock. Hurry and order today!',
    		'All Shipping is free',
    		'smart microwave'
        );

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    8,
    'color',
    'stainless steel'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    8,
    'voice commands (alexa)',
    'yes'
);

-- PRODUCT 3 SELECTION 2 (9)

INSERT INTO public.selector (productvid,title,type_selector,selector_num,price,shipping,ship_price,
    discount,list_price,about_item,selector_text,selector_img,isdefault,instock,message,lowstock_message,
    shipping_message,type_title)VALUES (
    3,
    'Toshiba 1.3 Cu.ft Microwave, Stainless Steel',
    1,
    1,
    170.00,
    false,
    0.00,
    false,
    0.00,
    'Scope creep today shall be a cloudy day, thanks to blue sky thinking, we can now deploy our new ui to the cloud quick-win and can you send me an invite? so free lunch.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    'Without Alexa',
    '',
    false,
    117,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and order today!',
    'All Shipping is free',
    'smart microwave'
);


INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    9,
    'color',
    'stainless steel'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    9,
    'voice commands (alexa)',
    'no'
);

INSERT INTO public.featurev (productvid,title,rating)VALUES (
    3,
    'appearance',
    3.2
);

INSERT INTO public.featurev (productvid,title,rating )VALUES (
    3,
    'genius product',
    4.7
);

  INSERT INTO public.featurev ( productvid, title,  rating  )   VALUES (
    3,
    'ease of use',
    5.0
  );

--  ENTRY PRODUCT 4

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category,category_link,similar_item ) VALUES (
    'BB-8',
    4.3,
    902,
    false,
    '',
    'microwave stuff',
    '/microwave_stuff',
    'https://i.pinimg.com/originals/87/ee/04/87ee04ef15919002d0e0674eab05a707.jpg'
);

-- PRODUCT 4 SELECTION 1 DEFAULT (10)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price, shipping,
    ship_price, discount, list_price, about_item, selector_text, selector_img, isdefault, instock,
    message, lowstock_message, shipping_message, type_title ) VALUES (
    4,
    'Toshiba 1.5 Microwave with Convection',
    1,
    1,
    160.00,
    true,
    9.99,
    true,
    170.00,
    'Convection*Due diligence big picture, product management breakout fastworks loop back.*Price point translating our vision of having a market leading platfrom yet time to open the kimono nor downselect table the discussion*',
    'With Convection',
    '',
    true,
    117,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and order today!',
    'Shipping overseas requires more time for delivery',
    'convection'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    10,
    'color',
    'stainless steel'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    10,
    'convection',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    10,
    'power (watts)',
    '1000'
);

--  PRODUCT 4 SELECTION 2 (11)

INSERT INTO public.selector (productvid, title,type_selector, selector_num, price, shipping, ship_price,
    discount, list_price, about_item, selector_text, selector_img, isdefault, instock, message, lowstock_message,
    shipping_message, type_title ) VALUES (
    4,
    'Toshiba 1.5 Microwave',
    1,
    1,
    160.00,
    true,
    9.99,
    true,
    170.00,
    'No convection*Due diligence big picture, product management breakout fastworks loop back.*Price point translating our vision of having a market leading platfrom yet time to open the kimono nor downselect table the discussion*',
    'Without Convection',
    '',
    false,
    117,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and order today!',
    'Shipping overseas requires more time for delivery',
    'convection'
);

INSERT INTO public.detailv (selectorid,feature,detail )VALUES (
    11,
    'color',
    'stainless steel'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    11,
    'convection',
    'no'
);

INSERT INTO public.detailv (selectorid,feature,detail)VALUES (
    11,
    'power (watts)',
    '900'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    4,
    'appearance',
    5.0
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    4,
    'cooks well',
    4.3
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    4,
    'noise',
    4.3
);

-- ENTRY PRODUCT 5

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Droideka',
    .5,
    902,
    false,
    '',
    'microwave stuff',
    '/microwave_stuff',
    'https://w7.pngwing.com/pngs/301/438/png-transparent-cartoon-microwave-oven-cartoon-microwave-oven-cartoon-character-electronics-rectangle.png'
);

--PRODUCT 5 SELECTION 1 DEFAULT (12)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price, shipping,
    ship_price, discount, list_price, about_item, selector_text, selector_img, isdefault, instock,
    message, lowstock_message, shipping_message, type_title )VALUES (
    5,
    'Stainless Steel Toshiba 1.6 Cu.ft Microwave with Sensor',
    1,
    1,
    150.00,
    true,
    9.99,
    true,
    160.00,
    'Sensor Included*Due diligence big picture, product management breakout fastworks loop back.*Price point translating our vision of having a market leading platfrom yet time to open the kimono nor downselect table the discussion*',
    'Stainless Steel with Sensor',
    '',
    true,
    117,
    '',
    'Currently this item is low in stock. Hurry and order today!',
    '',
    'Color + Sensor'
);

 INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    12,
    'color',
    'Stainless Steel'
 );

  INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    12,
    'power (watts)',
    '1000'
  );
 INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    12,
    'noise',
    'yes'
 );

 INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    12,
    'size',
    '1.6 Cu.ft'
 );


--PRODUCT 5 SELECTION 2 (13)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price, shipping,
            ship_price, discount, list_price, about_item, selector_text, selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    5,
    'Stainless Steel Toshiba 1.6 Cu.ft Microwave',
    1,
    1,
    110.00,
    true,
    9.99,
    true,
    120.00,
    'No sensor included. Requires user to use the force*Due diligence big picture, product management breakout fastworks loop back.*Price point translating our vision of having a market leading platfrom yet time to open the kimono nor downselect table the discussion*',
    'Stainless Steel with Sensor',
    '',
    false,
    117,
    '',
    'Currently this item is low in stock. Hurry and order today!',
    '',
    'Color + Sensor'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    13,
    'color',
    'Stainless Steel'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    13,
    'power (watts)',
    '1000'
);
 INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    13,
    'noise',
    'no'
 );

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    13,
    'size',
    '1.6 Cu.ft'
);

--PRODUCT 5 SELECTION 3 (14)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    5,
    'Toshiba 1.6 Cu.ft Microwave in Black',
    1,
    1,
    160.00,
    true,
    12.99,
    true,
    180.00,
    'Sensor included.* Requires user to use the force*Due diligence big picture, product management breakout fastworks loop back.*Price point translating our vision of having a market leading platfrom yet time to open the kimono nor downselect table the discussion*',
    'Stainless Steel with Sensor',
    '',
    false,
    14,
    '',
    'Currently this item is low in stock. Hurry and order today!',
    '',
    'Color + Sensor'
);

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    14,
    'color',
    'black'
    );

INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    14,
    'power (watts)',
    '1000'
);
 INSERT INTO public.detailv ( selectorid, feature, detail ) VALUES (
    14,
    'noise',
    'yes'
 );

 INSERT INTO public.detailv ( selectorid, feature, detail
 ) VALUES (
    14,
    'size',
    '1.6 Cu.ft'
 );

 INSERT INTO public.featurev ( productvid, title, rating
 ) VALUES (
    5,
    'appearance',
    3.6
 );
 INSERT INTO public.featurev ( productvid, title, rating
  ) VALUES (
     5,
     'energy efficient',
     1.5
  );
INSERT INTO public.featurev ( productvid, title, rating
  ) VALUES (
     5,
     'noise',
     4.9
  );

  -- ENTRY PRODUCT 6

  INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
      'Obi-Wan Kenobi',
      1.9,
      902,
      false,
      '',
      'ninja stuff',
      '/ninja_stuff',
      'https://image.freepik.com/free-vector/cartoon-ninja_6460-635.jpg'
  );

--PRODUCT 6 SELECTION 1 DEFAULT (15)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    6,
    'Ninja Professional Blender (BL610)',
    2,
    2,
    80.00,
    true,
    7.99,
    false,
    0.00,
    'Price point translating our vision of having a market leading platfrom yet time to open the kimono nor downselect table the discussion* Incentivization we need to button up our approach cloud native container based but weaponize the data but what the for product market fit prethink.* We’re starting to formalize flexible opinions around our foundations pushback.*',
    'BL610',
    'https://www.iconsdb.com/icons/preview/black/square-xxl.png',
    true,
    200,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    15,
    'color',
    'black'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    15,
    'grade',
    'professional'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    15,
    'multiple containers',
    'yes'
);

--PRODUCT 6 SELECTION 2 (16)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    6,
    'Ninja Professional Blender (GR610)',
    2,
    2,
    79.99,
    true,
    7.99,
    false,
    0.00,
    'Market leading platfrom yet time to open the kimono nor downselect table the discussion* Approach cloud native container based but weaponize the data but what the for product market fit prethink.* Flexible opinions around our foundations pushback.*',
    'GR610',
    'https://www.iconsdb.com/icons/preview/dim-gray/square-xxl.png',
    false,
    0,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    16,
    'color',
    'grey'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    16,
    'grade',
    'professional'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    16,
    'multiple containers',
    'yes'
);

--PRODUCT 6 SELECTION 3 (17)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    6,
    'Ninja Grade A Blender (BL610-A)',
    2,
    2,
    79.99,
    true,
    7.99,
    false,
    0.00,
    'Quick-win turn the crank to be inspired is to become creative, innovative and energized we want this philosophy to trickle down to all our stakeholders and turn the crank.* Approach cloud native container based but weaponize the data but what the for product market fit prethink.* Flexible opinions around our foundations pushback.*',
    'BL610-A',
    'https://www.iconsdb.com/icons/preview/black/square-xxl.png',
    false,
    3,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    17,
    'color',
    'black'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    17,
    'grade',
    'grade-A'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    17,
    'multiple containers',
    'yes'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    6,
    'ease of use',
    2.0
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    6,
    'blending abilities',
    5.0
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    6,
    'ninja skills',
    4.8
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    6,
    'ninja training manual',
    3.4
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    6,
    'mobility',
    4.9
);

-- ENTRY PRODUCT 7

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Saesee Tiin',
    3.2,
    902,
    false,
    '',
    'ninja stuff',
    '/ninja_stuff',
    'https://image.freepik.com/free-vector/cartoon-ninja_6460-635.jpg'
);

--PRODUCT 7 SELECTION 1 DEFAULT (18)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    7,
    'Nutri Ninja Ninja Blender Duo with Auto-iQ (BL642)',
    2,
    2,
    95.00,
    true,
    17.99,
    true,
    115.00,
    'Get six alpha pups in here for a focus group* Work flows value-added we need more paper for in an ideal world bottleneck mice can you put it into a banner that is not alarming*Duo with Auto-iQ',
    'BL642',
    'https://www.iconsdb.com/icons/preview/black/square-xxl.png',
    true,
    20,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    18,
    'color',
    'black'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    18,
    'multiple containers',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    18,
    'container capacities',
    '72 oz, 18 oz, & 32 oz'
);

--PRODUCT 7 SELECTION 2

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    7,
    'Nutri Ninja Ninja Blender Duo with Auto-iQ (GR642)',
    2,
    2,
    95.00,
    true,
    17.99,
    true,
    115.00,
    'Get six alpha pups in here for a focus group* Work flows value-added we need more paper for in an ideal world bottleneck mice can you put it into a banner that is not alarming*Duo with Auto-iQ',
    'GR642',
    'https://www.iconsdb.com/icons/preview/black/square-xxl.png',
    false,
    203,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    19,
    'color',
    'grey'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    19,
    'multiple containers',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    19,
    'container capacities',
    '72 oz, 18 oz, & 32 oz'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    7,
    'container sizes',
    4.8
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    7,
    'ability to hide',
    2.3
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    7,
    'noise',
    1.2
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    7,
    'ninja skills',
    0.3
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    7,
    'extras',
    3.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    7,
    'double ninja skills',
    2.4
);

-- ENTRY PRODUCT 8

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Yoda',
    5.0,
    902,
    true,
    'Amazin Choice',
    'ninja stuff',
    '/ninja_stuff',
    'https://www.how-to-draw-cartoons-online.com/image-files/cartoon-ninja.gif.pagespeed.ce.uFsdG1ronn.gif'
);

--PRODUCT 8 SELECTION 1 DEFAULT (20)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    8,
    'Ninja Professional Blender & Nutri Ninja Cups (BL660)',
    0,
    0,
    100.00,
    true,
    14.99,
    false,
    0.00,
    'Today shall be a cloudy day, thanks to blue sky thinking* we can now deploy our new ui to the cloud we dont want to boil the ocean but market-facing*yet conversational content but create spaces to explore*hose options are already baked in with this model*At the end of the day we need a recap by eod*',
    '',
    '',
    true,
    5,
    'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    ''
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    20,
    'container sizes',
    '72oz & 16oz'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    20,
    'power (watts)',
    '1100'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    8,
    'Yoda skills',
    5.0
);

-- ENTRY PRODUCT 9

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Mace Windu',
    5.0,
    1302,
    true,
    '#1 Best Seller',
    'ninja stuff',
    '/ninja_stuff',
    'https://img.pngio.com/ninja-star-clipart-star-cliparts-cartoons-jingfm-ninja-star-clipart-920_960.png'
);

--PRODUCT 9 SELECTION 1 DEFAULT (21)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    9,
    'Ninja Mega Kitchen System (BL770)',
    2,
    2,
    140.00,
    false,
    0.00,
    true,
    150.00,
    'Work flows value-added we need more paper* For in an ideal world bottleneck*Mice can you put it into a banner that is not alarming*Duo with Auto-iQ',
    'BL770 Kitchen System',
    'https://www.iconsdb.com/icons/preview/black/square-xxl.png',
    true,
    20,
    '',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    21,
    'multiple containers',
    'no'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    21,
    'color',
    'black'
);

--PRODUCT 9 SELECTION 2 (22)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    9,
    'Ninja Mega Kitchen System (SV770)',
    2,
    2,
    140,
    false,
    0.00,
    false,
    0.00,
    'Get six alpha pups in here for a focus group* Work flows value-added we need more paper for in an ideal world bottleneck mice can you put it into a banner that is not alarming*Duo with Auto-iQ',
    'SV770 Kitchen System',
    'https://www.iconsdb.com/icons/preview/silver/square-xxl.png',
    false,
    120,
    '',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    22,
    'multiple containers',
    'no'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    22,
    'color',
    'silver'
);

--PRODUCT 9 SELECTION 3 (23)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    9,
    'Ninja Mega Kitchen System (GR770)',
    2,
    2,
    140.00,
    false,
    0.00,
    true,
    150.00,
    'Get six alpha pups in here for a focus group* Work flows value-added we need more paper for in an ideal world bottleneck mice can you put it into a banner that is not alarming*Duo with Auto-iQ',
    'GR770 Kitchen System',
    'https://www.iconsdb.com/icons/preview/dim-gray/square-xxl.png',
    false,
    120,
    '',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    'Shipping free with approval of Amazin Store Card',
    'Model / Color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    23,
    'multiple containers',
    'no'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    23,
    'color',
    'grey'
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    9,
    'ninja skills',
    5.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    9,
    'jedi skills',
    5.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    9,
    'blending',
    4.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    9,
    'more stuff',
    4.7
);

-- ENTRY PRODUCT 10

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Luke Skywalker',
    4.5,
    1302,
    true,
    '#1 Best Seller',
    'ninja stuff',
    '/ninja_stuff',
    'https://img.pngio.com/ninja-star-clipart-star-cliparts-cartoons-jingfm-ninja-star-clipart-920_960.png'
);

--PRODUCT 10 SELECTION 1 DEFAULT (24)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    10,
    'Nutri Ninja Auto iQ (BL480D)',
    2,
    2,
    50.00,
    true,
    5.00,
    true,
    62.99,
    'That is a good problem to have digitalize run it up the flag pole.*Viral engagement customer centric herding cats mobile friendly make sure to include in your wheelhouse but we need to have a meeting with Phil about his attitude can we align on lunch orders. Innovation is hot right now draw a line in the sand waste of resources bleeding edge.*',
    'BL480D',
    'https://www.iconsdb.com/icons/preview/black/square-xxl.png',
    true,
    64,
    '',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'Model / Color'
);

--PRODUCT 10 SELECTION 2 (25)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    10,
    'Nutri Ninja Auto iQ (GR480D)',
    2,
    2,
    50.00,
    true,
    5.00,
    true,
    62.99,
    'Flag pole.*Viral engagement customer centric herding cats mobile friendly make sure to include in* Your wheelhouse but we need to have a meeting with Phil about his attitude can we align on lunch orders. Innovation is hot right now draw a line in the sand waste of resources bleeding edge.*',
    'GR480D',
    'https://www.iconsdb.com/icons/preview/silver/square-xxl.png',
    false,
    90,
    '',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'Model / Color'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    10,
    'power saver',
    4.3
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    10,
    'blending powers',
    2.8
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    10,
    'ninja powers',
    4.7
);

-- ENTRY PRODUCT 11

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Jar Jar Binks',
    1.3,
    145,
    false,
    '',
    'kitchen aide',
    '/aide_stuff',
    'https://www.globalgilson.com/content/images/thumbs/0018217_portable-concrete-mixers.jpeg'
);

--PRODUCT 11 SELECTION 1 DEFAULT (26)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    11,
    'KitchenAide Professional 600 Mixer - Banana Yellow',
    2,
    2,
    270.00,
    false,
    0.00,
    false,
    0.00,
    'Organa solo hutt antilles han wookiee binks.*Darth mace greedo antilles organa antilles.* Binks hoth organa moff moff skywalker antilles lando greedo.*',
    '',
    'https://kitchenaid-h.assetsadobe.com/is/image/content/dam/global/kitchenaid/countertop-appliance/portable/images/hero-KSM150PSKG.tif',
    true,
    86,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today',
    '',
    'color'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    26,
    'capacity',
    '6 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    26,
    'color',
    'Banana Yellow'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    26,
    'power',
    '575 watts'
);

--PRODUCT 11 SELECTION (27)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    11,
    'KitchenAide Professional 600 Mixer - Pretty Pink',
    2,
    2,
    270.00,
    false,
    0.00,
    false,
    0.00,
    'Yoda amidala darth mon dantooine windu fisto leia.*Aayla kenobi greedo utapau lando dantooine moff windu sebulba.*Hutt dooku hutt tusken raider solo fett calrissian wookiee.*',
    '',
    'https://i.ebayimg.com/images/g/4bMAAOSwc15bP4Fc/s-l300.jpg',
    false,
    69,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    '',
    'color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    27,
    'capacity',
    '6 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    27,
    'color',
    'Pretty Pink'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    27,
    'power',
    '525 watts'
);

--PRODUCT 11 SELECTION (28)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    11,
    'KitchenAide Professional 600 Mixer - Sassy Silver',
    2,
    2,
    270.00,
    false,
    0.00,
    false,
    0.00,
    'Secura wicket palpatine kamino hutt yoda maul.*Wicket dantooine obi-wan r2-d2.*Binks mon solo moff luke antilles lando.*',
    '',
    'https://ak1.ostkcdn.com/images/products/9036210/KitchenAid-KSM7586PSR-Sugar-Pearl-Silver-7-quart-Bowl-Lift-Stand-Mixer-6563e17a-0ed6-4180-849b-0e348d8b7fe5_1000.jpg',
    false,
    96,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    '',
    'color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    28,
    'capacity',
    '5 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    28,
    'color',
    'Sassy Silver'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    28,
    'power',
    '525 watts'
);

--PRODUCT 11 SELECTION (29)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    11,
    'KitchenAide Professional 600 Mixer - Lime Green',
    2,
    2,
    270.00,
    false,
    0.00,
    false,
    0.00,
    'Binks mon solo moff luke antilles lando.*Secura wicket palpatine kamino hutt yoda maul. * Binks mon solo moff luke antilles lando. *',
    '',
    'https://images-na.ssl-images-amazon.com/images/I/7124M%2BqdOXL._AC_SX355_.jpg',
    false,
    67,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    '',
    'color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    29,
    'capacity',
    '6 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    29,
    'color',
    'Lime Green'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    29,
    'power',
    '575 watts'
);

--PRODUCT 11 SELECTION (30)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    11,
    'KitchenAide Professional 600 Mixer - Robbin Blue',
    2,
    2,
    270.00,
    false,
    0.00,
    false,
    0.00,
    ' Binks mon solo moff luke antilles lando.*Ventress amidala yoda yavin lobot.*Sith skywalker leia binks. Luke ahsoka c-3po boba antilles ventress ackbar thrawn jabba.*',
    '',
    'https://kitchenaid-h.assetsadobe.com/is/image/content/dam/global/kitchenaid/countertop-appliance/portable/images/hero-KSM150PSVB.tif',
    false,
    60,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    '',
    'color'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    30,
    'capacity',
    '5.5 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    30,
    'color',
    'Robbin Blue'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    30,
    'power',
    '550 watts'
);


INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    11,
    'rainbow colors',
    3.5
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    11,
    'aides your kitchen',
    1.3
);

-- ENTRY PRODUCT 12

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Leia Organa',
    3.7,
    234,
    true,
    'Amazins Choice',
    'kitchen aide',
    '/aide_stuff',
    'https://www.boschmixers.com/wp-content/uploads/2019/04/bosch-stand-mixer-wire-whips_4.jpg'
);

--PRODUCT 12 SELECTION 1 DEFAULT(31)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    12,
    'KitchenAide Artisan Mixer with Artisan Mixer Bundle Pack',
    3,
    3,
    250.00,
    false,
    0.00,
    true,
    279.99,
    'Quarterly sales are at an all-time low peel the onion.*I really like the colour but can you change it just do what you think. I trust you, nor doing some work for us "pro bono" will really add to your portfolio*I love it, but can you invert all colors?*It needs to be the same, but totally different I like it, but can the snow look a little warmer*should feel like a warm handshake*',
    'Bundle Pack',
    '',
    true,
    16,
    '',
    'Currently this item is low in stock. Mix it up today!',
    '',
    'Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    31,
    'bundle',
    'included with offer'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    31,
    'warranty',
    'not included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    31,
    'classical model',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    31,
    'ranking of product',
    '#1 best kitchen helper'
);

--PRODUCT 12 SELECTION 2 (32)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    12,
    'KitchenAide Artisan Mixer without Pack - Sold Separately',
    3,
    3,
    250.00,
    false,
    0.00,
    true,
    270.00,
    'ugh make the font bigger for can you make it look more designed . Can we try some other colours maybe can you make the font bigger?*Conversational content deploy to production we need to harvest synergy effects.*',
    'Sold seperately',
    '',
    false,
    60,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    32,
    'bundle',
    'sold seperately'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    32,
    'warranty',
    'not included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    32,
    'classical model',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    32,
    'ranking of product',
    '#1 best kitchen helper'
);

--PRODUCT 12 SELECTION 3 (33)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    12,
    'KitchenAide Artisan Mixer - Pack and One Year Warranty Included',
    3,
    3,
    250.00,
    false,
    0.00,
    true,
    289.99,
    'so i was wondering if my cat could be placed over the logo in the flyer*like this clipart i found yet give us a complimentary logo along with the website*Five-year strategic plan I have zero cycles for this locked and loaded*Conversational content deploy to production we need to harvest synergy effects.*',
    'Pack and Warranty',
    '',
    false,
    60,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Included'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    33,
    'bundle',
    'included with offer'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    33,
    'warranty',
    'included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    33,
    'classical model',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    33,
    'ranking of product',
    '#1 best kitchen helper'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    12,
    'Mobility',
    1.2
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    12,
    'Bundle of fun',
    4.3
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    12,
    'Fun',
    3.2
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    12,
    'Mixing capacity',
    3.5
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    12,
    'Mixing Style',
    2.2
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    12,
    'Mixing Technique',
    2.1
);

-- ENTRY PRODUCT 13

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Han Solo',
    3.1,
    145,
    false,
    '',
    'kitchen aide',
    '/aide_stuff',
    'https://image.dhgate.com/0x0p/f2/albu/g7/M00/51/B9/rBVaSVtFcTiAIpzoAAR0FUyDg1I215.jpg'
);

--PRODUCT 13 SELECTION 1 DEFAULT (34)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    13,
    'KitchenAide Artisan Mixer with Warranty and Mixing Bundle Pack',
    3,
    3,
    230.00,
    true,
    14.99,
    false,
    0.00,
    'so i was wondering if my cat could be placed over the logo in the flyer*like this clipart i found yet give us a complimentary logo along with the website*Five-year strategic plan I have zero cycles for this locked and loaded*Conversational content deploy to production we need to harvest synergy effects.*',
    'Pack and Warranty',
    '',
    true,
    19,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    34,
    'warranty and bundle',
    'included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    34,
    'capacity',
    '4.5 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    34,
    'color',
    'black'
);

--PRODUCT 13 SELECTION 2 (35)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    13,
    'KitchenAide Artisan Mixer, Mixing Bundle sold separately',
    3,
    3,
    210.00,
    true,
    14.99,
    false,
    0.00,
    'so i was wondering if my cat could be placed over the logo in the flyer*like this clipart i found yet give us a complimentary logo along with the website*Five-year strategic plan I have zero cycles for this locked and loaded*Conversational content deploy to production we need to harvest synergy effects.*',
    'Sold Seperate',
    '',
    false,
    33,
    'Grievous amidala darth utapau darth organa solo mace jango.',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Included'
);
INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    35,
    'warranty and bundle',
    'sold separately'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    35,
    'capacity',
    '4.5 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    35,
    'color',
    'black'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    13,
    'aiding kitchen',
    3.0
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    13,
    'power',
    1.0
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    13,
    'Options',
    5.0
);

-- ENTRY PRODUCT 14

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Lando Calrissian',
    4.2,
    145,
    true,
    '#1 Best Seller',
    'kitchen aide',
    '/aide_stuff',
    'https://www.globalgilson.com/content/images/thumbs/0018217_portable-concrete-mixers.jpeg'
);

--PRODUCT 14 SELECTION 1 DEFAULT (36)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    14,
    'KitchenAide Classic Plus Mixer',
    0,
    0,
    350.00,
    true,
    9.99,
    true,
    375.00,
    'Dagobah ventress darth luke antilles aayla.* Mon wampa palpatine chewbacca hutt.*Wampa hutt moff mandalorians solo.* Wicket droid solo windu dooku* Binks mon solo moff luke antilles lando.* Bespin jango jabba lobot anakin darth skywalker hutt.* Boba jinn ponda sebulba hutt.*',
    '',
    '',
    true,
    22,
    'Ubb hapan soontir bormea melodie.',
    'Currently this item is low in stock. Mix it up today!',
    'we are shipping. this is a personalized message to ship.',
    'Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    36,
    'modes',
    '10'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    36,
    'power (watts)',
    '250'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    36,
    'hand mixer',
    'included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    36,
    'capacity',
    '4.5 quarts'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    36,
    'color',
    'black'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    14,
    'variation',
    0.9
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    14,
    'blending power',
    5.0
);

-- ENTRY PRODUCT 15

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Chewbacca',
    1.3,
    145,
    false,
    '',
    'kitchen aide',
    '/aide_stuff',
    'https://i.ytimg.com/vi/N8Bnc770XZo/maxresdefault.jpg'
);

--PRODUCT 15 SELECTION 1 DEFAULT (37)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    15,
    'KitchenAide Artisan Design Mixer, Diamond Design',
    2,
    2,
    300.00,
    false,
    0.00,
    false,
    0.00,
    'Lucas ipsum dolor sit amet felucia weequay chewbacca qrygg tibor farlander feeorin muun qel-droma klivian.* Peck lytton ranat davin keshiri carnor aayla vulptereen. Umbaran sarn naberrie haako. Lannik tibor greeata hutt mccool jabba. Bothan lando elom olié.* Hnemthean jabba sal-solo utapau warrick twilek terentatek arkanian organa. Taun thisspias castell iridonian watto endocott illum cbaoth rahn.* Wookiee antilles luke rendar ruurian haruun.* Jango medon gado fosh iktotchi felucia thul wuher.*',
    '',
    'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/diamond-deck-of-cards-custom-home-fashions.jpg',
    true,
    45,
    '',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Design Featured'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    37,
    'color',
    'white'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    37,
    'design',
    'diamonds'
);

--PRODUCT 15 SELECTION 2 (38)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    15,
    'KitchenAide Artisan Design Mixer, Heart Design',
    2,
    2,
    300.00,
    false,
    0.00,
    false,
    0.00,
    'Chirrpa sidious trioculus duro endor neti bormea.* C-3p0 raymus klaatu dengar cb-99 zorba roonan. Boba sith ahsoka moore yaka ubese. Mod lowbacca vebb malastare qu lumiya unu.* Seerdon veers polis farlax psadan antilles.*',
    '',
    'https://cdn4.vectorstock.com/i/1000x1000/56/73/playing-cards-heart-vector-20655673.jpg',
    false,
    62,
    '',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Design Featured'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    38,
    'color',
    'white'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    38,
    'design',
    'hearts'
);

--PRODUCT 15 SELECTION 3 (39)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    15,
    'KitchenAide Artisan Design Mixer, Spade Design',
    2,
    2,
    300.00,
    false,
    0.00,
    false,
    0.00,
    'spades design designing spades stuff this is stuff*Five-year strategic plan I have zero cycles for this locked and loaded*Conversational content deploy to production we need to harvest synergy effects.*',
    '',
    'https://cdn4.vectorstock.com/i/1000x1000/74/33/spades-suit-flat-icon-vector-19617433.jpg',
    false,
    44,
    '',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Design Featured'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    39,
    'color',
    'white'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    39,
    'design',
    'spades'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    15,
    'options',
    4.0
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    15,
    'crushing',
    4.5
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    15,
    'blending',
    2.1
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    15,
    'energy saving',
    4.7
);

-- ENTRY PRODUCT 16

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Darth Maul',
    3.2,
    145,
    true,
    '#1 Best Seller',
    'toaster stuff',
    '/toaster_stuff',
    'https://2.bp.blogspot.com/-cQeEgYLn2tQ/VZOEgvumRSI/AAAAAAAAAPc/lF9aUEDBlU8/s1600/20150630012806326.jpeg'
);

--PRODUCT 16 SELECTION 1 DEFAULT (40)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    16,
    'Cuisinart 2-Slice Compact Toaster (CPT-122)',
    1,
    1,
    15.00,
    true,
    4.99,
    true,
    20.00,
    'Gamorr sabé cerean darth antilles.* Bimm tano dodonna veila shawda sarn vuffi piett saché.*',
    'CPT-122 - 2 slice compact',
    '',
    true,
    63,
    'And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Product Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    40,
    'No. of slices',
    '2 slice'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    40,
    'angle of slot',
    'vertical'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    40,
    'compact',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    40,
    'portability',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    40,
    'dimensions',
    '7" W x 12" D x 8-1/4" H'
);


--PRODUCT 16 SELECTION 2 (41)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    16,
    'Cuisinart 2-Slice Tilted 45deg Toaster (CPT-123)',
    1,
    1,
    15.00,
    true,
    4.99,
    true,
    20.00,
    'Gamorr sabé cerean darth antilles.* Bimm tano dodonna veila shawda sarn vuffi piett saché.*',
    'Pack and Warranty',
    'CPT-123 - 2 slice angled',
    false,
    639,
    'And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Product Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    41,
    'No. of slices',
    '2 slice'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    41,
    'angle of slot',
    'tilted 45 degrees'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    41,
    'compact',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    41,
    'portability',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    41,
    'dimensions',
    '7" W x 12" D x 8-1/4" H'
);

--PRODUCT 16 SELECTION 3 (42)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    16,
    'Cuisinart 3-Slice Compact Toaster (CPT-124)',
    1,
    1,
    20.00,
    true,
    4.99,
    false,
    0.00,
    'Organa balosar shimrra kwa.*Gamorr sabé cerean darth antilles.* Bimm tano dodonna veila shawda sarn vuffi piett saché.*',
    'CPT-124 -3 slice compact',
    '',
    false,
    87,
    'This is a message that is unique and its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Product Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    42,
    'No. of slices',
    '3 slice'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    42,
    'angle of slot',
    'vertical'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    42,
    'compact',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    42,
    'portability',
    'no'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    42,
    'dimensions',
    '10" W x 12" D x 8-1/4" H'
);

--PRODUCT 16 SELECTION 4 (43)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    16,
    'Cuisinart 3-Slice Tilted 45deg Toaster (CPT-125)',
    1,
    1,
    20.00,
    true,
    4.99,
    false,
    0.00,
    'Organa balosar shimrra kwa.*Gamorr sabé cerean darth antilles.* Bimm tano dodonna veila shawda sarn vuffi piett saché.*',
    'CPT-124 -3 slice angled',
    '',
    false,
    63,
    'This is a message that is unique and its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Product Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    43,
    'No. of slices',
    '3 slice'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    43,
    'angle of slot',
    'tilted 45 degrees'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    43,
    'compact',
    'yes'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    43,
    'portability',
    'no'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    43,
    'dimensions',
    '10" W x 12" D x 8-1/4" H'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    16,
    'toasting',
    4.3
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    16,
    'variation',
    4.2
);

-- ENTRY PRODUCT 17

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Jabba the Hut',
    5.0,
    145,
    false,
    '',
    'toaster stuff',
    '/toaster_stuff',
    'http://www.gotfunnypictures.com/wp-content/uploads/2014/09/NewImagesAug-28-50.jpg'
);

--PRODUCT 17 SELECTION 1 DEFAULT (44)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    17,
    'Cuisinart Brushed Compact Toaster (CPT-320)',
    0,
    0,
    30.00,
    true,
    9.99,
    true,
    38.78,
    'Cerea mon shaak sy dexter. Moff jerec dexter maarek baba. Thrella ongree hallotan djo shaddaa. Grievous depa roonan zuggs beru jax.*Dantari su shaddaa farlander droid phlog kast meridian.*Dash metalorn mustafarian aurra padmé klatooinian. Darth caamasi biggs bothan. Jinha gado tchuukthai ima-gun tiin.*',
    '',
    '',
    true,
    3,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    ''
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    44,
    'No. slots',
    '2 slots'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    44,
    'dimensions',
    '7" W x 12" D x 8-1/4" H'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    44,
    'color',
    'stainless silver'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    17,
    'features',
    5.0
);

-- ENTRY PRODUCT 18

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Boba Fett',
    5.0,
    34,
    false,
    '#1 Best Seller',
    'toaster stuff',
    '/toaster_stuff',
    'https://iruntheinternet.com/lulzdump/images/funny-toaster-car-bannana-freeway-13691638463.jpg'
);

--PRODUCT 18 SELECTION 1 DEFAULT (45)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    18,
    'Cuisinart Brushed Compact Toaster (CPT-160)',
    0,
    0,
    30.00,
    true,
    7.99,
    true,
    32.00,
    'Luminara umbaran mimbanite tambor keyan whiphid sern.* Woostoid antilles terrik hobbie. Durron abrion momaw monkey-lizard troig teek. Ralter yaka greeata ranat aramandi zabrak nilgaard zuckuss nien.*',
    '',
    '',
    true,
    43,
    'Luminara umbaran mimbanite tambor keyan whiphid sern.',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    ''
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    45,
    'No. slots',
    '2 slots'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    45,
    'dimensions',
    '7-1/2" W x 12" D x 8-1/2" H'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    45,
    'color',
    'stainless silver'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    18,
    'toasting',
    4.7
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    18,
    'burnt toast',
    4.9
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    18,
    'mobility',
    5.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    18,
    'hotness',
    4.2
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    18,
    'popularity',
    4.2
);

-- ENTRY PRODUCT 19

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'Sheev Palpatine',
    5.0,
    145,
    true,
    'Amazins Choice',
    'toaster stuff',
    '/toaster_stuff',
    'https://laughingsquid.com/wp-content/uploads/defibrillator-toaster-20100730-012000.jpg'
);

--PRODUCT 19 SELECTION 1 DEFAULT (46)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    19,
    'Cuisinart Countdown Toaster (CPT-415) with 2 slice capacity',
    2,
    2,
    35.00,
    false,
    0.00,
    false,
    0.00,
    'Nomi mara xizor dexter argazdan tatooine omas wampa naberrie. Ti yaddle ackbar tarkin. Windu elomin ooryl gamorrean.',
    '2 slots',
    'https://images-na.ssl-images-amazon.com/images/I/81Qwfos6ViL._AC_SL1500_.jpg',
    true,
    55,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Features Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    46,
    'color',
    'stainless silver'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    46,
    'slot number',
    '2 slices'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    46,
    'no of dials',
    '4'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    46,
    'dimensions',
    '20.96 x 31.43 x 22.86 cm'
);

--PRODUCT 19 SELECTION 2 (47)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    19,
    'Cuisinart Countdown Toaster (CPT-415) with 4 slice capacity',
    2,
    2,
    45.00,
    false,
    0.00,
    false,
    0.00,
    'Nomi mara xizor dexter argazdan tatooine omas wampa naberrie. Ti yaddle ackbar tarkin. Windu elomin ooryl gamorrean.',
    '4 slots',
    'https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/394048-4-slice-toasters-cuisinart-countdown-metal-cpt-435-59288.png',
    false,
    43,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Features Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    47,
    'color',
    'stainless silver'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    47,
    'slot number',
    '4 slices'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    47,
    'no of dials',
    '8'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    47,
    'dimensions',
    '40.96 x 31.43 x 42.86 cm'
);



--PRODUCT 19 SELECTION 3 (48)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    19,
    'Cuisinart Countdown Toaster (CPT-415) with 2 slice capacity and extended cord',
    2,
    2,
    38.00,
    false,
    0.00,
    false,
    0.00,
    'Nomi mara xizor dexter argazdan tatooine omas wampa naberrie. Ti yaddle ackbar tarkin. Windu elomin ooryl gamorrean.',
    '2 slots - extended cord',
    'https://images-na.ssl-images-amazon.com/images/I/81Qwfos6ViL._AC_SL1500_.jpg',
    false,
    36,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Features Included'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    48,
    'color',
    'stainless silver'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    48,
    'slot number',
    '2 slices'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    48,
    'no of dials',
    '4'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    48,
    'dimensions',
    '20.96 x 31.43 x 22.86 cm'
);


INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    19,
    'popularity',
    5.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    19,
    'hotness',
    5.0
);

-- ENTRY PRODUCT 20

INSERT INTO public.productv ( seller, rating, user_rating, tag, tag_title, category, category_link, similar_item ) VALUES (
    'General Grievous',
    1.2,
    145,
    false,
    '',
    'toaster stuff',
    '/toaster_stuff',
    'http://www.pmslweb.com/the-blog/wp-content/uploads/2013/10/52-toaster-printer-300x220.jpg'
);

--PRODUCT 20 SELECTION 1 DEFAULT(49)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    20,
    'Cuisinart Touch to Toast Leverless Toaster (CPT-420)',
    1,
    1,
    40.00,
    false,
    0.00,
    true,
    43.00,
    'X2 rattatak tchuukthai ortolan su miraluka skywalker palpatine aayla. Nikto dagobah sly amanin anthos maximilian sidious trianii. Ansuroer yevetha darth jango moff warrick abregado. Zev wampa tyber tierce wirutid tiin cathar castell.* Ansuroer jodo charal teek kor-uj. Tarpals thisspiasian vurk zann binks baba joh. Moff mace charal sykes darth. Chommell maris onimi antemeridian airen ysanne rahm opress massassi. Phlog boz var rancisis mara yaka solo dash. Himoran k-3po yavin kyp hypori kohl duros rishi endocott.*',
    'Touch to Toast - Leverless',
    '',
    true,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Toaster Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    49,
    'slot number',
    '2 slices'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    49,
    'special features',
    'leverless'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    49,
    'dimensions',
    '20.96 x 31.43 x 22.86 cm'
);

--PRODUCT 20 SELECTION 2 (50)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    20,
    'Cuisinart Touch to Toast With Levers Toaster (CPT-422)',
    1,
    1,
    40.00,
    true,
    13.99,
    true,
    43.00,
    'X2 rattatak tchuukthai ortolan su miraluka skywalker palpatine aayla. Nikto dagobah sly amanin anthos maximilian sidious trianii. Ansuroer yevetha darth jango moff warrick abregado. Zev wampa tyber tierce wirutid tiin cathar castell.* Ansuroer jodo charal teek kor-uj. Tarpals thisspiasian vurk zann binks baba joh. Moff mace charal sykes darth. Chommell maris onimi antemeridian airen ysanne rahm opress massassi.*',
    'Touch to Toast - Lever option',
    '',
    false,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Toaster Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    50,
    'slot number',
    '2 slices'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    50,
    'special features',
    'leverless with lever options'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    50,
    'dimensions',
    '20.96 x 31.43 x 22.86 cm'
);

--PRODUCT 20 SELECTION 3 (51)

INSERT INTO public.selector ( productvid, title, type_selector, selector_num, price,shipping,
            ship_price, discount, list_price, about_item, selector_text,selector_img, isdefault,
            instock, message, lowstock_message, shipping_message, type_title ) VALUES (
    20,
    'Cuisinart Alexa Controlled to Toast Leverless Toaster (CPT-424)',
    1,
    1,
    60.00,
    true,
    13.99,
    true,
    66.00,
    'X2 rattatak tchuukthai ortolan su miraluka skywalker palpatine aayla. Nikto dagobah sly amanin anthos maximilian sidious trianii. Ansuroer yevetha darth jango moff warrick abregado. Zev wampa tyber tierce wirutid tiin cathar castell. Ansuroer jodo charal teek kor-uj. Tarpals thisspiasian vurk zann binks baba joh. Moff mace charal sykes darth. Chommell maris onimi antemeridian airen ysanne rahm opress massassi. Phlog boz var rancisis mara yaka solo dash. Himoran k-3po yavin kyp hypori kohl duros rishi endocott.*Alexa Included voice commands with manual*',
    'Voice to Toast with Alexa',
    '',
    false,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Mix it up today!',
    'shipping is a message. this is a shipping message',
    'Toaster Model'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    51,
    'slot number',
    '2 slices'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    51,
    'special features',
    'leverless - voice command options'
);

INSERT INTO public.detailv ( selectorid, feature, detail )  VALUES (
    51,
    'dimensions',
    '20.96 x 31.43 x 22.86 cm'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    20,
    'toasting',
    4.7
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    20,
    'bread factor',
    4.0
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    20,
    'build',
    4.3
);