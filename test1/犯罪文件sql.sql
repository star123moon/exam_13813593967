

------------1

DELETE  from test1_crime where (incident_id, offence_code,start_date_time) in (
select a.incident_id, a.offence_code,a.start_date_time from (
select incident_id, offence_code,start_date_time from test1_crime where  incident_id = '201272603' and (incident_id, offence_code,start_date_time) not in 
(select incident_id,MAX(offence_code),MAX(start_date_time)  from test1_crime where incident_id = '201272603' order by start_date_time,offence_code desc))a
)


select  count(1) from (
SELECT incident_id,count(1) co FROM `test1_crime` GROUP BY incident_id HAVING count(1) >1)a

select distinct incident_id from test1_crime



----------2
select * from test1_crime where IFNULL(dispatch_time,'') = ''
update test1_crime set dispatch_time = start_date_time where IFNULL(dispatch_time,'') = ''

--删除其他字段为空的数据
DELETE from  test1_crime where (IFNULL(victims,'') = '' or  IFNULL(crime_name1,'')= '' or IFNULL(crime_name2,'')= '' or IFNULL(crime_name3,'')= '' 
or IFNULL(city,'')= '' )

select * from  test1_crime where (IFNULL(victims,'') = '' or  IFNULL(crime_name1,'')= '' or IFNULL(crime_name2,'')= '' or IFNULL(crime_name3,'')= '' 
or IFNULL(city,'')= '' )



-----------3排序后发现最晚是2012年的数据，如果按照题目要求（删除start_date_time2020年之前的所有数据）那就是整张表数据都要删除
select * from test1_crime  ORDER BY start_date_time desc
DELETE from test1_crime where DATE_FORMAT(start_date_time,'%Y') > '2020'


--------- 4
update test1_crime set city = UPPER(city) 



