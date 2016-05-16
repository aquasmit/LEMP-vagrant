# LEMP-vagrant
LEMP setup on Vagrant with ubuntu box

Clone this repository & run ````vagrant up````

This will download the ubuntu 14.04 box and it will run install.sh which is provisioning script for installing Nginx, PHP, MySQL, composer

Once everything is installed, you must update your hosts file 
````sudo nano /etc/hosts````
And add a line ````192.168.33.21 app.dev```` to this file.

Now you should be able to access site at url http://app.dev from browser and you should see output "Hello World"
