# Ansible Tutorial

Ansible is a configuration management tool. System admins use it to configure their machines in an automated and reproducible manner.

Compared to alternatives automation tools (eg; bash scripts), it has some clear advantages:

1. Agentless: Ansible doesn't need any special software to be installed on the machine being configured.

2. Idempotent: running the same Ansible playbooks/tasks against the same machines won't repeat the tasks. It will run the first time only.


## Concepts:

1. Control node: that's the node you run Ansible from (eg. your personal machine)

2. Managed nodes: machines that you use Ansible to configure. All Ansible commands are run on those machines.

3. Inventory: a file that contains a list of ips of managed nodes along with some variables (see [inventory.yml](/kubernetes/setup/inventory.yml)).


## Testing Setup

- Uses Vagrant to create 3 virtual machines to test K8s installation using Ansible.

- **Vagrant** is a tool to automate setting up virtual machines on virtualization software (eg. VirtualBox, Hyper-V, etc..). It's similar to Docker but for VMs.

- **Vagrant** configuration file [(here)](/kubernetes/setup/Vagrantfile) uses Ruby syntax but you don't have to learn Ruby.

- Start the VMs:

```
vagrant up
```

- Run `vagrant status` to verify that 3 VMs are running.

- To verify that Ansible can work with the 3 VMs:

```
ansible all -m ping
```

output:

```
192.168.60.6 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
192.168.60.5 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
192.168.60.4 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

**Note:** Ansible's ping logins to the VMs over SSH. It's not network ping.


- To clean up:

```
vagrant destroy
```