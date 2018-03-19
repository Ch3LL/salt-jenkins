{%- if pillar.get('py3', False) %}
  {#- pip==1.10 does not work on python 3.4 #}
  {%- set virtualenv_pin = '' %}
{%- else %}
  {%- set virtualenv_pin = '' if grains['os'] == 'MacOS' else '==1.10' %}
{% endif %}

{% if grains['os'] != 'Windows' %}
include:
  - python.pip
{% endif %}

virtualenv:
  pip.installed:
    - name: virtualenv{{ virtualenv_pin }}
    - bin_env: {{ salt['config.get']('virtualenv_path', '') }}
    - cwd: {{ salt['config.get']('pip_cwd', '') }}
{% if grains['os'] not in ('Windows',) %}
    - require:
      - cmd: pip-install
{% endif %}
