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

INSERT INTO public.productv (
            seller,
            rating,
            user_rating,
            tag,
            tag_title,
            category,
            category_link,
            similar_item
    )
VALUES (
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
    6,
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
    ''
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
    '',
    '',
    'https://kitchenaid-h.assetsadobe.com/is/image/content/dam/global/kitchenaid/countertop-appliance/portable/images/hero-KSM150PSKG.tif',
    true,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'color'
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
    '',
    '',
    'https://i.ebayimg.com/images/g/4bMAAOSwc15bP4Fc/s-l300.jpg',
    false,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'color'
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
    '',
    '',
    'https://ak1.ostkcdn.com/images/products/9036210/KitchenAid-KSM7586PSR-Sugar-Pearl-Silver-7-quart-Bowl-Lift-Stand-Mixer-6563e17a-0ed6-4180-849b-0e348d8b7fe5_1000.jpg',
    false,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'color'
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
    '',
    '',
    'https://images-na.ssl-images-amazon.com/images/I/7124M%2BqdOXL._AC_SL1500_.jpg',
    false,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'color'
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
    '',
    '',
    'https://kitchenaid-h.assetsadobe.com/is/image/content/dam/global/kitchenaid/countertop-appliance/portable/images/hero-KSM150PSVB.tif',
    false,
    6,
    'This is a message that is unique. I can promise that. And its attached to this product',
    'Currently this item is low in stock. Hurry and get your ninja today!',
    '',
    'color'
);

INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    10,
    'rainbow colors',
    3.5
);
INSERT INTO public.featurev ( productvid, title, rating ) VALUES (
    10,
    'aides your kitchen',
    1.3
);

