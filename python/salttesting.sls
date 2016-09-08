include:
  - python.pip
  - python.headers
  - gcc

SaltTesting:
  pip.installed:
    - name: salttesting==2016.9.7
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - upgrade: true
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - cmd: pip-install
      - pkg: python-dev
      - pkg: gcc

