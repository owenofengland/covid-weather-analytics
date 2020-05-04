use joe215;
-- UV Index
-- Average growth rate of deaths in all counties where the UV Index falls above the median of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgdeathgrowth.rate FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place WHERE avguv.uv > (SELECT appx_median(avguv.uv) FROM avguv)) SELECT AVG(rate) AS avgdeathgrowthabovemedianuvavg FROM sq;
-- Average growth rate of deaths in all counties where the UV Index falls below the median of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgdeathgrowth.rate FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place WHERE avguv.uv < (SELECT appx_median(avguv.uv) FROM avguv)) SELECT AVG(rate) AS avgdeathgrowthbelowmedianuvavg FROM sq;
-- Average growth rate of deaths in all counties where the UV Index falls above the average of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgdeathgrowth.rate FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place WHERE avguv.uv > (SELECT AVG(avguv.uv) FROM avguv)) SELECT AVG(rate) AS avgdeathgrowthaboveuvavg FROM sq;
-- Average growth rate of deaths in all counties where the UV Index falls below the average of the average UV Index in all counties
WITH sq AS (SELECT avguv.place, avguv.uv, avgdeathgrowth.rate FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place WHERE avguv.uv < (SELECT AVG(avguv.uv) FROM avguv)) SELECT AVG
(rate) AS avgdeathgrowthbelowuvavg FROM sq;
-- Humidity
-- Average growth rate of deaths in all counties where the humidity falls above the median of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgdeathgrowth.rate FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place WHERE avghumidity.humidity > (SELECT appx_median(avghumidity.humidity) FROM avghumidity)) SELECT AVG(rate) AS avgdeathgrowthabovemedianhumidityavg FROM sq;
-- Average growth rate of deaths in all counties where the humidity falls below the median of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgdeathgrowth.rate FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place WHERE avghumidity.humidity < (SELECT appx_median(avghumidity.humidity) FROM avghumidity)) SELECT AVG(rate) AS avgdeathgrowthbelowmedianhumidityavg FROM sq;
-- Average growth rate of deaths in all counties where the humidity falls above the average of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgdeathgrowth.rate FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place WHERE avghumidity.humidity > (SELECT AVG(avghumidity.humidity) FROM avghumidity)) SELECT AVG(rate) AS avgdeathgrowthabovehumidityavg FROM sq;
-- Average growth rate of deaths in all counties where the humidity falls below the average of the average humidity in all counties
WITH sq AS (SELECT avghumidity.place, avghumidity.humidity, avgdeathgrowth.rate FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place WHERE avghumidity.humidity < (SELECT AVG(avghumidity.humidity) FROM avghumidity)) SELECT AVG
(rate) AS avgdeathgrowthbelowhumidityavg FROM sq;
-- TempHigh
-- Average growth rate of deaths in all counties where the temphigh falls above the median of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgdeathgrowth.rate FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place WHERE avgtemphigh.temphigh > (SELECT appx_median(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG(rate) AS avgdeathgrowthabovemediantemphighavg FROM sq;
-- Average growth rate of deaths in all counties where the temphigh falls below the median of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgdeathgrowth.rate FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place WHERE avgtemphigh.temphigh < (SELECT appx_median(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG(rate) AS avgdeathgrowthbelowmediantemphighavg FROM sq;
-- Average growth rate of deaths in all counties where the temphigh falls above the average of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgdeathgrowth.rate FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place WHERE avgtemphigh.temphigh > (SELECT AVG(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG(rate) AS avgdeathgrowthabovetemphighavg FROM sq;
-- Average growth rate of deaths in all counties where the temphigh falls below the average of the average temphigh in all counties
WITH sq AS (SELECT avgtemphigh.place, avgtemphigh.temphigh, avgdeathgrowth.rate FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place WHERE avgtemphigh.temphigh < (SELECT AVG(avgtemphigh.temphigh) FROM avgtemphigh)) SELECT AVG
(rate) AS avgdeathgrowthbelowtemphighavg FROM sq;
-- TempLow
-- Average growth rate of deaths in all counties where the templow falls above the median of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgdeathgrowth.rate FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place WHERE avgtemplow.templow > (SELECT appx_median(avgtemplow.templow) FROM avgtemplow)) SELECT AVG(rate) AS avgdeathgrowthabovemediantemplowavg FROM sq;
-- Average growth rate of deaths in all counties where the templow falls below the median of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgdeathgrowth.rate FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place WHERE avgtemplow.templow < (SELECT appx_median(avgtemplow.templow) FROM avgtemplow)) SELECT AVG(rate) AS avgdeathgrowthbelowmediantemplowavg FROM sq;
-- Average growth rate of deaths in all counties where the templow falls above the average of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgdeathgrowth.rate FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place WHERE avgtemplow.templow > (SELECT AVG(avgtemplow.templow) FROM avgtemplow)) SELECT AVG(rate) AS avgdeathgrowthabovetemplowavg FROM sq;
-- Average growth rate of deaths in all counties where the templow falls below the average of the average templow in all counties
WITH sq AS (SELECT avgtemplow.place, avgtemplow.templow, avgdeathgrowth.rate FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place WHERE avgtemplow.templow < (SELECT AVG(avgtemplow.templow) FROM avgtemplow)) SELECT AVG
(rate) AS avgdeathgrowthbelowtemplowavg FROM sq;
-- TempMax
-- Average growth rate of deaths in all counties where the tempmax falls above the median of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgdeathgrowth.rate FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place WHERE avgtempmax.tempmax > (SELECT appx_median(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG(rate) AS avgdeathgrowthabovemediantempmaxavg FROM sq;
-- Average growth rate of deaths in all counties where the tempmax falls below the median of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgdeathgrowth.rate FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place WHERE avgtempmax.tempmax < (SELECT appx_median(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG(rate) AS avgdeathgrowthbelowmediantempmaxavg FROM sq;
-- Average growth rate of deaths in all counties where the tempmax falls above the average of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgdeathgrowth.rate FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place WHERE avgtempmax.tempmax > (SELECT AVG(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG(rate) AS avgdeathgrowthabovetempmaxavg FROM sq;
-- Average growth rate of deaths in all counties where the tempmax falls below the average of the average tempmax in all counties
WITH sq AS (SELECT avgtempmax.place, avgtempmax.tempmax, avgdeathgrowth.rate FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place WHERE avgtempmax.tempmax < (SELECT AVG(avgtempmax.tempmax) FROM avgtempmax)) SELECT AVG
(rate) AS avgdeathgrowthbelowtempmaxavg FROM sq;
-- TempMin
-- Average growth rate of deaths in all counties where the tempmin falls above the median of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgdeathgrowth.rate FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place WHERE avgtempmin.tempmin > (SELECT appx_median(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG(rate) AS avgdeathgrowthabovemediantempminavg FROM sq;
-- Average growth rate of deaths in all counties where the tempmin falls below the median of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgdeathgrowth.rate FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place WHERE avgtempmin.tempmin < (SELECT appx_median(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG(rate) AS avgdeathgrowthbelowmediantempminavg FROM sq;
-- Average growth rate of deaths in all counties where the tempmin falls above the average of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgdeathgrowth.rate FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place WHERE avgtempmin.tempmin > (SELECT AVG(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG(rate) AS avgdeathgrowthabovetempminavg FROM sq;
-- Average growth rate of deaths in all counties where the tempmin falls below the average of the average tempmin in all counties
WITH sq AS (SELECT avgtempmin.place, avgtempmin.tempmin, avgdeathgrowth.rate FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place WHERE avgtempmin.tempmin < (SELECT AVG(avgtempmin.tempmin) FROM avgtempmin)) SELECT AVG
(rate) AS avgdeathgrowthbelowtempminavg FROM sq;
