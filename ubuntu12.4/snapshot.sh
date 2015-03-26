#!/bin/bash
# 
# Author: Andrew Khalymon
#
# This script is a helpful in taking snapshots of clusters that consists of several machines.
# It is suited for vagrant enviorments,but not depends on it, so arbitrary vms can be used(vm prefix must be the same for all of them)
# If you are using Windows for Vagrant, you must do time sync by yourself or by using additional script
# This is because of MSYS don't support ssh. Also, on Windows, you must have VBoxManage.bat file in the $PATH
# 
# This script is confirmed to work with Virtualbox 4.3.6. Older are not recomended (they have bugs, connected with snapshot taking)

set_vm_prefix(){
	current_dir=$(basename "$PWD")
	case $current_dir in
	centos6.5)
		vm_prefix=c65
	;;
	centos6.4)
		vm_prefix=c64
	;;
	centos5.9)
		vm_prefix=c59
	;;
	centos5.8)
		vm_prefix=c58
	;;
	suse11)
		vm_prefix=suse11	
	;;
	ubuntu12.4)
		vm_prefix=u12
	;;
	ubuntu14.4)
		vm_prefix=u14
	;;
	debian7.6)
		vm_prefix=d76
	;;
	*)
		echo "Unrecognized working folder! $0 needs to be placed into on of the following: "
		echo "centos 6.5 centos6.4 centos5.8. centos5.9 suse11 ubuntu12.4"
		exit -1;
	;;
	esac
}


#set alias for VBoxManage
VBoxManageWrapper()
{
	if [ $(uname -o) == Msys ]
	then
		VBoxManage=VBoxManage.bat
		params=$@
		cmd /c "$VBoxManage $params"
	else
		VBoxManage $@
	fi
}

vm_name()
{
	vm=$(VBoxManageWrapper list vms|grep $1|awk '{print $1;}'|sed -e 's/^"//'  -e 's/"$//'|sed 's/ *$//g'|tr -d ' ')
	if [[ -z $vm ]];
		then
		echo "NONE" 
		return;
	fi
	echo $vm
}

is_running()
{
	vm=$(vm_name $1)
	if [ $vm == "NONE" ]; then
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
	running_vm_name=$(VBoxManageWrapper list runningvms|grep $vm|tr -d ' ')
	if [[ -z $running_vm_name ]] ;
		then
		echo "false";
	else
		echo "true";
	fi
}

run_all_vms()
{
echo 
echo "# Checking that all vm running and trying to start if not ..."

for i in `seq -f '%02g' $1 $2`;
do
	vm=$(vm_name $vm_prefix$i)
	if [[ $vm != "NONE" ]]; then
		vm_running=$(is_running $vm_prefix$i)
		echo VM=$(vm_name $vm_prefix$i) running=$vm_running
		if [[ $vm_running  == "false" ]]; then
			echo Starting VM $vm_prefix$i
			VBoxManageWrapper startvm --type headless $vm
			
		fi
	else
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
done
#Workaround for Virtualbox messy behaviour
sleep 3
}

controlvm()
{
echo 
echo "# Controlvm - Action="$3

for i in `seq -f '%02g' $1 $2`;
do
	vm=$(vm_name $vm_prefix$i)
	if [[ $vm != "NONE" ]]; then
		if [[ $(is_running $vm_prefix$i) == false ]]; then
			echo "$vm_prefix$i is not running, skip $3"
			continue;
		fi
	

		echo $3 VM $vm_prefix$i
		VBoxManageWrapper controlvm $vm $3
	else
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
done
}


list_vm_snapshots()
{
echo 
echo "# Listing VM's snapshots ..."

for i in $(seq -f '%02g' $1 $2);
do
	vm=$(vm_name $vm_prefix$i)
	if [ $vm != "NONE" ]; then
		echo Listing VM $vm_prefix$i snapshots
		VBoxManageWrapper snapshot $vm list
	else
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
done	
}

snapshot_take()
{
echo 
echo "# Takings VM's snapshots ... Snapshot name: "$3

for i in $(seq -f '%02g' $1 $2);
do
	vm=$(vm_name $vm_prefix$i)
	if [ $vm != "NONE" ]; then
		echo Takings VM $vm_prefix$i snapshot. Snapshot name=$3
		VBoxManageWrapper snapshot $vm take $3
	else
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
done	
}

