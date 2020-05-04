use joe215;
WITH
    sq
    AS
    (
        SELECT avghumidity.place, avghumidity.humidity, avgdeathgrowth.rate, casecount.count
        FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place INNER JOIN casecount ON casecount.place = avghumidity.place WHERE casecount.count >= 20
    )
SELECT floor(humidity * 10.0)/10.0 AS roundhumid, AVG(rate) AS rate
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%'
GROUP BY roundhumid
ORDER BY roundhumid ASC;
WITH
    sq
    AS
    (
        SELECT avgtemphigh.place, avgtemphigh.temphigh, avgdeathgrowth.rate, casecount.count
        FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place INNER JOIN casecount ON casecount.place = avgtemphigh.place WHERE casecount.count >= 20
    )
SELECT floor(temphigh / 5.0) * 5.0 AS roundtemphigh, AVG(rate) AS rate
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%'
GROUP BY roundtemphigh
ORDER BY roundtemphigh ASC;
WITH
    sq
    AS
    (
        SELECT avgtemplow.place, avgtemplow.templow, avgdeathgrowth.rate, casecount.count
        FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place INNER JOIN casecount ON casecount.place = avgtemplow.place WHERE casecount.count >= 20 
    )
SELECT floor(templow / 5.0) * 5.0 AS roundtemplow, AVG(rate) AS rate
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%'
GROUP BY roundtemplow
ORDER BY roundtemplow ASC;
WITH
    sq
    AS
    (
        SELECT avguv.place, avguv.uv, avgdeathgrowth.rate, casecount.count
        FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place INNER JOIN casecount ON casecount.place = avguv.place WHERE casecount.count >= 20
    )
SELECT floor(uv / 1.0) *  1.0 AS rounduv, AVG(rate) AS rate
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%'
GROUP BY rounduv
ORDER BY rounduv ASC;
WITH
    sq
    AS
    (
        SELECT avgtempmin.place, avgtempmin.tempmin, avgdeathgrowth.rate, casecount.count
        FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place INNER JOIN casecount ON casecount.place = avgtempmin.place WHERE casecount.count >= 20
    )
SELECT floor(tempmin / 5.0) * 5.0 AS roundtempmin, AVG(rate) AS rate
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%'
GROUP BY roundtempmin
ORDER BY roundtempmin ASC;
WITH
    sq
    AS
    (
        SELECT avgtempmax.place, avgtempmax.tempmax, avgdeathgrowth.rate, casecount.count
        FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place INNER JOIN casecount ON casecount.place = avgtempmax.place WHERE casecount.count >= 20
    )
SELECT floor(tempmax / 5.0) * 5.0 AS roundtempmax, AVG(rate) AS rate
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%'
GROUP BY roundtempmax
ORDER BY roundtempmax ASC;
