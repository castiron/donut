```
########## Donut #########
#                        #
#        .-;;;;;-.       #
#      .;;;;;;;;;;;.     #
#     /;;;' o o ';;;\    #
#    ;;;; o /^\ o ;;;;   #
#    ;;;; o \_/ o ;;;;   #
#     \;;;. o o .;;;/    #
#      ';;;;;;;;;;;'     #
#        '-;;;;;-'       #
#                        # 
##########################

# ASCII Art credit: http://www.chris.com/ascii/joan/www.geocities.com/SoHo/7373/transp.html#tire
```

A script for backing up database(s) with daily dumps that are retained for 1 week.

Currently supports MySQL and PostgreSQL

## Setup

### Automated approach

Create a directory to house releases and configuration such as
`mkdir /some/path/donut && cd /some/path/donut`

Download the latest release
`wget https://github.com/castiron/donut/archive/1.0.13.tar.gz`

Extract release
`tar -xf 1.0.13.tar.gz`

Run setup inside the release dir
`cd donut-1.0.13 && ./setup`

_Alternative combined approach_

`mkdir donut && cd donut && wget https://github.com/castiron/donut/archive/1.0.13.tar.gz && tar -xf 1.0.13.tar.gz && cd donut-1.0.13 && ./setup && cd -`

Update configuration if desired (defaults to 7 days of retention assuming execution occurs daily)
`vim /some/path/donut/.donut-config`

Add a config file for each database that you want to backup. 
`cd /some/path/donut/config`

Note: The actual file name and extension are arbitrary. Donut will loop through the `config/` directory and attempt to 
use each file as config.

The format should like the following:
```
type=mysql
host=
schema=
user=
password=
port=
```

or

```
type=postgresql
host=
schema=
user=
password=
port=
```

Note that `port` is optional and will default to the default port for the database.

Setup cronjob to run daily
`crontab -e`
`0 3 * * * cd /some/path/donut/current && ./donut`

### Manual approach
Create a `config/` directory in the same directory as donut or create a `config` symlink

Add a config file for each database that you want to backup. The format should like the following:
```
type=mysql
host=
schema=
user=
password=
```

or

```
type=postgresql
host=
schema=
user=
password=
```

When using postgresql, password must be supplied with a `~/.pgpass` file, which will be a bit redundant.

Note: The actual file name and extension are arbitrary. Donut will loop through the `config/` directory and attempt to 
use each file as config. Makes the most sense to name the file the same as the schema.

You can run the script manually to test your configuration: `./donut`

By default the .sql backups are stored in `backup/` in the same directory as donut. If you want, you could create a
symlink for `backup` to persist the backups elsewhere.

Once satisfied with the configuration of your database(s) setup a cron job to run donut every 24hrs. 

## Ondemand backups
 
Donut also can create instant backups by passing `ondemand` like so: `./donut ondemand`
This will append `ONDEMAND` to the .sql file so it will not conflict with your daily backups.

Enjoy!
