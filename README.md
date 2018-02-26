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

Note: The actual file name and extension are arbitrary. Donut will loop through the `config/` directory and attempt to 
use each file as config.

You can run the script manually to test your configuration: `./donut`

By default the .sql backups are stored in `backup/` in the same directory as donut. If you want, you could create a
symlink for `backup` to persist the backups elsewhere.

Once satisfied with the configuration of your database(s) setup a cron job to run donut every 24hrs. 
 
Donut also can create instant backups by passing `ondemand` like so: `./donut ondemand`
This will append `ONDEMAND` to the .sql file so it will not conflict with your daily backups.

Enjoy!
