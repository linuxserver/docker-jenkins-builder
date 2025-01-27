# Ansible

## filter_plugins/

Houses custom jinja filters.

- admonition.py
  - Creates admonitions in different syntax' based on the markdown output format

## Roles


## ansible.cfg

This overwrites/sets some Ansible configuration, mainly the inventory in this case.

## inventory.ini

This file sets up the localhost host, the same way Ansible would without the file, without logging "implicit localhost" in the output.
