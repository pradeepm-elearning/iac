### Ansible Inventories
#### 30. Work with Dynamic Inventory Script AWS I
Inventory - Collections of Hosts is called Inventory. <br>

Types of Inventory
* Static Inventory
*	Dynamic Inventory: It is an Ansible Plugin. Earlier, Dynamic Inventory was a script like Shell/Python. <br>
	
List all the Dynamic Inventory Plugin List: <br>
`ansible-doc -t inventory -l`

---
#### 31. Work with Dynamic Inventory Script AWS II
Add Enable Plugin Syntax in Ansible cfg file:
```
[inventory]
enable_plugins = host_list, script, auto, yaml, ini, toml
```

Install Boto3 plugin in Python Virtual environment <br>
`sudo pip3 install boto3` <br>
`sudo pip3 install botocore`

Create AWS User and export Credentials on Ansible Engine.
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

Create a YML file for AWS Plugin. <br>
`vim demo.aws_ec2.yml` <br>
```
plugin: amazon.aws.aws_ec2
```

Verify and Populate the AWS Dynamic Inventory <br>
`ansible-inventory -i <<AWS PLUGIN FILE NAME>> --graph` <br>
`ansible-inventory -i <<AWS PLUGIN FILE NAME>> --list`  <br>
 
`ansible all -i <<AWS PLUGIN FILE NAME>> -m ping` <br>
`ansible all -i <<AWS PLUGIN FILE NAME>> -u <<EC2_USERNAME>> -m ping`
 
Filter the Information with only Running Instances. <br>
`vim demo.aws_ec2.yml`
```
filters:
	Instance-state-name: running
```