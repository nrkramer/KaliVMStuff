echo "Please insert the Guest Additions CD (ISO), then click \"Cancel\" when the prompt appears."
echo "This can be done by clicking \"Devices\" -> \"Insert Guest Additions CD Image...\" from the Virtualbox Menu."
echo

while [ ! -f /media/cdrom/VBoxLinuxAdditions.run ]; do sleep 1; done
echo "Found VBoxLinuxAdditions.run. Copying to ~/Desktop/..."
cp -R /media/cdrom ~/Desktop/VBoxGuestAdditions/
