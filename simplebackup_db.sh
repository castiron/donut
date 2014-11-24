#!/bin/bash
# Author - clark@castironcoding.com
# Purpose - Generates daily backup with retention for 1 week. Eventually smooch will replace this.

dateToday=$(date +"%m_%d_%Y")
dateDrop=$(date +%m_%d_%Y -d "1 week ago")

scriptFilePath=$(readlink -f $0)
scriptDir=$(dirname ${scriptFilePath})

configFile="${scriptDir}/settings.cfg"


backupFile="${scriptDir}/${backupFileName}_${dateToday}.sql"
dropFile="${scriptDir}/${backupFileName}_${dateDrop}.sql"
logFile="${scriptDir}/backup.log"


if [ -f ${logFile} ];
then
    touch ${logFile}
fi

if [ -f ! ${configFile} ];
then
    echo '[ERROR!]' >> ${logFile}
    echo 'The file settings.cfg not found!' >> ${logFile}
    exit 1
fi

echo "[STARTING BACKUP]" >> ${logFile}
echo "Backup file: ${backupFile}" >> ${logFile}
echo "Drop file: ${dropFile}" >> ${logFile}

mysqldump -h${dbHost} -u${dbUser} -p${dbPass} ${dbName} > ${backupFile}

if [ -f ${dropFile} ];
then
    echo "Removing backup: ${dropFile}" >> ${logFile}
    rm ${dropFile}
fi

echo "[DONE]" >> ${logFile}
echo " " >> ${logFile}

exit 0