snapshot_delete()
{
echo 
echo "# Deleting VM's snapshots ... Snapshot name: "$3

for i in $(seq -f '%02g' $1 $2);
do
	vm=$(vm_name $vm_prefix$i)
	if [ $vm != "NONE" ]; then
		echo "Deleting VM $vm_prefix$i snapshot. Snapshot name="$3
		VBoxManageWrapper snapshot $vm delete $3
	else
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
done	
}
snapshot_check(){
for i in $(seq -f '%02g' $1 $2);
do
	vm=$(vm_name $vm_prefix$i)
	if [ $vm != "NONE" ]; then
		snapshotPresent=$(VBoxManageWrapper snapshot $vm list --machinereadable|grep $3)
		# echo $snapshotPresent 
		# echo =================
		if [[ $snapshotPresent =~ .*SnapshotName.* ]]; then
			echo "Snapshot $3 found for $vm_prefix$i"
			else
			echo "Snapshot $3 doesn't exist for $vm_prefix$i"
			exit -1;
		fi
	else
		echo "VM $vm_prefix$i doesn't exist"
		exit -1;
	fi
done	
}

snapshot_go()
{
echo 
echo "# Moving all VM's to snapshots ... Snapshot name: "$3

for i in $(seq -f '%02g' $1 $2);
do
	vm=$(vm_name $vm_prefix$i)
	echo "Restoring VM $vm_prefix$i from snapshot. Snapshot name="$3
	VBoxManageWrapper snapshot $vm restore $3
	
done	
}

sync_time()
{
if [ $(uname -o) == Msys ];
then
	echo
	echo "============================================================"
	echo "Time sync is not avaliable on Windows hosts. "
	echo "PLEASE DO IT BY YOURSELF"
	echo "============================================================"
else
	echo 
	echo "# Syncing time on all VM's ..."

	for i in $(seq -f '%02g' $1 $2);
	do
		vm=$(vm_name $vm_prefix$i)
		if [ $vm != "NONE" ]; then
			echo "Syncing time on VM $vm_prefix$i"
			ssh -i ../insecure_private_key root@$vm_prefix$i  'sudo service ntpd stop && sudo ntpdate -s time.nist.gov && sudo service ntpd start'
		else
			echo "VM $vm_prefix$i doesn't exist"
			exit -1;
		fi
	done	
	echo "Time on VM's is:"
	for i in $(seq -f '%02g' $1 $2);
	do
			ssh -i ../insecure_private_key root@$vm_prefix$i  'date'
	done	
fi

}

#Here main script starting

echo "======= Virtualbox multiple VM snapshot script ========"
set_vm_prefix
case $1 in
list)
	echo "Command chosen: list"
	if [[ $2 == [0-9] && $3 == [0-9] ]]; then
	list_vm_snapshots $2 $3
	else
		echo "Invalid arg vm numbers: expected [0-9] [0-9], but was " $2 $3
		exit -1;
	fi
;;
go)
	echo "Command chosen: go"
	if [[ $2 == [0-9] && $3 == [0-9] && -n $4 ]]; then
		snapshot_check $2 $3 $4
		controlvm $2 $3 poweroff
		sleep 2
		snapshot_go $2 $3 $4
		run_all_vms $2 $3
		sync_time $2 $3
	else
		echo "Invalid arg vm numbers: expected [0-9] [0-9] <snapshot_name>, but was " $2 $3 $4
		exit -1;
	fi	
;;
take)
	echo "Command chosen: take"
	if [[ $2 == [0-9] && $3 == [0-9] && -n $4 ]]; then
		run_all_vms $2 $3
		controlvm $2 $3 pause
		snapshot_take $2 $3 $4
		controlvm $2 $3 resume
		sync_time $2 $3
	else
		echo "Invalid arg vm numbers: expected [0-9] [0-9] <snapshot_name>, but was " $2 $3 $4
		exit -1;
	fi	
;;
delete)
	echo "Command chosen: delete"
	if [[ $2 == [0-9] && $3 == [0-9] && -n $4 ]]; then
		read -p "All machines from this folder will be powered off. Are you sure[N/y]? " -n 1 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			controlvm $2 $3 poweroff
			for snapshot_name in ${@:4}
			do
				snapshot_delete $2 $3 $snapshot_name
			done
		fi
		
	else
		echo "Invalid arg vm numbers: expected [0-9] [0-9] <snapshot_name>, but was " $2 $3 $4
		exit -1;
	fi	
;;
*)
	echo "Usage: $0 {list|go|take|delete} <first_vm> <last_vm> <snapshot_name>"
	echo
	echo "list:   for vm in [<first_vm>; <last_vm>] show snapshots list"
	echo "take:   for vm in [<first_vm>; <last_vm>] take snapshot <snapshot_name>"
	echo "go:     for vm in [<first_vm>; <last_vm>] go to snapshot <snapshot_name>"
	echo "delete: for vm in [<first_vm>; <last_vm>] delete snapshot <snapshot_name>"
	echo 
	echo "Example:" 
	echo "$0 list 1 3"
	echo "$0 take 1 4 clear_system"
	echo "$0 go 1 4 clear_system"
	echo "$0 delete 4 4 clear_system"

;;
esac
