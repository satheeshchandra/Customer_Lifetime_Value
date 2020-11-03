-- TP Cohort analysis  - Subscriber retention trend
-- This is the script used to generate cohort.
-- Need to change purchase_date portion in the inner query.


drop table tp_packages;

create temp table tp_packages as
	select distinct package_id from kaltura.vw_active_users_report
		where package_name like '%%Prime%%' 
		and package_name not like '%VIP%' and package_name not like '%World Cup%' 
;


select sum(apr17) apr17, sum(may17) may17, sum(jun17) jun17, sum(jul17) jul17, sum(aug17) aug17
		, sum(sep17) sep17, sum(oct17) oct17, sum(nov17) nov17, sum(dec17) dec17, sum(jan18) jan18, sum(feb18) feb18, sum(mar18) mar18
		, sum(apr18) apr18, sum(may18) may18, sum(jun18) jun18, sum(jul18) jul18, sum(aug18) aug18 
		, sum(sep18) sep18, sum(oct18) oct18, sum(nov18) nov18, sum(dec18) dec18, sum(jan19) jan19 ,sum(feb19) feb19
		, sum(mar19) mar19, sum(apr19) apr19, sum(may19) may19, sum(jun19) jun19 , sum(jul19) jul19, sum(aug19) aug19
		, sum(sep19) sep19, sum(oct19) oct19, sum(nov19) nov19, sum(dec19) dec19 , sum(jan20) jan20, sum(feb20) feb20
		, sum(mar20) mar20, sum(apr20) apr20, sum(may20) may20, sum(jun20) jun20, sum(jul20) jul20, sum(aug20) aug20
		, sum(sep20) sep20, sum(oct20) oct20
	from
(
	select distinct subscriber_id
			, case when ss.end_date > '2017-04-01' then 1 else 0 end as apr17
			, case when ss.end_date > '2017-05-01' then 1 else 0 end as may17
			, case when ss.end_date > '2017-06-01' then 1 else 0 end as jun17
			, case when ss.end_date > '2017-07-01' then 1 else 0 end as jul17
			, case when ss.end_date > '2017-08-01' then 1 else 0 end as aug17
			, case when ss.end_date > '2017-09-01' then 1 else 0 end as sep17
			, case when ss.end_date > '2017-10-01' then 1 else 0 end as oct17
			, case when ss.end_date > '2017-11-01' then 1 else 0 end as nov17
			, case when ss.end_date > '2017-12-01' then 1 else 0 end as dec17
			, case when ss.end_date > '2018-01-01' then 1 else 0 end as jan18
			, case when ss.end_date > '2018-02-01' then 1 else 0 end as feb18
			, case when ss.end_date > '2018-03-01' then 1 else 0 end as mar18
			, case when ss.end_date > '2018-04-01' then 1 else 0 end as apr18
			, case when ss.end_date > '2018-05-01' then 1 else 0 end as may18
			, case when ss.end_date > '2018-06-01' then 1 else 0 end as jun18
			, case when ss.end_date > '2018-07-01' then 1 else 0 end as jul18
			, case when ss.end_date > '2018-08-01' then 1 else 0 end as aug18
			, case when ss.end_date > '2018-09-01' then 1 else 0 end as sep18
			, case when ss.end_date > '2018-10-01' then 1 else 0 end as oct18
			, case when ss.end_date > '2018-11-01' then 1 else 0 end as nov18
			, case when ss.end_date > '2018-12-01' then 1 else 0 end as dec18
			, case when ss.end_date > '2019-01-01' then 1 else 0 end as jan19
			, case when ss.end_date > '2019-02-01' then 1 else 0 end as feb19
			, case when ss.end_date > '2019-03-01' then 1 else 0 end as mar19
			, case when ss.end_date > '2019-04-01' then 1 else 0 end as apr19
			, case when ss.end_date > '2019-05-01' then 1 else 0 end as may19
			, case when ss.end_date > '2019-06-01' then 1 else 0 end as jun19
			, case when ss.end_date > '2019-07-01' then 1 else 0 end as jul19
			, case when ss.end_date > '2019-08-01' then 1 else 0 end as aug19
			, case when ss.end_date > '2019-09-01' then 1 else 0 end as sep19
			, case when ss.end_date > '2019-10-01' then 1 else 0 end as oct19
			, case when ss.end_date > '2019-11-01' then 1 else 0 end as nov19
			, case when ss.end_date > '2019-12-01' then 1 else 0 end as dec19
			, case when ss.end_date > '2020-01-01' then 1 else 0 end as jan20
			, case when ss.end_date > '2020-02-01' then 1 else 0 end as feb20
			, case when ss.end_date > '2020-03-01' then 1 else 0 end as mar20
			, case when ss.end_date > '2020-04-01' then 1 else 0 end as apr20
			, case when ss.end_date > '2020-05-01' then 1 else 0 end as may20
			, case when ss.end_date > '2020-06-01' then 1 else 0 end as jun20
			, case when ss.end_date > '2020-07-01' then 1 else 0 end as jul20
			, case when ss.end_date > '2020-08-01' then 1 else 0 end as aug20
			, case when ss.end_date > '2020-09-01' then 1 else 0 end as sep20
			, case when ss.end_date > '2020-10-01' then 1 else 0 end as oct20
		from kaltura.vw_subscribers_subscriptions ss
			join tp_packages tp on ss.package_id = tp.package_id
		where ss.purchase_date between '2020-10-01' and '2020-11-01' -- and ss.end_date > '2018-05-01'
) Q;

