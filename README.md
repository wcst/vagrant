vagrant
=======

Vagrant Workstation (mysql,lamp,node,lnmp)

## Outline<a name='outline'> </a>

* [VirtualBox 4.2](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/)

Shared/Synced Folders
-----
The vagrant configuration file is setup to mount and share the `/private/var/domains` folder on osx as an NFS mount, we use this folder as the basis for creating virtual hosts on both nginx and apache. [Trapeze](https://github.com/shawnhilgart/trapeze) is used to automate our virtual host creation, and responsible for parsing configuration files.

Project Structure
-----

``` unicode
private/var/domains/
-sub.domain.com
--site.conf
--site.trapeze.conf
```

## Vagrant Commands
-----
`vagrant up web` Starts & Provisions web server, mapped to:`192.168.33.10`

`vagrant up db` Starts & Provisions database server, mapped to:`192.168.32.10`

`vagrant suspend web` Powers off web server

`vagrant suspend db` Powers off database server, retains data

`vagrant resume web` Resumes/Starts web server

`vagrant resume db` Resume/Starts database server

`vagrant ssh web` SSH into web server

`vagrant ssh db` SSH into database server 

***

## Trapeze

Loading the site configurations is simple. Use the below commands.

`vagrant ssh web` 

`sudo php /var/scripts/trapeze/trapeze sites:scan`





