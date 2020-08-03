-- Table: public.jca01
-- DROP TABLE public.jca01;
CREATE TABLE public.jca1 (
    itemId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    otherItems text NOT NULL
) TABLESPACE pg_default;
ALTER TABLE public.jca1 OWNER to postgres;
COMMENT ON TABLE public.jca1 IS 'JCA1 table';
COMMENT ON COLUMN public.jca1.itemId IS 'jca0 ids';
COMMENT ON COLUMN public.jca1.otherItems IS 'This is the other associated item ids';
