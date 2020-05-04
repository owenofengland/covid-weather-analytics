use joe215;
SELECT slope, rate_bar_max - templow_bar_max * slope AS intercept
FROM (SELECT SUM((templow - templow_bar) * (rate - rate_bar)) / SUM((templow - templow_bar) * (templow - templow_bar)) AS slope, MAX(templow_bar) AS templow_bar_max, MAX(rate_bar) AS rate_bar_max
    FROM ( SELECT templow, AVG(templow) over () as templow_bar, rate, AVG(rate) over () as rate_bar
        FROM (SELECT avgtemplow.templow, avgtemplow.place, avgdeathgrowth.rate, casecount.count
            FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place
                INNER JOIN casecount ON casecount.place = avgtemplow.place
            WHERE casecount.count >= 20 AND avgtemplow.place NOT LIKE '%Unassigned%' AND avgtemplow.place NOT LIKE '%Out of%') s ) q) a;
SELECT slope, rate_bar_max - temphigh_bar_max * slope AS intercept
FROM (SELECT SUM((temphigh - temphigh_bar) * (rate - rate_bar)) / SUM((temphigh - temphigh_bar) * (temphigh - temphigh_bar)) AS slope, MAX(temphigh_bar) AS temphigh_bar_max, MAX(rate_bar) AS rate_bar_max
    FROM ( SELECT temphigh, AVG(temphigh) over () as temphigh_bar, rate, AVG(rate) over () as rate_bar
        FROM (SELECT avgtemphigh.temphigh, avgtemphigh.place, avgdeathgrowth.rate, casecount.count
            FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place
                INNER JOIN casecount ON casecount.place = avgtemphigh.place
            WHERE casecount.count >= 20 AND avgtemphigh.place NOT LIKE '%Unassigned%' AND avgtemphigh.place NOT LIKE '%Out of%') s ) q) a;
SELECT slope, rate_bar_max - tempmin_bar_max * slope AS intercept
FROM (SELECT SUM((tempmin - tempmin_bar) * (rate - rate_bar)) / SUM((tempmin - tempmin_bar) * (tempmin - tempmin_bar)) AS slope, MAX(tempmin_bar) AS tempmin_bar_max, MAX(rate_bar) AS rate_bar_max
    FROM ( SELECT tempmin, AVG(tempmin) over () as tempmin_bar, rate, AVG(rate) over () as rate_bar
        FROM (SELECT avgtempmin.tempmin, avgtempmin.place, avgdeathgrowth.rate, casecount.count
            FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place
                INNER JOIN casecount ON casecount.place = avgtempmin.place
            WHERE casecount.count >= 20 AND avgtempmin.place NOT LIKE '%Unassigned%' AND avgtempmin.place NOT LIKE '%Out of%') s ) q) a;
SELECT slope, rate_bar_max - tempmax_bar_max * slope AS intercept
FROM (SELECT SUM((tempmax - tempmax_bar) * (rate - rate_bar)) / SUM((tempmax - tempmax_bar) * (tempmax - tempmax_bar)) AS slope, MAX(tempmax_bar) AS tempmax_bar_max, MAX(rate_bar) AS rate_bar_max
    FROM ( SELECT tempmax, AVG(tempmax) over () as tempmax_bar, rate, AVG(rate) over () as rate_bar
        FROM (SELECT avgtempmax.tempmax, avgtempmax.place, avgdeathgrowth.rate, casecount.count
            FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place
                INNER JOIN casecount ON casecount.place = avgtempmax.place
            WHERE casecount.count >= 20 AND avgtempmax.place NOT LIKE '%Unassigned%' AND avgtempmax.place NOT LIKE '%Out of%') s ) q) a;
SELECT slope, rate_bar_max - humidity_bar_max * slope AS intercept
FROM (SELECT SUM((humidity - humidity_bar) * (rate - rate_bar)) / SUM((humidity - humidity_bar) * (humidity - humidity_bar)) AS slope, MAX(humidity_bar) AS humidity_bar_max, MAX(rate_bar) AS rate_bar_max
    FROM ( SELECT humidity, AVG(humidity) over () as humidity_bar, rate, AVG(rate) over () as rate_bar
        FROM (SELECT avghumidity.humidity, avghumidity.place, avgdeathgrowth.rate, casecount.count
            FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place
                INNER JOIN casecount ON casecount.place = avghumidity.place
            WHERE casecount.count >= 20 AND avghumidity.place NOT LIKE '%Unassigned%' AND avghumidity.place NOT LIKE '%Out of%') s ) q) a;
SELECT slope, rate_bar_max - uv_bar_max * slope AS intercept
FROM (SELECT SUM((uv - uv_bar) * (rate - rate_bar)) / SUM((uv - uv_bar) * (uv - uv_bar)) AS slope, MAX(uv_bar) AS uv_bar_max, MAX(rate_bar) AS rate_bar_max
    FROM ( SELECT uv, AVG(uv) over () as uv_bar, rate, AVG(rate) over () as rate_bar
        FROM (SELECT avguv.uv, avguv.place, avgdeathgrowth.rate, casecount.count
            FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place
                INNER JOIN casecount ON casecount.place = avguv.place
            WHERE casecount.count >= 20 AND avguv.place NOT LIKE '%Unassigned%' AND avguv.place NOT LIKE '%Out of%') s ) q) a;

