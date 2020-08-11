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
        'R2-D2',
        3.4,
        3400,
        true,
        '#1 Best Seller',
        'neat stuff',
        '/neat_stuff',
        'https://media.wired.com/photos/5926a26d8d4ebc5ab806af55/master/w_1275,c_limit/Neat_TA.jpg'
        );

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
        'online stuff',
        '/online_stuff',
        'https://miro.medium.com/max/3840/1*_o9Z6bf_hnHlHcuEz5RUoA.jpeg'
        );

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
        'Yoda',
        3.0,
        902,
        true,
        'Amazins Choice',
        'appliance stuff',
        '/appliance_stuff',
        'https://image-cdn.neatoshop.com/styleimg/58757/none/gray/default/352112-20;1524845986u.jpg'
        );


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
    		'TotallY awesome neat, fastest ever, non-GMO, product version 12',
    		3,
    		3,
    		1000.00,
    		true,
    		45.99,
    		true,
    		1300.00,
    		'Scope creep today shall be a cloudy day, thanks to blue sky thinking, we can now deploy our new ui to the cloud quick-win and can you send me an invite? so free lunch.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    		'version 12',
    		'',
    		true,
    		98,
    		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    		'Currently this item is low in stock. Hurry and order today!',
    		'Shipping free with approval of Amazin Store Card',
    		'version'
        );
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
    		'TotallY awesome neat, fastest ever, non-GMO, product version 11',
    		3,
    		3,
    		900.00,
    		true,
    		42.99,
    		true,
    		1200.00,
    		'360 degree content marketing pool can we align on lunch orders.*Nobodys fault it could have been managed better pre launch. Game plan. (lets not try to) boil the ocean (here/there/everywhere) first-order optimal strategies corporate synergy.*Due diligence big picture, product management breakout fastworks loop back.*',
    		'version 11',
    		'',
    		false,
    		54,
    		'Get $10 off instantly: Pay $37.97 upon approval for the Amazin.com Store Card.',
    		'Currently this item is low in stock. Hurry and order today!',
    		'Shipping free with approval of Amazin Store Card',
    		'version'
        );

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
    		'Tech virtual drone online browser platform through in a system',
    		0,
    		0,
    		850.00,
    		false,
    		0.00,
    		false,
    		0.00,
    		'',
    		'',
    		'',
    		true,
    		200,
    		'Check out other great online stuff sales!',
    		'Limited supplies left!',
    		'',
    		''
        );

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
            'Purple Monkey Dishawaser, Super Efficent Sanitary',
    		2,
    		2,
    		1200.00,
    		true,
    		87.99,
    		true,
    		200.00,
    		'Now what are the possibilities of warp drive?*Cmdr Rikers nervous system has been invaded by an unknown microorganism.*The organisms fuse to the nerve*The vertex waves show a K-complex corresponding to an REM state.*Warp drive*Tribbles included*',
    		'Super Efficient Sanitary',
    		'https://cdn.drawception.com/images/panels/2012/8-8/jyNGmjc93d-2.png',
    		true,
    		5,
    		'',
    		'Soon to be no more monkeys!',
    		'Items shipped overseas will experience delays',
    		'brands'
        );

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
            'Purple Monkey Dishawaser, Super Effective Clean',
    		2,
    		2,
    		1300.00,
    		true,
    		87.99,
    		false,
    		0.00,
    		'Now what are the possibilities of warp drive?*Cmdr Rikers nervous system has been invaded by an unknown microorganism.*The organisms fuse to the nerve*The vertex waves show a K-complex corresponding to an REM state.*Tribbles NOT included*',
    		'Super Effective Clean',
    		'https://cdn.drawception.com/images/panels/2015/7-3/k9Qh7Xc5eK-2.png',
    		false,
    		17,
    		'',
    		'Soon to be no more monkeys!',
    		'Items shipped overseas will experience delays',
    		'brands'
        );

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    1,
    'Non-GMO',
    'true'
);

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    1,
    'Tested',
    'true'
);

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    1,
    'speed',
    'fastest ever'
);
INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    2,
    'Non-GMO',
    'true'
);

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    2,
    'Tested',
    'true'
);

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    2,
    'speed',
    '2nd fastest ever'
);


INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    3,
    'approved',
    'Simpson Stamp of Approval'
);

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    4,
    'approved',
    'Simpson Stamp of Approval'
);
INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    4,
    'extra features',
    'includes your own tribble'
);

INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    5,
    'approved',
    'Simpson Stamp of Approval'
);
INSERT INTO public.detailv (
    selectorid,
	feature,
	detail
)
VALUES (
    5,
    'extra features',
    'does not come with tribble'
);

INSERT INTO public.featurev (
    productvid,
	title,
	rating
)
VALUES (
    1,
    'Neat',
    4.5
);

INSERT INTO public.featurev (
    productvid,
	title,
	rating
)
VALUES (
    1,
    'Totally Awesome',
    3.2
);
INSERT INTO public.featurev (
    productvid,
	title,
	rating
)
VALUES (
    1,
    'Best Ever',
    5.0
);