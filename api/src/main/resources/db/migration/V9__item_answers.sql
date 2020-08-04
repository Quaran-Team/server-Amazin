-- Table: public.answers
-- DROP TABLE public.answers;
CREATE TABLE public.answers (
    answerId bigint GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ) PRIMARY KEY,
    answer text NOT NULL,
    questionId text NOT NULL
) TABLESPACE pg_default;
ALTER TABLE public.answers OWNER to postgres;
COMMENT ON TABLE public.answers IS 'Answers table. This should hold the answer data needed for each question.';
COMMENT ON COLUMN public.answers.answerId IS 'answers ids';
COMMENT ON COLUMN public.answers.answer IS 'This is the answer. should not be too long.';
COMMENT ON COLUMN public.answers.questionId IS 'about which question';
