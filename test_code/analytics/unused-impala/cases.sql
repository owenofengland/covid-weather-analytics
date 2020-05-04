use joe215;
-- UV Index
-- Average growth rate of cases in all counties where the UV Index falls above the median of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgcasegrowth.rate FROM avguv INNER JOIN avgcasegrowth ON avguv.place = avgcasegrowth.place WHERE avguv.uv > (SELECT appx_median(avguv.uv) FROM avguv)) SELECT AVG(rate) AS avgcasegrowthabovemedianuvavg FROM sq;
-- Average growth rate of cases in all counties where the UV Index falls below the median of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgcasegrowth.rate FROM avguv INNER JOIN avgcasegrowth ON avguv.place = avgcasegrowth.place WHERE avguv.uv < (SELECT appx_median(avguv.uv) FROM avguv)) SELECT AVG(rate) AS avgcasegrowthbelowmedianuvavg FROM sq;
-- Average growth rate of cases in all counties where the UV Index falls above the average of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgcasegrowth.rate FROM avguv INNER JOIN avgcasegrowth ON avguv.place = avgcasegrowth.place WHERE avguv.uv > (SELECT AVG(avguv.uv) FROM avguv)) SELECT AVG(rate) AS avgcasegrowthaboveuvavg FROM sq;
-- Average growth rate of cases in all counties where the UV Index falls below the average of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgcasegrowth.rate FROM avguv INNER JOIN avgcasegrowth ON avguv.place = avgcasegrowth.place WHERE avguv.uv < (SELECT AVG(avguv.uv) FROM avguv)) SELECT AVG
(rate) AS avgcasegrowthbelowuvavg FROM sq;
-- Humidity
-- Average growth rate of cases in all counties where the humidity falls above the median of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgcasegrowth.rate FROM avghumidity INNER JOIN avgcasegrowth ON avghumidity.place = avgcasegrowth.place WHERE avghumidity.humidity > (SELECT appx_median(avghumidity.humidity) FROM avghumidity)) SELECT AVG(rate) AS avgcasegrowthabovemedianhumidityavg FROM sq;
-- Average growth rate of cases in all counties where the humidity falls below the median of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgcasegrowth.rate FROM avghumidity INNER JOIN avgcasegrowth ON avghumidity.place = avgcasegrowth.place WHERE avghumidity.humidity < (SELECT appx_median(avghumidity.humidity) FROM avghumidity)) SELECT AVG(rate) AS avgcasegrowthbelowmedianhumidityavg FROM sq;
-- Average growth rate of cases in all counties where the humidity falls above the average of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgcasegrowth.rate FROM avghumidity INNER JOIN avgcasegrowth ON avghumidity.place = avgcasegrowth.place WHERE avghumidity.humidity > (SELECT AVG(avghumidity.humidity) FROM avghumidity)) SELECT AVG(rate) AS avgcasegrowthabovehumidityavg FROM sq;
-- Average growth rate of cases in all counties where the humidity falls below the average of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgcasegrowth.rate FROM avghumidity INNER JOIN avgcasegrowth ON avghumidity.place = avgcasegrowth.place WHERE avghumidity.humidity < (SELECT AVG(avghumidity.humidity) FROM avghumidity)) SELECT AVG
(rate) AS avgcasegrowthbelowhumidityavg FROM sq;
-- TempHigh
-- Average growth rate of cases in all counties where the temphigh falls above the median of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgcasegrowth.rate FROM avgtemphigh INNER JOIN avgcasegrowth ON avgtemphigh.place = avgcasegrowth.place WHERE avgtemphigh.temphigh > (SELECT appx_median(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG(rate) AS avgcasegrowthabovemediantemphighavg FROM sq;
-- Average growth rate of cases in all counties where the temphigh falls below the median of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgcasegrowth.rate FROM avgtemphigh INNER JOIN avgcasegrowth ON avgtemphigh.place = avgcasegrowth.place WHERE avgtemphigh.temphigh < (SELECT appx_median(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG(rate) AS avgcasegrowthbelowmediantemphighavg FROM sq;
-- Average growth rate of cases in all counties where the temphigh falls above the average of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgcasegrowth.rate FROM avgtemphigh INNER JOIN avgcasegrowth ON avgtemphigh.place = avgcasegrowth.place WHERE avgtemphigh.temphigh > (SELECT AVG(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG(rate) AS avgcasegrowthabovetemphighavg FROM sq;
-- Average growth rate of cases in all counties where the temphigh falls below the average of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgcasegrowth.rate FROM avgtemphigh INNER JOIN avgcasegrowth ON avgtemphigh.place = avgcasegrowth.place WHERE avgtemphigh.temphigh < (SELECT AVG(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG
(rate) AS avgcasegrowthbelowtemphighavg FROM sq;
-- TempLow
-- Average growth rate of cases in all counties where the templow falls above the median of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgcasegrowth.rate FROM avgtemplow INNER JOIN avgcasegrowth ON avgtemplow.place = avgcasegrowth.place WHERE avgtemplow.templow > (SELECT appx_median(avgtemplow.templow) FROM avgtemplow)) SELECT AVG(rate) AS avgcasegrowthabovemediantemplowavg FROM sq;
-- Average growth rate of cases in all counties where the templow falls below the median of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgcasegrowth.rate FROM avgtemplow INNER JOIN avgcasegrowth ON avgtemplow.place = avgcasegrowth.place WHERE avgtemplow.templow < (SELECT appx_median(avgtemplow.templow) FROM avgtemplow)) SELECT AVG(rate) AS avgcasegrowthbelowmediantemplowavg FROM sq;
-- Average growth rate of cases in all counties where the templow falls above the average of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgcasegrowth.rate FROM avgtemplow INNER JOIN avgcasegrowth ON avgtemplow.place = avgcasegrowth.place WHERE avgtemplow.templow > (SELECT AVG(avgtemplow.templow) FROM avgtemplow)) SELECT AVG(rate) AS avgcasegrowthabovetemplowavg FROM sq;
-- Average growth rate of cases in all counties where the templow falls below the average of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgcasegrowth.rate FROM avgtemplow INNER JOIN avgcasegrowth ON avgtemplow.place = avgcasegrowth.place WHERE avgtemplow.templow < (SELECT AVG(avgtemplow.templow) FROM avgtemplow)) SELECT AVG
(rate) AS avgcasegrowthbelowtemplowavg FROM sq;
-- TempMax
-- Average growth rate of cases in all counties where the tempmax falls above the median of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgcasegrowth.rate FROM avgtempmax INNER JOIN avgcasegrowth ON avgtempmax.place = avgcasegrowth.place WHERE avgtempmax.tempmax > (SELECT appx_median(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG(rate) AS avgcasegrowthabovemediantempmaxavg FROM sq;
-- Average growth rate of cases in all counties where the tempmax falls below the median of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgcasegrowth.rate FROM avgtempmax INNER JOIN avgcasegrowth ON avgtempmax.place = avgcasegrowth.place WHERE avgtempmax.tempmax < (SELECT appx_median(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG(rate) AS avgcasegrowthbelowmediantempmaxavg FROM sq;
-- Average growth rate of cases in all counties where the tempmax falls above the average of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgcasegrowth.rate FROM avgtempmax INNER JOIN avgcasegrowth ON avgtempmax.place = avgcasegrowth.place WHERE avgtempmax.tempmax > (SELECT AVG(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG(rate) AS avgcasegrowthabovetempmaxavg FROM sq;
-- Average growth rate of cases in all counties where the tempmax falls below the average of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgcasegrowth.rate FROM avgtempmax INNER JOIN avgcasegrowth ON avgtempmax.place = avgcasegrowth.place WHERE avgtempmax.tempmax < (SELECT AVG(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG
(rate) AS avgcasegrowthbelowtempmaxavg FROM sq;
-- TempMin
-- Average growth rate of cases in all counties where the tempmin falls above the median of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgcasegrowth.rate FROM avgtempmin INNER JOIN avgcasegrowth ON avgtempmin.place = avgcasegrowth.place WHERE avgtempmin.tempmin > (SELECT appx_median(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG(rate) AS avgcasegrowthabovemediantempminavg FROM sq;
-- Average growth rate of cases in all counties where the tempmin falls below the median of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgcasegrowth.rate FROM avgtempmin INNER JOIN avgcasegrowth ON avgtempmin.place = avgcasegrowth.place WHERE avgtempmin.tempmin < (SELECT appx_median(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG(rate) AS avgcasegrowthbelowmediantempminavg FROM sq;
-- Average growth rate of cases in all counties where the tempmin falls above the average of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgcasegrowth.rate FROM avgtempmin INNER JOIN avgcasegrowth ON avgtempmin.place = avgcasegrowth.place WHERE avgtempmin.tempmin > (SELECT AVG(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG(rate) AS avgcasegrowthabovetempminavg FROM sq;
-- Average growth rate of cases in all counties where the tempmin falls below the average of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgcasegrowth.rate FROM avgtempmin INNER JOIN avgcasegrowth ON avgtempmin.place = avgcasegrowth.place WHERE avgtempmin.tempmin < (SELECT AVG(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG
(rate) AS avgcasegrowthbelowtempminavg FROM sq;                                              
