-- Table: public.customerreviews
-- DROP TABLE public.customerreviews;
CREATE TABLE public.customerreviews (
    reviewId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    itemId bigint NOT NULL,
    reviewer text NOT NULL,
    reviewTitle text NOT NULL,
    reviewTag text NOT NULL,
    reviewBody text NOT NULL,
    rating decimal NOT NULL,
    date text
) TABLESPACE pg_default;
ALTER TABLE public.customerreviews OWNER to postgres;
COMMENT ON TABLE public.customerreviews IS 'customerreviews table';
COMMENT ON COLUMN public.customerreviews.itemId IS 'each item ids';
COMMENT ON COLUMN public.customerreviews.reviewId IS 'review ids';
COMMENT ON COLUMN public.customerreviews.reviewer IS 'This is the person reviewing the item';
COMMENT ON COLUMN public.customerreviews.reviewTitle IS 'This the review title';
COMMENT ON COLUMN public.customerreviews.reviewTag IS 'This is the tag for the reviews';
COMMENT ON COLUMN public.customerreviews.reviewBody IS 'This is the body of the review';
COMMENT ON COLUMN public.customerreviews.rating IS 'This is the individual rating';
COMMENT ON COLUMN public.customerreviews.date IS 'This is the review date';

