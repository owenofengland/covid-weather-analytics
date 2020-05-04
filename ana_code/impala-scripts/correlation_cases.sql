use joe215;
use joe215;
WITH
    sq
    AS
    (
        SELECT avgtemplow.place, avgtemplow.templow, avgcasegrowth.rate, casecount.count
        FROM avgtemplow INNER JOIN avgcasegrowth ON avgtemplow.place = avgcasegrowth.place INNER JOIN casecount ON casecount.place = avgtemplow.place
        WHERE casecount.count >= 20 AND avgtemplow.place NOT LIKE '%Unassigned%' AND avgtemplow.place NOT LIKE '%Out of%'
    )
SELECT (avg(templow * rate) - avg(templow) * avg(rate)) / (sqrt(avg(templow * templow) - avg(templow) * avg(templow)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
WITH sq
    AS
    (
        SELECT avgtemphigh.place, avgtemphigh.temphigh, avgcasegrowth.rate, casecount.count
        FROM avgtemphigh INNER JOIN avgcasegrowth ON avgtemphigh.place = avgcasegrowth.place INNER JOIN casecount ON casecount.place = avgtemphigh.place
        WHERE casecount.count >= 20 AND avgtemphigh.place NOT LIKE '%Unassigned%' AND avgtemphigh.place NOT LIKE '%Out of%'
    )
SELECT (avg(temphigh * rate) - avg(temphigh) * avg(rate)) / (sqrt(avg(temphigh * temphigh) - avg(temphigh) * avg(temphigh)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
WITH sq
    AS
    (
        SELECT avgtempmin.place, avgtempmin.tempmin, avgcasegrowth.rate, casecount.count
        FROM avgtempmin INNER JOIN avgcasegrowth ON avgtempmin.place = avgcasegrowth.place INNER JOIN casecount ON casecount.place = avgtempmin.place
        WHERE casecount.count >= 20 AND avgtempmin.place NOT LIKE '%Unassigned%' AND avgtempmin.place NOT LIKE '%Out of%'
    )
SELECT (avg(tempmin * rate) - avg(tempmin) * avg(rate)) / (sqrt(avg(tempmin * tempmin) - avg(tempmin) * avg(tempmin)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
WITH sq
    AS
    (
        SELECT avgtempmax.place, avgtempmax.tempmax, avgcasegrowth.rate, casecount.count
        FROM avgtempmax INNER JOIN avgcasegrowth ON avgtempmax.place = avgcasegrowth.place INNER JOIN casecount ON casecount.place = avgtempmax.place
        WHERE casecount.count >= 20 AND avgtempmax.place NOT LIKE '%Unassigned%' AND avgtempmax.place NOT LIKE '%Out of%'
    )
SELECT (avg(tempmax * rate) - avg(tempmax) * avg(rate)) / (sqrt(avg(tempmax * tempmax) - avg(tempmax) * avg(tempmax)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
WITH sq
    AS
    (
        SELECT avghumidity.place, avghumidity.humidity, avgcasegrowth.rate, casecount.count
        FROM avghumidity INNER JOIN avgcasegrowth ON avghumidity.place = avgcasegrowth.place INNER JOIN casecount ON casecount.place = avghumidity.place
        WHERE casecount.count >= 20 AND avghumidity.place NOT LIKE '%Unassigned%' AND avghumidity.place NOT LIKE '%Out of%'
    )
SELECT (avg(humidity * rate) - avg(humidity) * avg(rate)) / (sqrt(avg(humidity * humidity) - avg(humidity) * avg(humidity)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
WITH sq
    AS
    (
        SELECT avguv.place, avguv.uv, avgcasegrowth.rate, casecount.count
        FROM avguv INNER JOIN avgcasegrowth ON avguv.place = avgcasegrowth.place INNER JOIN casecount ON casecount.place = avguv.place
        WHERE casecount.count >= 20 AND avguv.place NOT LIKE '%Unassigned%' AND avguv.place NOT LIKE '%Out of%'
    )
SELECT (avg(uv * rate) - avg(uv) * avg(rate)) / (sqrt(avg(uv * uv) - avg(uv) * avg(uv)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
