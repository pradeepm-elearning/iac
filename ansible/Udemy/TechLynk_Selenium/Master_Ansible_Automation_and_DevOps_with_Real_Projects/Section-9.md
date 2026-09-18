### ANSIBLE TIPS & TRICKS: PRACTICAL DEMOS
#### 37. 44. Ansible Pause Module - Pause Execution
Ansible `pause` Module: <br>
`pause` module is used to pause the execution of a playbook for a specified amount of time or until a user provides input.

| PARAMETER | DESCRIPTION |
|-|-|
| minute | A Positive Number of Minutes |
| seconds | A Positive Number of Seconds |
| prompt | Text Message |
| echo | yes / no |

```
- name: Example Playbook for Pausing for Manual Maintenance
  hosts: all
  become: yes # Use sudo to perform operations that require root privileges

  tasks:
   - name: Notify about maintenance
      debug:
        msg: "Maintenance window: Please perform the required checks."

Pause for maintenance

prompt: "Press 'Enter' to continue after maintenance is completed"

hame: R
name: Resume operations post-maintenance
shell: echo "Maintenance completed, resuming operations"

tags: scenario1

- name: Install and Start Apache HTTP Server on Ubuntu
hosts: all
become: yes # Use sudo to perform operations that require root privileges
tasks:
- name: Update apt package index
apt:
update_cache: yes

- name: Install Apache HTTP Server
apt:
name: apache2
state: present

- name: Start and enable Apache service
systemd:
name: apache2
state: started
enabled: yes

- name: Pause to allow the web service to start
pause:
seconds: 30

- name: Ensure Apache is running
systemd:
name: apache2
state: started
register: httpd_status

- name: Display Apache status
debug:
msg: "Apache is {{ httpd_status.state }} and enabled."

tags: scenario2

- name: Ansible Pause Parameters
hosts: all
become: yes # Use sudo to perform operations that require root privileges
tasks:
- name: Pause for 30 seconds
pause:
seconds: 30

- name: Pause for user confirmation
pause:
prompt: "Press 'Enter' to continue after verifying the backup"

- name: Pause for UserName input
pause:
prompt: "Enter your password: "
echo: yes

- name: Pause for password input without echoing
pause:
prompt: "Enter your password: "
echo: no

tags: scenario3
```
---
#### 45. Passing Variable to Ansible Playbook via Command Line
Passing Variables via the Command Line :
User can pass variables directly when run the playbook using the
-- extra-vars (or -e) option.

ansible-playbook playbook.yml -- extra-vars "var1=value1
var2=value2'

ansible-playbook playbook. yml -- extra-vars '{"var1": "value1"
'var2": "value2"}

ansible-playbook playbook. yml -- extra-vars "@vars.yml"

```
- name: Pass Variable to Playbook from Command Line
hosts: all
vars:
varl: value 1
var2: value_2
tasks:
- name: Print variables
debug:
msg: "var1={{ var1 }} var2={{ var2 }}"
```
`ansible-playbook <<playbook_FILE>>.yml -e "varl=custom_value_1 var2=custom_value_2"`

---
#### 46. Ansible Terminology : ansible_hostname and inventory_hostname
ansible_hostname and inventory_hostname are variables that refer to different aspects of the hosts managed by Ansible.

ansible_hostname:

o ansible_hostname is a fact gathered by Ansible when it performs the
setup module on a host. It represents the hostname of the target
machine as reported by the operating system.

It is used to refer to the actual hostname of the machine being
managed

inventory_hostname:

o inventory_hostname is the name of the host as specified in the
Ansible inventory file.

o It is used to refer to the host within the context of the inventory and
Ansible playbook.

```
- name: Example playbook to demonstrate ansible_hostname vs inventory_hostname
hosts: webservers
gather_facts: yes

tasks:
- name: Display inventory_hostname
debug:
msg: "inventory_hostname: {{ inventory_hostname

- name: Display ansible_hostname
debug:
msg: "ansible_hostname: {{ ansible_hostname
```
---
#### 47. Set Environment Per Task or Play
o

O

o

User can set environment variables for tasks or entire plays using the
environment directive.

This is useful when you need to ensure that certain environment
variables are set for the commands or scripts that you are running on
remote hosts.

Use cases :
Running Commands with Specific Environment Variables.
Configuring Paths - PATH to include directories where custom binaries
Setting Application-Specific Variables - Database connection string
API keys.

