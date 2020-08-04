-- Table: public.customerreviews
-- DROP TABLE public.customerreviews;
CREATE TABLE public.customerreviews (
    itemId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    reviewer text NOT NULL,
    reviewTitle text NOT NULL
) TABLESPACE pg_default;
ALTER TABLE public.customerreviews OWNER to postgres;
COMMENT ON TABLE public.customerreviews IS 'customerreviews table';
COMMENT ON COLUMN public.customerreviews.itemId IS 'customerreview ids';
COMMENT ON COLUMN public.customerreviews.reviewer IS 'This is the person reviewing the item';
COMMENT ON COLUMN public.customerreviews.reviewTitle IS 'This the review title'