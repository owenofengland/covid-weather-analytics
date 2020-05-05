use joe215;

create external table avgcasegrowth (place string, rate double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/cases/avg_growth/';

create external table avgdeathgrowth (place string, rate double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/deaths/avg_growth/';

create external table avghumidity (place string, humidity double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/humidity/avg_humidity/';

create external table avgtemphigh (place string, temphigh double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/temphigh/avg_temphigh/';

create external table avgtemplow (place string, templow double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/templow/avg_templow/';

create external table avgtempmax (place string, tempmax double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/tempmax/avg_tempmax/';

create external table avgtempmin (place string, tempmin double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/tempmin/avg_tempmin/';

create external table avguv (place string, uv double) row format delimited fields terminated by '\t' location '/user/joe215/project/analysis/uv/avg_ug/';

create external table casecount (place string, count int) row format delimited fields terminated by '\t' location '/user/joe215/project/data/newjhu/count/latest/';

