vagrant
=======

Vagrant Workstation (mysql,lamp,node,lnmp)

Prerequisite
-----
[VirtualBox 4.2](https://www.virtualbox.org/wiki/Downloads)
[Vagrant](http://www.vagrantup.com/)

Shared/Synced Folders
-----
The vagrant configuration file is setup to mount and share the `/private/var/domains` folder on osx as an NFS mount, we use this folder as the basis for creating virtual hosts on both nginx and apache. [Trapeze](https://github.com/shawnhilgart/trapeze) is used to automate our virtual host creation, and responsible for parsing configuration files.

Project Structure
-----
`private/var/domains
--sub.domain.com
----site.conf
----site.trapeze.conf
`

Vagrant Commands
-----



