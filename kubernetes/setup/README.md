# Setup K8s on IHR's on-premise servers

- This folder contains everything needed to setup K8s on IHR servers.

- It uses Ansible to automate the setup on Ubuntu servers and is intended for IHR usage only.

## Requirements

- [Kubespray](https://github.com/kubernetes-sigs/kubespray)
- it should be pulled with
```
git submodule update --init --recursive
```

## Resources

- [Ansible Overview](/kubernetes/setup/ansible_overview.md)

## Usage:

1. create virtual env for kubespray

```
cd kubernetes/setup
python3 -m venv kubespray-venv
source kubespray-venv/bin/activate
```

2. install kubespray requirements

```
pip install -U -r kubespray/requirements.txt
```

3. Build the [inventory.yml](/kubernetes/setup/inventory.yml)

- make sure to change username & ssh key path  

4. Validate Ansbile can access nodes on ssh

```
ansible all -m ping
```

5. Install Kubernetes

```
cd kubespray
ansible-playbook -i ../inventory.yml --user=vagrant --become --become-user=root -K cluster.yml
```
- don't forget to change user variable
- this command asks for sudo password on the nodes

6. Setting up remote cluster access:

    1. SSH into any node.
    2. Copy contents of `/etc/kubernetes/admin.conf` to your local `~/.kube/config`

7. Verify Kubernetes installation

- Show cluster nodes (on local machine)
```
kubectl get nodes
```

- Show all Cluster resources (on local machine)
```
kubectl get all
```

8. Voila ✅

**To reset the nodes (i.e delete installed kubernetes):**

```
cd kubespray
ansible-playbook -i ../inventory.yml --user=vagrant --become --become-user=root reset.yml
```

See kubespray to remove/add nodes: https://github.com/kubernetes-sigs/kubespray/blob/master/docs/nodes.md
