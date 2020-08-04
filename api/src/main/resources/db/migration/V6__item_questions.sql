-- Table: public.questions
-- DROP TABLE public.questions;
CREATE TABLE public.questions (
    questionId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    question text NOT NULL,
    itemId text NOT NULL
) TABLESPACE pg_default;
ALTER TABLE public.questions OWNER to postgres;
COMMENT ON TABLE public.questions IS 'Questions table. This should hold most of the question data needed for each item.';
COMMENT ON COLUMN public.questions.questionId IS 'questions ids';
COMMENT ON COLUMN public.questions.question IS 'This is the question. should not be too long.';
COMMENT ON COLUMN public.questions.itemId IS 'about which item';
