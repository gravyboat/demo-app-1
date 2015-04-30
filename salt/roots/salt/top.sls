base:
  '*':
    - users
    - sudoers
    - operations.pkgs
    - ntp
    - logrotate.salt
    - firewall

  'roles:demo-app-1-dev':
    - match: grain
    - demo-app-1

  'roles:demo-app-1-prod':
    - match: grain
    - demo-app-1
