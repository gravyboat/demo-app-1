base:
  '*':
    - groups
    - users
    - firewall

  'roles:demo-app-1':
    - match: grain
    - demo-app-1

  'roles:demo-app-1-dev':
    - match: grain
    - demo-app-1-dev
