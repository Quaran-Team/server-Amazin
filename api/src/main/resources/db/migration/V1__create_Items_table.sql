-- Table: public.items
-- DROP TABLE public.items;
CREATE TABLE public.items (
    itemId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    itemName text NOT NULL,
    itemPrice text NOT NULL,
    itemDescription text DEFAULT 'This is a product, etc., etc.'::text,
    itemRating text,
    itemColor text,
    itemMode text,
    itemSound text,
    itemCategory text NOT NULL,
    itemPower text,
    itemCapacity text
) TABLESPACE pg_default;
ALTER TABLE public.items OWNER to postgres;
COMMENT ON TABLE public.items IS 'Items table. This should hold most of the item data needed for the site.';
COMMENT ON COLUMN public.items.itemId IS 'items ids';
COMMENT ON COLUMN public.items.itemName IS 'This is the item name.';
COMMENT ON COLUMN public.items.itemDescription IS 'model number and other facts';
COMMENT ON COLUMN public.items.itemPrice IS 'price for each item';
COMMENT ON COLUMN public.items.itemRating IS 'rating component';
COMMENT ON COLUMN public.items.itemColor IS 'product color';
COMMENT ON COLUMN public.items.itemSound IS 'whether the item makes noise or not';
COMMENT ON COLUMN public.items.itemCategory IS 'to pull in each group';
COMMENT ON COLUMN public.items.itemPower IS 'power level';
COMMENT ON COLUMN public.items.itemCapacity IS 'how much can it hold';