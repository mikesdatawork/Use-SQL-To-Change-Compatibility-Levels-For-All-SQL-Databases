> **Note** — The folder `linguist-samples/` contains tiny real files so GitHub can correctly display all languages used in this repo.  
> The actual content and examples remain in this README.

![MIKES DATA WORK GIT REPO](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_01.png "Mikes Data Work")        

# Use SQL To Change Compatibility Levels For All SQL Databases
**Post Date: December 12, 2016**        

## Contents    
- [About Process](##About-Process)  
- [SQL Logic](#SQL-Logic)  
- [Build Info](#Build-Info)  
- [Author](#Author)  
- [License](#License)       

## About-Process

<p>Suppose you just restored some databases to a new database server (SQL 2014), and you need to double check and perhaps change the compatibility levels. Here's some quick logic to get that going fast.</p>

![get compatibility levels](https://mikesdatawork.files.wordpress.com/2016/12/image0011.png "Select Compatibility Levels With SQL")



## SQL-Logic
```SQL
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
```


[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Info

| Build Quality | Build History |
|--|--|
|<table><tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr><tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr><tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr></table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|

## Author

[![Gist](https://img.shields.io/badge/Gist-MikesDataWork-<COLOR>.svg)](https://gist.github.com/mikesdatawork)
[![Twitter](https://img.shields.io/badge/Twitter-MikesDataWork-<COLOR>.svg)](https://twitter.com/mikesdatawork)
[![Wordpress](https://img.shields.io/badge/Wordpress-MikesDataWork-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

    
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Mikes Data Work](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_02.png "Mikes Data Work")
