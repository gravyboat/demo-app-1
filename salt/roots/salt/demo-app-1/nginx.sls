include:
  - nginx.base

demo_app_1_nginx_service:
  service.running:
    - name: nginx
    - enable: True
    - watch:
      - file: demo_app_1_nginx_conf
      - user: nginx_user
    - require:
      - pkg: install_nginx
      - user: nginx_user

demo_app_1_nginx_conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://demo-app-1/files/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: install_nginx

demo_app_1_nginx_conf_d:
  file.managed:
    - name: /etc/nginx/conf.d/demo-app-1.conf
    - source: salt://demo-app-1/files/nginx.demo-app-1.conf.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - file: demo_app_1_nginx_conf
    - watch_in:
      - service: nginx_service

selinux_permissive_mode:
  file.managed:
    - name: /etc/selinux/config
    - source: salt://demo-app-1/files/selinux.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: install_nginx
