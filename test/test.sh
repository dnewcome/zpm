mkdir jail
./create_chroot.sh jail

# copy the test cases in
cp ../case1.sh ./

# run the test cases in the chroot
sudo chroot jail bash ./case1.sh 
