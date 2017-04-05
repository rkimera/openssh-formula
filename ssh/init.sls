#### SSH/INIT.SLS --- Salt states managing the OpenSSH client

### Copyright (c) 2015, Matthew X. Economou <xenophon@irtnog.org>
###
### Permission to use, copy, modify, and/or distribute this software
### for any purpose with or without fee is hereby granted, provided
### that the above copyright notice and this permission notice appear
### in all copies.
###
### THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
### WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
### WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
### AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
### CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
### LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
### NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
### CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

### This file installs and configures the OpenSSH client.  The key
### words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
### "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in
### this document are to be interpreted as described in RFC 2119,
### https://tools.ietf.org/html/rfc2119.  The key words "MUST (BUT WE
### KNOW YOU WON'T)", "SHOULD CONSIDER", "REALLY SHOULD NOT", "OUGHT
### TO", "WOULD PROBABLY", "MAY WISH TO", "COULD", "POSSIBLE", and
### "MIGHT" in this document are to be interpreted as described in RFC
### 6919, https://tools.ietf.org/html/rfc6919.  The keywords "DANGER",
### "WARNING", and "CAUTION" in this document are to be interpreted as
### described in OSHA 1910.145,
### https://www.osha.gov/pls/oshaweb/owadisp.show_document?p_table=standards&p_id=9794.

{%- from "ssh/map.jinja" import ssh_settings with context %}

ssh:
  pkg.installed:
    - pkgs: {{ ssh_settings.packages|yaml }}

  file.recurse:
    - name: {{ ssh_settings.config_directory|yaml_encode }}
    - source: salt://ssh/files/
    - template: jinja
    - user: root
    - group: 0
    - dir_mode: 755
    - file_mode: 644
    - require:
        - pkg: ssh

#### SSH/INIT.SLS ends here.
