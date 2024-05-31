#!/bin/bash

vmpath=`VBoxManage list systemproperties | grep -i "default machine folder:" \
    | cut -b 24- | awk '{gsub(/^ +| +$/,"")}1'`

read -p 'Name: ' name
read -p 'RAM (MB): ' ram
read -p 'CPU: ' cpu
read -p 'Storage (MB): ' storage

sascontrollername="SAS Controller"
idecontrollername="IDE Controller"

## Copy autoinstall iso
cp ./iso/focal-autoinstall-live-server-amd64.iso ./iso/${name}.iso

VBoxManage createvm --name "${name}" --ostype Ubuntu_64 --register
VBoxManage modifyvm "${name}" --memory ${ram}
VBoxManage createhd --filename "${vmpath}/${name}.vdi" --size ${storage}
VBoxManage modifyvm "${name}" --cpus ${cpu}

VBoxManage storagectl "${name}" --name "${sascontrollername}" --add sas --controller LSILogicSAS
VBoxManage storageattach "${name}" --storagectl "${sascontrollername}" --port 0 --device 0 --type hdd --medium "${vmpath}/${name}.vdi"
## 
VBoxManage storagectl "${name}" --name "${sascontrollername}" --hostiocache on
VBoxManage storagectl "${name}" --name "${idecontrollername}" --add ide --controller PIIX4
## Mount Autoinstall ISO
VBoxManage storageattach "${name}" --storagectl "${idecontrollername}" --port 0 --device 0 --type dvddrive --medium "iso/${name}.iso"

VBoxManage modifyvm "${name}" --nestedpaging on
VBoxManage modifyvm "${name}" --largepages on

#VBoxManage modifyvm "${name}" --vrde on
#VBoxManage modifyvm "${name}" --vrdeport 5587
#VBoxManage modifyvm "Ubuntu" --vrde off

VBoxManage startvm "${name}" --type headless
