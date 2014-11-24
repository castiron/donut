# simplebackup_db

A simple shell script for backing up a MySQL database with daily dumps that are retained for 1 week.

## Setup

Note: If using Ubuntu, call the script using `bash` instead of `sh`

Clone this repo into a directory that will contain the backup files and log file

Copy settings.cfg.sample to settings.cfg

Modify settings.cfg as needed

Setup the script to run on a 24hr interval using something like crontab

Done