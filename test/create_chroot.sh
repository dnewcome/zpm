# via
# http://linuxtoosx.blogspot.com/2010/09/building-chroot-environment-for-sftp.html

#!/bin/bash
#
# Usage: ./create_chroot_env_osx destinationPath
#

# Specify HERE the apps you want into the enviroment
# /usr/lib/dyld is mandatory
APPS="/usr/lib/dyld /bin/bash /bin/ls /bin/mkdir /bin/mv /bin/pwd /bin/rm"

# Sanity check
if [ "$1" = "" ] ; then
   echo "     Usage: $0 destinationPath"
   exit
fi

# Go to the destination directory
if [ ! -d $1 ]; then mkdir $1; fi
cd $1

# Create Directories no one will do it for you
mkdir etc
mkdir bin
mkdir usr
mkdir usr/bin
mkdir usr/lib
mkdir usr/lib/system

# Add some users to ./etc/paswd
grep /etc/passwd -e "^root" > etc/passwd
grep /etc/group -e "^root" > etc/group

# Copy the apps and the related libs
for prog in $APPS;  do
   cp $prog ./$prog

	## TODO: make this actually reursive
   # obtain a list of related libraryes
   otool -L $prog > /dev/null
   if [ "$?" = 0 ] ; then
      LIBS=`otool -L $prog | grep version | awk '{ print $1 }'`
      for l in $LIBS; do
         cp $l ./$l
         # second level of dependent libraryes
         LLIBS=`otool -L $l | grep version | awk '{ print $1 }'`
         for ll in $LLIBS; do
            cp $ll ./$ll
         done
      done
   fi
done

## TODO there were some libs that didn't get picked up. 
## this is a patch to pick them up
cp /usr/lib/libobjc.A.dylib ./usr/lib/
cp /usr/lib/system/libdispatch.dylib ./usr/lib/system/
cp /usr/lib/libauto.dylib ./usr/lib/
cp /usr/lib/libc++abi.dylib ./usr/lib/
cp /usr/lib/libdiagnosticMessages.dylib ./usr/lib/
cp /usr/lib/libDiagnosticMessagesClient.dylib ./usr/lib
