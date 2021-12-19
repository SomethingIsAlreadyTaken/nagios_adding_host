#!/bin/bash

#Our objects
Object_1=kra1
Object_2=kra2

#Read CSV
cat list_of_hosts.csv | while read LINE 
do 
	HostName=`echo $LINE | cut -d, -f1`
	if [[ $HostName == *"$Object_1"* ]]; then
		sed -e "s/XXXX/$HostName/g; s/YYYY/$Object_1/g" host_template | tee -a test1/host.cfg
		sed -e "s/XXXX/$HostName/g; s/YYYY/$Object_1/g" comand_template | tee -a test1/comand.cfg
		sed -e "s/XXXX/$HostName/g" nrpe_template | tee -a test1/nrpe.cfg
	elif [[ $HostName == *"$Object_2"* ]]; then
		sed -e "s/XXXX/$HostName/g; s/YYYY/$Object_2/g" host_template | tee -a test2/host.cfg
		sed -e "s/XXXX/$HostName/g; s/YYYY/$Object_2/g" comand_template | tee -a test2/comand.cfg
		sed -e "s/XXXX/$HostName/g" nrpe_template | tee -a test2/nrpe.cfg
	else
		echo "I cant find hosts like this"
	fi
done














# YYYY=test1-noc