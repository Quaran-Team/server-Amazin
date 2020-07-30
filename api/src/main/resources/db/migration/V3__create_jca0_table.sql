-- Table: public.jca01
-- DROP TABLE public.jca01;
CREATE TABLE public.jca0 (
    itemId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    itemImage text NOT NULL
) TABLESPACE pg_default;
ALTER TABLE public.jca0 OWNER to postgres;
COMMENT ON TABLE public.jca0 IS 'JCA table';
COMMENT ON COLUMN public.jca0.itemId IS 'jca0 ids';
COMMENT ON COLUMN public.jca0.itemImage IS 'This is the item image urls';
