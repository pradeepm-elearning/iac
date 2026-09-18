### Ansible Modules, Facts & Variables
#### 27. Ansible Modules
	Setup Modules: Used to get facts while executing Ansible Playbook. It gets the information of Ansible Client.
	
Gets complete information of the Ansible Client
`ansible all -m setup`

Filter out the specific information.
`ansible all -m setup -a "filter=ansible_memory_mb"

Total Number of commands available in Ansible:
`ansible-doc -l`

View the documentation of Specific Modules
`ansible-doc <<MODULE NAME>>`

	
#### 28. Ansible Facts
	Facts are used to get Ansible Client Information like OS, Processor, release, IP etc. We basically get infrastructure details.
	Task of collecting Ansible Client Information is called the Gathering Facts.
	Gathered Information is called the Facts or Variables.

#### 27. Create Custom Facts
	2 Types of Facts:
		Default Facts
			default facts using setup modules.
		Custom Facts
			User defined facts.
			
	To get user defined facts.
	
1. Steps to Create Custom Facts:
	1. create `/etc/ansible/facts.d` on your managed nodes
	2. Inside the `facts.d` create one or more custom facts file with extension of `.facts`
	3. Output of the fact file should be JSON.
	4. Fact file should have execution permission.