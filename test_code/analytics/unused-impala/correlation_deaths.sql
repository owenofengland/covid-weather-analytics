use joe215;
WITH
    sq
    AS
    (
        SELECT avgtemplow.place, avgtemplow.templow, avgdeathgrowth.rate
        FROM avgtemplow INNER JOIN avgdeathgrowth ON avgtemplow.place = avgdeathgrowth.place
        WHERE avgdeathgrowth.rate >= ${var:upper} OR avgdeathgrowth.rate <= ${var:lower} AND avgtemplow.place NOT LIKE '%Unassigned%' AND avgtemplow.place NOT LIKE '%Out of%'
    )
SELECT (avg(templow * rate) - avg(templow) * avg(rate)) / (sqrt(avg(templow * templow) - avg(templow) * avg(templow)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';

WITH
    sq
    AS
    (
        SELECT avgtemphigh.place, avgtemphigh.temphigh, avgdeathgrowth.rate
        FROM avgtemphigh INNER JOIN avgdeathgrowth ON avgtemphigh.place = avgdeathgrowth.place
        WHERE avgdeathgrowth.rate >= ${var:upper} OR avgdeathgrowth.rate <= ${var:lower} AND avgtemphigh.place NOT LIKE '%Unassigned%' AND avgtemphigh.place NOT LIKE '%Out of%'
    )
SELECT (avg(temphigh * rate) - avg(temphigh) * avg(rate)) / (sqrt(avg(temphigh * temphigh) - avg(temphigh) * avg(temphigh)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';

WITH
    sq
    AS
    (
        SELECT avgtempmin.place, avgtempmin.tempmin, avgdeathgrowth.rate
        FROM avgtempmin INNER JOIN avgdeathgrowth ON avgtempmin.place = avgdeathgrowth.place
        WHERE avgdeathgrowth.rate >= ${var:upper} OR avgdeathgrowth.rate <= ${var:lower} AND avgtempmin.place NOT LIKE '%Unassigned%' AND avgtempmin.place NOT LIKE '%Out of%'
    )
SELECT (avg(tempmin * rate) - avg(tempmin) * avg(rate)) / (sqrt(avg(tempmin * tempmin) - avg(tempmin) * avg(tempmin)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';

WITH
    sq
    AS
    (
        SELECT avgtempmax.place, avgtempmax.tempmax, avgdeathgrowth.rate
        FROM avgtempmax INNER JOIN avgdeathgrowth ON avgtempmax.place = avgdeathgrowth.place
        WHERE avgdeathgrowth.rate >= ${var:upper} OR avgdeathgrowth.rate <= ${var:lower} AND avgtempmax.place NOT LIKE '%Unassigned%' AND avgtempmax.place NOT LIKE '%Out of%'
    )
SELECT (avg(tempmax * rate) - avg(tempmax) * avg(rate)) / (sqrt(avg(tempmax * tempmax) - avg(tempmax) * avg(tempmax)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';

WITH
    sq
    AS
    (
        SELECT avghumidity.place, avghumidity.humidity, avgdeathgrowth.rate
        FROM avghumidity INNER JOIN avgdeathgrowth ON avghumidity.place = avgdeathgrowth.place
        WHERE avgdeathgrowth.rate >= ${var:upper} OR avgdeathgrowth.rate <= ${var:lower} AND avghumidity.place NOT LIKE '%Unassigned%' AND avghumidity.place NOT LIKE '%Out of%'
    )
SELECT (avg(humidity * rate) - avg(humidity) * avg(rate)) / (sqrt(avg(humidity * humidity) - avg(humidity) * avg(humidity)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';

WITH
    sq
    AS
    (
        SELECT avguv.place, avguv.uv, avgdeathgrowth.rate
        FROM avguv INNER JOIN avgdeathgrowth ON avguv.place = avgdeathgrowth.place
        WHERE avgdeathgrowth.rate >= ${var:upper} OR avgdeathgrowth.rate <= ${var:lower} AND avguv.place NOT LIKE '%Unassigned%' AND avguv.place NOT LIKE '%Out of%'
    )
SELECT (avg(uv * rate) - avg(uv) * avg(rate)) / (sqrt(avg(uv * uv) - avg(uv) * avg(uv)) * sqrt(avg(rate * rate) - avg(rate) * avg(rate))) AS corr_coeff_pop
FROM sq
WHERE place NOT LIKE '%Unassigned%' AND place NOT LIKE '%Out of%';
