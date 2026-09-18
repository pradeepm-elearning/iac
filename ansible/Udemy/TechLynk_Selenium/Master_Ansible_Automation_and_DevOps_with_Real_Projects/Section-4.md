### Ansible Ad-hoc Commands.
#### 22. Syntax of Ansible Ad-Hoc Commands
Ansible Ad-hoc Command Syntax: 
| DESCRIPTION | COMMAND |
|-|-|
| SYNTAX | `ansible <<GROUP>> -m <<MODULES>> -a <<COMMAND>>` |
| Connectivity using Ping | `ansible all -m ping` |
| Checking Memory | `ansible all -m shell -a "free -m"` |
| Checking Uptime | `ansible all -m shell -a "uptime"` |
| Listing Packages | `ansible all -m shell -a "apt list"` |

#### 24. Transfer file from Engine to Clients
Ansible Ad-hoc Command File Transfer Syntax: </br>
<br>`ansible [group] -m copy -a [src=source_path dest=destination_path]`
<br>`ansible all -m copy -a "src=/tmp/*.txt dest=/tmp/"` </br> </br>
Ansible Ad-hoc Command adding Content Syntax:	 </br>
<br>`ansible [group] -m copy -a [content='This is a content' dest=destination_path/filename]` </br>
<br>`ansible all -m copy -a "content='This is the content' dest=/tmp/temp.txt"` </br>

#### 25. Manage File/Directory on Ansible Clients
Ansible Ad-hoc Command to create a file Syntax: </br>
`ansible <<GROUP>> -m file -a "dest=<<DESTINATION_PATH/FILE_NAME>> state=<<STATE>>"` </br> </br>
Create a File: </br>
`ansible [group] -m file -a "dest=<<DESTINATION_PATH/FILE_NAME>> state=touch"` </br>
`ansible all -m file -a "dest=/tmp/test.txt state=touch"` </br>
`ansible all -m file -a "dest=/tmp/test.txt state=touch mode=0775"` </br> </br>
Delete a File: </br>
`ansible [group] -m file -a "dest=<<DESTINATION_PATH/FILE_NAME>> state=absent"` </br>
`ansible all -m file -a "dest=/tmp/test.txt state=absent"` </br> </br>
Create a Directory: </br>
`ansible <<GROUP>> -m file -a "dest=<<DESTINATION_PATH/DIRECTORY_NAME>> state=directory" mode=<<PERMISSION>>` </br> </br>
Delete a Directory: </br>
`ansible <<GROUP>> -m file -a "dest=<<DESTINATION_PATH/DIRECTORY_NAME>> state=absent"` </br>

#### 26. Install Packages on Ansible Clients
Ansible Ad-hoc Command to install a Packages: </br>
`ansible <<GROUP>> -m <<PACKAGE_MANAGER>> -a "name=<<PACKAGE_NAME>> state=<<STATE>>"` <br> <br>
Install any packages using non-sudo user: <br>
`ansible <<GROUP>> -m <<PACKAGE_MANAGER>> -a "name=<<PACKAGE_NAME>> state=present"` </br> </br>
Install any packages using sudo user: </br>
`ansible <<GROUP>> -m <<PACKAGE_MANAGER>> -a "name=<<PACKAGE_NAME>> state=present" -b` </br> </br>
Install any latest packages using sudo user: </br>
`ansible <<GROUP>> -m <<PACKAGE_MANAGER>> -a "name=<<PACKAGE_NAME>> state=latest" -b` </br> </br>
Uninstall any packages using sudo user: </br>
`ansible <<GROUP>> -m <<PACKAGE_MANAGER>> -a "name=<<PACKAGE_NAME>> state=absent" -b` </br>
