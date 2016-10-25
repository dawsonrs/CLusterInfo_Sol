#!/bin/ksh

# Script to gather information from physical node and Sun Cluster 3.1
# 
# Please complete version history information below if changes made
#
# Written by: Robert Dawson
# Modified by: Robert Dawson
#
# Version 1.0
# Date: 28/03/07

EXP_DIR=/opt/SUNWexplo/output
OUTDIR=/tmp/cluster_info
#
# The following 2 variables are defined later in the script
# This is because the new files do not exist yet
# They are just included here to make the reader aware of them
#EXP_TARGET_FILE=`ls -1t $EXP_DIR 2>/dev/null | head -1`
#EXP_TARGET_FILE_FULL_PATH=`ls -1t $EXP_DIR/explorer.*.tar.gz 2>/dev/null | head -1`

echo "All output will be sent to: $OUTDIR"

# if directory not already there, create it
if [ -d "$OUTDIR" ] 
then
	echo "$OUTDIR already exists.  Removing contents...."
	rm -rf $OUTDIR/*
	if [ $? -eq 0 ]
	then
		echo "Success"
	else
		echo "Error deleting contents of $OUTDIR.  Exiting...."
		exit 1
	fi
else
	echo "creating directory: $OUTDIR...."
	mkdir $OUTDIR
	if [ $? -eq 0 ]
	then
		echo "Success"
	else
		echo "Error creating $OUTDIR.  Exiting...."
		exit 2
	fi
fi
#begin the file collection process

echo "cp /etc/profile $OUTDIR/etc.profile"
cp /etc/profile $OUTDIR/etc.profile
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /.profile $OUTDIR/rootprofile"
cp /.profile $OUTDIR/rootprofile
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /.profile-EIS $OUTDIR/rootprofile-EIS"
cp /.profile-EIS $OUTDIR/rootprofile-EIS
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/skel/.profile $OUTDIR/skelprofile"
cp /etc/skel/.profile $OUTDIR/skelprofile
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /kernel/drv/fp.conf $OUTDIR/kernel.drv.fp.conf"
cp /kernel/drv/fp.conf $OUTDIR/kernel.drv.fp.conf
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

cd /etc
for i in `ls -1 hostname.*`
do
	echo "cp $i $OUTDIR/etc.$i"
	cp $i $OUTDIR/etc.$i
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
done

echo "cp /etc/inet/hosts $OUTDIR/etc.inet.hosts"
cp /etc/inet/hosts $OUTDIR/etc.inet.hosts
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/netconfig $OUTDIR/etc.netconfig"
cp /etc/netconfig $OUTDIR/etc.netconfig
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/nsswitch.conf $OUTDIR/etc.nsswitch.conf"
cp /etc/nsswitch.conf $OUTDIR/etc.nsswitch.conf
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/syslog.conf $OUTDIR/etc.syslog.conf"
cp /etc/syslog.conf $OUTDIR/etc.syslog.conf
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/system $OUTDIR/etc.system"
cp /etc/system $OUTDIR/etc.system
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "ls /usr/cluster/lib/rgm/rtreg > $OUTDIR/usr.cluster.lib.rgm.rtreg_dir_contents"
ls /usr/cluster/lib/rgm/rtreg > $OUTDIR/usr.cluster.lib.rgm.rtreg_dir_contents
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/cluster/release $OUTDIR/etc.cluster.release"
cp /etc/cluster/release $OUTDIR/etc.cluster.release
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scrgadm -p > $OUTDIR/scrgadm-p"
scrgadm -p > $OUTDIR/scrgadm-p
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scdidadm -l > $OUTDIR/scdidadm-l"
scdidadm -l > $OUTDIR/scdidadm-l
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scdidadm -lh > $OUTDIR/scdidadm-lh"
scdidadm -lh > $OUTDIR/scdidadm-lh
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scdidadm -L > $OUTDIR/scdidadm-L"
scdidadm -L > $OUTDIR/scdidadm-L
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scdidadm -Lh > $OUTDIR/scdidadm-Lh"
scdidadm -Lh > $OUTDIR/scdidadm-Lh
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scdpm -p all:all > $OUTDIR/scdpm-p.all.all"
scdpm -p all:all > $OUTDIR/scdpm-p.all.all  #(disk path monitoring)
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scinstall -pv > $OUTDIR/scinstall-pv"
scinstall -pv > $OUTDIR/scinstall-pv
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scconf -p > $OUTDIR/scconf-p"
scconf -p > $OUTDIR/scconf-p
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scconf -pv > $OUTDIR/scconf-pv"
scconf -pv > $OUTDIR/scconf-pv
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scconf -pvv > $OUTDIR/scconf-pvv"
scconf -pvv > $OUTDIR/scconf-pvv
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scrgadm -p > $OUTDIR/scrgadm-p"
scrgadm -p > $OUTDIR/scrgadm-p
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scrgadm -pv > $OUTDIR/scrgadm-pv"
scrgadm -pv > $OUTDIR/scrgadm-pv
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scrgadm -pvv > $OUTDIR/scrgadm-pvv"
scrgadm -pvv > $OUTDIR/scrgadm-pvv
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat > $OUTDIR/scstat"
scstat > $OUTDIR/scstat
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -D > $OUTDIR/scstat-D"
scstat -D > $OUTDIR/scstat-D
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -g > $OUTDIR/scstat-g"
scstat -g > $OUTDIR/scstat-g
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -i > $OUTDIR/scstat-i"
scstat -i > $OUTDIR/scstat-i
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -n > $OUTDIR/scstat-n"
scstat -n > $OUTDIR/scstat-n
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -p > $OUTDIR/scstat-p"
scstat -p > $OUTDIR/scstat-p
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -q > $OUTDIR/scstat-q"
scstat -q > $OUTDIR/scstat-q
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "scstat -W > $OUTDIR/scstat-W"
scstat -W > $OUTDIR/scstat-W
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "pmfadm -L > $OUTDIR/pmfadm-L"
pmfadm -L > $OUTDIR/pmfadm-L
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo " metaset > $OUTDIR/metaset"
metaset > $OUTDIR/metaset
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/cluster/ccr/infrastructure $OUTDIR/etc.cluster.ccr.infrastructure"
cp /etc/cluster/ccr/infrastructure $OUTDIR/etc.cluster.ccr.infrastructure
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "Creating TAR archive of cluster ccr.  Please wait...."
cd /etc/cluster
if [ $? -ne 0 ] 
then
	echo "failed to change directory to /etc/cluster"
	continue
else
	tar cvf $OUTDIR/ccr.tar ccr  #this backs up the current ccr
	if [ $? -eq 0 ]
	then
		echo "successfully created tar archive of current ccr"
	else
		echo "error creating tar archive of current ccr"
	fi
fi

# Create a listing of all resource and resource group dependencies

echo "scrgadm -pvv | fgrep "Res Group RG_affinities" > $OUTDIR/rg_affinities"
scrgadm -pvv | fgrep "Res Group RG_affinities" > $OUTDIR/rg_affinities
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi
echo "scrgadm -pvv | fgrep "Res strong dependencies" > $OUTDIR/res_dependencies"
scrgadm -pvv | fgrep "Res strong dependencies" > $OUTDIR/res_dependencies
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

# create an output of the detected disks from the 'format' command
echo "format -l $OUTDIR/format <<!"
format -l $OUTDIR/format <<!
0
q
!
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

## some supplemental OS related information to be gathered

echo "prtdiag -v > $OUTDIR/prtdiag-v"
prtdiag -v > $OUTDIR/prtdiag-v
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "showrev -p > $OUTDIR/showrev-p"
showrev -p > $OUTDIR/showrev-p
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "metadb > $OUTDIR/metadb"
metadb > $OUTDIR/metadb
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "metastat > $OUTDIR/metastat"
metastat > $OUTDIR/metastat
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/inet/hosts $OUTDIR/hosts"
cp /etc/inet/hosts $OUTDIR/hosts
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/inet/ipnodes $OUTDIR/ipnodes"
cp /etc/inet/ipnodes $OUTDIR/ipnodes
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/inet/netmasks $OUTDIR/netmasks"
cp /etc/inet/netmasks $OUTDIR/netmasks
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/inet/networks $OUTDIR/networks"
cp /etc/inet/networks $OUTDIR/networks
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/defaultrouter $OUTDIR/defaultrouter"
cp /etc/defaultrouter $OUTDIR/defaultrouter
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/passwd $OUTDIR/passwd"
cp /etc/passwd $OUTDIR/passwd
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/shadow $OUTDIR/shadow"
cp /etc/shadow $OUTDIR/shadow
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "cp /etc/group $OUTDIR/group"
cp /etc/group $OUTDIR/group
if [ $? -eq 0 ]
then
	echo "success"
else
	echo "failed"
fi

echo "copying crontabs....."
cd /var/spool/cron/crontabs
if [ $? -eq 0 ]
then
	for i in `ls`
	do
		echo "cp "$i" $OUTDIR/"$i"cron"
		cp "$i" $OUTDIR/"$i"cron
		if [ $? -eq 0 ]
		then
			echo "success"
		else
			echo "failed"
		fi
	done
else
	echo "failed to cd to /var/spool/crontabs"
fi

#RSC config
echo "test to see if RSC card present"
if [ -f /usr/platform/`uname -i`/rsc/rscadm ]
then
	echo "RSC card present"
	echo "/usr/platform/`uname -i`/rsc/rscadm show > $OUTDIR/rscadm_show"
	/usr/platform/`uname -i`/rsc/rscadm show > $OUTDIR/rscadm_show
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	echo "/usr/platform/`uname -i`/rsc/rscadm shownetwork > $OUTDIR/rscadm_shownetwork"
	/usr/platform/`uname -i`/rsc/rscadm shownetwork > $OUTDIR/rscadm_shownetwork
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	echo "/usr/platform/`uname -i`/rsc/rscadm usershow > $OUTDIR/rscadm_usershow"
	/usr/platform/`uname -i`/rsc/rscadm usershow > $OUTDIR/rscadm_usershow
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	echo "/usr/platform/`uname -i`/rsc/rscadm version -v > $OUTDIR/rscadm_version-v"
	/usr/platform/`uname -i`/rsc/rscadm version -v > $OUTDIR/rscadm_version-v
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
else
	echo "No RSC card present"
fi

#ALOM config
echo "test to see if ALOM card present"
if [ -f /usr/platform/`uname -i`/sbin/scadm ]
then
	echo "ALOM card present"
	echo "/usr/platform/`uname -i`/sbin/scadm show > $OUTDIR/scadm_show"
	/usr/platform/`uname -i`/sbin/scadm show > $OUTDIR/scadm_show
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	echo "/usr/platform/`uname -i`/sbin/scadm shownetwork > $OUTDIR/scadm_shownetwork"
	/usr/platform/`uname -i`/sbin/scadm shownetwork > $OUTDIR/scadm_shownetwork
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	echo "/usr/platform/`uname -i`/sbin/scadm usershow > $OUTDIR/scadm_usershow"
	/usr/platform/`uname -i`/sbin/scadm usershow > $OUTDIR/scadm_usershow
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	echo "/usr/platform/`uname -i`/sbin/scadm version -v > $OUTDIR/scadm_version-v"
	/usr/platform/`uname -i`/sbin/scadm version -v > $OUTDIR/scadm_version-v
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
else
	echo "No ALOM card present"
fi

# prompt for whether or not an explorer should be run
# this gives the option to save time / processor

echo "Should an explorer be run on this node? [y/n]: "
read reply junk
case $reply in
y|Y)	# a positive response from the user
	echo "Running explorer on this node ( `uname -i` )."
	echo "Output in /opt/SUNWexplo/output as compressed tar archive."
	echo "Please wait, this will take some time..."
	/opt/SUNWexplo/bin/explorer
	if [ $? -eq 0 ]
	then
		echo "explorer ran successfully on `uname -i`"
	else
		echo "error occurred running explorer on `uname -i`"
	fi

	# now copy explorer file to same directory as rest of files
	# wait 5 seconds first to allow new explorer file to replace old one
	sleep 5
	#cd $EXP_DIR
	EXP_TARGET_FILE=`ls -1t $EXP_DIR 2>/dev/null | head -1`
	EXP_TARGET_FILE_FULL_PATH=`ls -1t $EXP_DIR/explorer.*.tar.gz 2>/dev/null | head -1`
	echo "cp $EXP_TARGET_FILE_FULL_PATH $OUTDIR/$EXP_TARGET_FILE"
	cp $EXP_TARGET_FILE_FULL_PATH $OUTDIR/$EXP_TARGET_FILE
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
	;;
n|N)	# a negative response from the user
	echo "No explorer to be run on this node"
	;;
*)		# a catchall
	echo "Incorrect input. Expected y/n" 
	echo "Negative response will be assumed"
	echo "Please run explorer manually or re-run this script choosing 'y'"
	;;
esac

echo "All output has been saved to: $OUTDIR"
