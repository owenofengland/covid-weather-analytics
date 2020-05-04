use joe215;
SELECT (AVG(rate) + (STDDEV(rate) * 2)) FROM avgdeathgrowth WHERE place NOT LIKE '%Unassigned' AND place NOT LIKE '%Out of%';
