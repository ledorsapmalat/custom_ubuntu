# custom_ubuntu

This project was created to customized a LINUX (Ubuntu Flavor) 32-Bit Server targeting initially for use on a JavaFX Standalone Application.  It can be customized based on the needs of individual application.

## Main Files to Modify
```
isolinux/txt.cfg
preseed/ks-custom.cfg
preseed/ks-custom.seed
```

## Project specific Files
```
preseed/bootstrap.sh
preseed/client.rb
preseed/file.json
preseed/validation.pem
```

## Boot Sequence Changes
The file isolinux/txt.cfg needs to be modified to cater for your project specific requirements
```
default  custom_install
label custom_install
  menu label ^Install Custom Ubuntu OS
  kernel /install/vmlinuz 
  append  file=/cdrom/preseed/ks-custom.seed initrd=/install/initrd.gz quiet ks=cdrom:/preseed/ks-custom.cfg -- 
```

On the "append" line, the customized configuration files ks-custom.cfg and ks-custom.seed are specified.
Inside these configuration files are applications that you want to be installed on your Operating System at the same time settings such as user or timezone.  

You can learn more on this at http://askubuntu.com/questions/409607/how-to-create-a-customized-ubuntu-server-iso

## Creating your ISO Installer

After modifying required files above or base on your requirement, you can start creating your OWN DISTROBUTION of this OS via the following command:

```
sudo mkisofs -J -l -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -z -iso-level 4 -c isolinux/isolinux.cat -o <TARGET_DIRECTORY>/custom-ubuntu-16.04-i386.iso -joliet-long <GIT_CLONE_DIRECTORY_OF_THIS_PROJECT>
```
e.g.
```
sudo mkisofs -J -l -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -z -iso-level 4 -c isolinux/isolinux.cat -o /home/rtalampas/Development/ISO/custom-ubuntu-16.04-i386.iso -joliet-long /home/rtalampas/Development/ISOWorkspace/hubuntu/

```
Once you have your ISO file, you can burn this into a CD or a USB Stick. Plug the CD or USB Stick to a MACHINE and it WILL AUTO INSTALL HUBUNTU (Custom Ubuntu).
