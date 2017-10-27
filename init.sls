{% if grains['os'] == 'Gentoo' %}

{% set keywords_file = '/etc/portage/package.accept_keywords/all' %}

{% for pkg in 'net-libs/nodejs','net-libs/http-parser' %}
keyword-{{ pkg }}:
  file.replace:
    - name: {{ keywords_file }}
    - pattern: .*{{ pkg }}.*
    - repl: {{ pkg }}
    - append_if_not_found: True
{% endfor %}

package-nodejs:
  pkg.installed:
    - name: net-libs/nodejs
    - version: latest

{% endif %}
