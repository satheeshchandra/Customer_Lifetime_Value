with tp_packages as
(
    select distinct package_id from kaltura.vw_active_users_report
        where package_name like '%%Prime%%' 
        -- and package_name not like '%%VIP%%'
)
select count( subscriber_id) from kaltura.vw_deduplicated_active_users_report
where package_id in (select package_id from tp_packages)
and subscription_start < '2020-09-01' and subscription_end > '2020-08-01'
and subscription_end::date - subscription_start::date > 7
;
