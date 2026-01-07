use master;
set nocount on
 
-- get compatibility levels from existing databases
select
            'database'       = upper(name)
,           'compatibility'  = compatibility_level
from
            sys.databases
where
            database_id > 4
order by
            name asc
 
-- change compatibility levels to 120 for only those databases that are not set to 120
declare              @change_compatibility_level  varchar(max)
set                  @change_compatibility_level  = ''
select               @change_compatibility_level = @change_compatibility_level +
'alter database [' + name + '] set compatibility_level = 120;' + char(10)
from                sys.databases
where               database_id > 4 and compatibility_level not in ('120')
exec                (@change_compatibility_level)
