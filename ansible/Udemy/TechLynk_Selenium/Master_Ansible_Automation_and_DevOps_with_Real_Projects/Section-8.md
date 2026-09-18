### BASIC CONCEPTS OF ANSIBLE PLAYBOOK
#### 37. Logging Debug Statement using Ansible PlayBooks

Ansible has `debug` module which helps in debugging Variables and Expressions. <br>
`debug` module accepts 3 parameters.
1. `msg` : print or logging statement. Can have single or multi-statment lines.
2. `var` : print the value of the variable.
3. `verbosity` : which verbosity level logging where you want to print.

##### Example:
```
tasks:
  - name: Task for Debug Module Messaging using msg
    debug:
      msg:
        - "Hi THere!"
        - "This is a Custom Message for debug module"
        - "The Hostname is {{inventory_hostname}}
  - name: Task for Debug Module using var
    debug:
      var: inventory_hostname
  - name: Task for Debug Module using Verbosity
    debug:
      msg: "Hi There! This is deep logging at Debug Level-2"
      verbosity: 2
```
`ansible-playbook <<ANSIBLE_PLAYBOOK_FILENAME>>.yml -vv`

---

#### 38. Variables in Ansible Play-Books
##### Example
```
- name: This is var example
  hosts: all
  remote_user: ubuntu
  become: True
  become_user: root
  vars:
    test: Hello! This is Variable Example.
    username: Pradeep
    location: Bengaluru
  tasks:
    - name: Reading Ansible Playbook variables
      debug:
        var: test
    - name: User details using Variable
      debug:
        msg:
          - "Hello! My Name is {{username}}"
          - "I live in {{location}}"
```
---
#### 39. Data Collection in Ansible
Data Collection/Data Store is used to store Multiple Value in a Variable. <br>
You can have a sequence data structure & a map Data Structure. <br>
It is just like Python's Lists & Dictionaries.
##### Example
```
vars:
  message: Hello! This is a Test message.
  packages: ['httpd', 'wget', 'unzip', 'curl', 'vim']
  cities:
  - Bengaluru
  - Mumbai
  - Chennai
  web_server: {'Linux':'httpd', 'Unix':'apache2'}

tasks:
  - name: This is Data Collection Retrival
    debug:
      var: message
  - name: Getting Sequence Data Collection F1
    debug:
      var: packages
  - name: Getting Sequence Data Collection F2
    debug:
      var: cities
  - name: Getting Sequence Data Collection F3
    debug:
      var: web_server
```
---
#### 40. Uses of `set_fact` and `register`
Ansible Modules generally return a data structure. <br>
User can store the output of module using ansible `register` module. <br>
`set_fact` is used to store the variable.

```
tasks:
  - name: Retrieves Installed Shell Version
    shell: "bash --version"
    register: bash_ver

  - name: Set Fact Details
    set_fact:
      bash_version: "{{bash_ver.stdout_lines[0].split()[3]}}"

  - name: Message Print
    debug:
      var: bash_version
```
---
#### 41. Arithmetic Operations on Variables in Playbook
Arithmatic Operations in Playbook is possible with "Jinja Syntax".
{{ variable_name }} is Jinja Syntax.

```
vars:
  a: 10
  b: 20

tasks:
  - name: Operations on Variables
    debug:
      msg:
        - "Value of a is {{ a }}"
        - "Value of b is {{ b }}"
        - "Addition of a & b: {{ a + b }}
```
---
#### 42. Practice on Arithmetic Operators
##### Example
```
vars:
  a: 10
  b: "{{ a * 10 }}

vars_prompt:
  - name: x
    prompt: "Please Enter a Value of x: "
    private: no
  - name: y
    prompt: "Please Enter a Value of y: "
    private: no

tasks:
  - name: Operations on Variables
    debug:
      msg:
        - "Addition of User Defined Values x, y is: {{ x + y }}"
        - "Addition of User Defined Values x, y is: {{ x|int + y|int }}"
```
---
#### 43. Filter and Methods of Ansible Playbook
Filters and Methods are ways to perform operations on your variables. <br>
| FILTERS | METHODS |
|-|-|
| Inbuilt operation definition in Ansible (Jinja Format). | If we are using Python Methods for custom Operations on custom methods |
| Uses `\|` operator on variables. | Uses `.` operator on variables |

##### Example

```
vars:
  a: "HeLLO! This IS AnsIBLe TuToRialS! ENJoy!"
  b: 10
  c: "20"

tasks:
  - name: Operations on Variables
    debug:
    msg:
    - "value of a is: {{a}}"
    - "value of b + c is: {{b+c|int}}"
    - "Small Case Value of a: {{a|lower}}"
    - "Capital Case Value of a: {{a|upper}}"
    - "Title Case Value of a: {{a|title}}"
    - "Small Case Value of a: {{a.lower()}}"
    - "Capital Case Value of a: {{a.upper()}}"
    - "Split of String a: {{a.split()}}"
```
---