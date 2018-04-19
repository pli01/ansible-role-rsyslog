Role Name
=========

simple rsyslog configuration

Requirements
------------

ansible

[![Build Status](https://travis-ci.org/pli01/ansible-role-rsyslog.svg?branch=master)](https://travis-ci.org/pli01/ansible-role-rsyslog)

Role Variables
--------------

```
# template for rsyslog.d/*.conf
rsyslog_templates:
  - { src: journald-json.conf, dest: 01-journald-json.conf }
  - { src: forward-elk.conf, dest: 99-forward-elk.conf }

# elasticsearch target
rsyslog_forward_elk: 'elasticsearch:514'
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ansible-role-rsyslog }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
