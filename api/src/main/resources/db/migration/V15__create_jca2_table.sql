-- Table: public.jca01
-- DROP TABLE public.jca01;
CREATE TABLE public.jca2 (
    itemId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    prime text NOT NULL,
    imgurl text NOT NULL
) TABLESPACE pg_default;
ALTER TABLE public.jca2 OWNER to postgres;
COMMENT ON TABLE public.jca2 IS 'JCA2 table';
COMMENT ON COLUMN public.jca2.itemId IS 'jca2 ids';
COMMENT ON COLUMN public.jca2.prime IS 'prime checkmark';
COMMENT ON COLUMN public.jca2.imgurl IS 'image url';