!#/bin/bash
#script which checked if rpms in /var/lib/rhui/remote_share 
#are also present in mongodb

#mongo
#use pulp_database
#db.units_rpm.find({"filename" : "java-1.6.0-openjdk-devel-1.6.0.37-1.13.9.4.el5_11.x86_64.rpm"}).pretty()

#if not, they are cleaned up.

#ls /var/lib/rhui/remote_share | grep rpm

for filename in $(ls /var/lib/rhui/remote_share | grep rpm)
do
	echo "checking $filename"
	mongo pulp_database --eval 'db.units_rpm.find({"filename" : "$filename"}).pretty()'
done
#mongo pulp_database --eval 'db.units_rpm.find({"filename" : "$filename"}).pretty()'
