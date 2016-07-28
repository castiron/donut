#!/bin/bash
# Author - clark@castironcoding.com
# Purpose - Generates daily backup with retention for 1 week. Eventually smooch will replace this.

scriptFilePath=$(readlink -f $0)
scriptDir=$(dirname ${scriptFilePath})

logFile="${scriptDir}/backup.log"
configFile="${scriptDir}/settings.cfg"

if [ -f ${logFile} ];
then
    touch ${logFile}
fi

if [ ! -f ${configFile} ];
then
    echo '[ERROR!]' >> ${logFile}
    echo 'The file settings.cfg not found!' >> ${logFile}
    exit 1
else
    source ${configFile}
fi

dateToday=$(date +"%m_%d_%Y")
dateDrop=$(date +%m_%d_%Y -d "1 week ago")
backupFile="${scriptDir}/${backupFileName}_${dateToday}.sql"
dropFile="${scriptDir}/${backupFileName}_${dateDrop}.sql"

if [ $# -gt 0 ]
then
    if [[ ${1} == 'ondemand' ]]
    then
        echo "Creating ondemand .sql dump of: ${dbName}"
        onDemandBackupFile="${scriptDir}/${backupFileName}_ONDEMAND_${dateToday}.sql"
        echo "Filename: ${onDemandBackupFile}"
        mysqldump -h${dbHost} -u${dbUser} -p${dbPass} ${dbName} > ${onDemandBackupFile}
        echo "Tada. All done."
        exit 0
    else
        echo "Gibberish."
        echo "Pass 'ondemand' as argument for one off .sql dump."
        exit 1
    fi
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