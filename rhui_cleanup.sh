!#/bin/bash
#script which checked if rpms in /var/lib/rhui/remote_share 
#are also present in mongodb
#if not, they are cleaned up.

for filename in $(ls -R /var/lib/rhui/remote_share | grep rpm)
do
	echo "checking $filename"
	check=$(mongo pulp_database --eval 'db.units_rpm.find({"filename" : "'$filename'"})' | grep -v -e MongoDB -e pulp_database | wc -l)
	if [ $check == 1 ]; then
		echo "$filename is present in mongodb, skipping"
	fi
	if [ $check == 0 ]; then
		remove=$(find /var/lib/rhui/remote_share -name $filename)
		echo "removing $filename since it is not present in mongodb"
		rm -rf $remove
	
	fi 

done

