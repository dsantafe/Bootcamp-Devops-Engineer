# Ansible Local Provisioner

**Provisioner name: `ansible_local`**

## Setup Requirements

##### Install Vagrant, Virtualbox

Follow installation guides at appropriate sites:
- [Vagrant](https://developer.hashicorp.com/vagrant/docs/installation)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Steps to reproduce:

- Install Vagrant, Virtualbox
- Create all the necessary files and directories
    - ansible.cfg
    - playbook.yml
    - hosts
    - insecure_private_key
    - Vagrant file
- Test

## Create all the necessary files and directories

Create vagrant and ansible folders to store all the configuration files and directories. The structure of it could look like that:

- vagrant - directory
    - Vagrantfile - file with main configuration
- ansible - directory
    - ansible.cfg - configuration file of Ansible
    - playbook.yml - file with steps for Ansible to execute
    - hosts - file with information about hosts
    - insecure_private_key - private key of created machines

> By default Vagrant shares a `vagrant` folder with permissions of `777`. It allows owner, group and others to have full access on everything that is inside of it.

>> Logging to virtual machine manualy and running `ansible-playbook` command inside `vagrant` directory will output errors connected with permissions. It will render `ansible.cfg` and `insecure_private_key` useless.

## Test

To check run the following command from the `vagrant` directory: `$ vagrant up`

## Links

- [Vagrant](https://youtube.com/playlist?list=PLTd5ehIj0goPCodyeh2ThX37Ceh-2torY)
- [Vagrant: running Ansible provisioning](https://stackoverflow.com/questions/59678447/vagrant-running-ansible-provisioning-after-all-vms-booted-ansible-cannot-conne)
- [Ansible Local Provisioner](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_local#tips-and-tricks)