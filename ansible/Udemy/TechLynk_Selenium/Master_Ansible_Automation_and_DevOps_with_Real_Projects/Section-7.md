### BASIC OF ANSIBLE PLAYBOOK
#### 34. Playbook Introduction
Structure of playbook
	Concepts
		Tasks
		Play
		Playbooks

<p>Play: Play is a combination of Tasks + Targets</p>
Task: Operation, user wants to perform.
Playbook: Playbook is a combination of Plays and List or sequence of the Plays.

---
#### 35. Demo: Playbook Introduction

* Create a simple ansible playbook using ansible playbook file.
<br> `vim intro_playbook.yml`
```
- name: Introduction Ansible Playbook
	hosts: all
	become: 'yes'
	tasks:
		- name: Checking Connection via Ping
			ping:
```
`ansible-playbook -i <<PATH_TO_AWS_ANSIBLE_FILE>> -u <<USERNAME>> <<ANSIBLE_PLAYBOOK_FILE>>`
<br>
<br>
* Create an ansible playbook to install apache2/httpd and start apache2/httpd service.
<br> `vim install_https.yml`
```
- name: Installing WebServer
	hosts: all
	become: 'yes'
	become_user: root
	tasks:
		-	name: Ensure Apache is at the Latest Version
			yum:
				name: httpd
				state: Latest
		- name: Ensure Apache is Running
			service:
				name: httpd
				state: started
```
`ansible-playbook -i <<PATH_TO_AWS_ANSIBLE_FILE>> -u <<USERNAME>> <<ANSIBLE_PLAYBOOK_FILE>>`

---
#### 36. Start Writing-Executing PlayBooks
This section helps us in minimising the total number of command being executing in shell. <br>
1. Dynamic Inventory Path:
	* Goto Ansible Config file (`ansible.cfg`) and replace the `inventory` value to the path of the Dynamic Inventory. <br>
```
inventory = /<<PATH_TO_DYNAMIC_INVENTORY>>/<<DYNAMIC_INVENTORY_FILE>>.yml
```

2. Add Remote User who executes the service/playbook. <br>
	*	Goto Inventory File and add the `remote_user: <<USERNAME>>`.
```
- name: Installing WebServer
	hosts: all
	become: 'yes'
	become_user: root
	remote_user: ubuntu
	tasks:
		- - - -
		- - - - 
```