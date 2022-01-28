USE DATABASE VATRANSFORM_PRODUCTION;
USE SCHEMA VISTA_TRANSFORM;
with ldesc as (
select lower(jccosttype.description), count(lower(jccosttype.description)), jccosttype.jbcosttypecategory
from "VATRANSFORM_PRODUCTION"."VISTATRANSFORM"."JCCOSTTYPE"
where jccosttype.enterpriseid not in ('1','8','9','13','14','16','17','61','71','82','83','90','91','92','93','94','95','101','102','105','108','109','110','115','127','135','136','137','142','143','147','148','149','150','162','182','190','262','268','290','292','313','348','426','518','519','550','634','641','645','657','658','661','662','663','664','666','672','676','685','686','687','688','690','691','702','705','752','781','783','788','861','874','893','922','944','957','1075','1177','1190','1259','1269','1417','1437')
group by lower(jccosttype.description), jccosttype.jbcosttypecategory
order by count(lower(jccosttype.description)) desc
)

select *
from ldesc