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
VALUES (2.7,200,400,23,1155,1);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.1,600,18,212,45,63);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.8,2200,230,36,17,12);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.2,800,320,45,99,83);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.4,300,233,17,12,8);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (2.1,12,15,121,855,68);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (3.7,520,730,17,455,18);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (3.5,567,290,545,345,66);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (4.5,904,23,38,111,22);

INSERT INTO public.bwl01 (overallRating, totalFiveStarRating, totalFourStarRating, totalThreeStarRating, totalTwoStarRating,totalOneStarRating)
VALUES (3.1,109,456,258,295,125);
