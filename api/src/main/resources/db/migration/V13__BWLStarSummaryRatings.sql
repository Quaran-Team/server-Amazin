-- Table: public.bwl01

-- DROP TABLE public.bwl01;

CREATE TABLE public.bwl01
(
    ratingid bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    overallrating numeric(10, 1),
    totalfivestarrating integer,
    totalfourstarrating integer,
    totalthreestarrating integer,
    totaltwostarrating integer,
    totalonestarrating integer
)

TABLESPACE pg_default;

ALTER TABLE public.bwl01
    OWNER to postgres;

COMMENT ON TABLE public.bwl01
IS 'temporary';

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.8,40,30,20,10,5);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.4,41,33,10,10,5);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (3.8,20,38,17,11,3);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.1,41,31,21,11,1);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (2.8,4,3,2,100,5);