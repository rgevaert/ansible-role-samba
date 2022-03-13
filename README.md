[![CI](https://github.com/de-it-krachten/ansible-role-samba/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-samba/actions?query=workflow%3ACI)


# ansible-role-samba

Install/configure samba


Platforms
--------------

Supported platforms

- CentOS 7
- RockyLinux 8
- AlmaLinux 8
- Debian 10 (Buster)
- Debian 11 (Bullseye)
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS
- Fedora 34



Role Variables
--------------
<pre><code>
# Packages required to install samba
samba_packages:
  - samba
  - cifs-utils

# samba service
samba_services:
  - smb

# Confiuration template
samba_conf: samba.conf.j2

# List of shares
samba_shares: []

# Should the samba users be defined as OS users
samba_create_users: false

# List of local samba users
samba_users: []
</pre></code>


Example Playbook
----------------

<pre><code>
- name: sample playbook for role 'samba'
  hosts: all
  vars:
    samba_create_users: True
    samba_users: [{'name': 'user1', 'password': 'password1'}, {'name': 'user2', 'password': 'password2'}]
    samba_shares: [{'name': 'homes', 'settings': {'comment': 'Home Directories', 'browseable': 'yes', 'read__only': 'no', 'create__mask': '0700', 'directory__mask': '0700', 'valid__users': '%S', 'writeable': 'yes', 'public': 'yes'}}, {'name': 'private', 'settings': {'comment': 'private directories', 'browseable': 'no', 'public': 'no'}}]
  tasks:
    - name: Include role 'samba'
      include_role:
        name: samba
</pre></code>
