# openssh-formula

This Salt state formula for the [OpenSSH](https://openssh.com/)
utility suite, a connectivity tool for remote login with the SSH
protocol that encrypts all traffic to eliminate eavesdropping,
connection hijacking, and other attacks.  In addition, OpenSSH
provides a large suite of secure tunneling capabilities, several
authentication methods, and sophisticated configuration options.  This
formula applies the configuration recommendations described in [Secure
Secure Shell](https://stribika.github.io/2015/01/04/secure-secure-shell.html).

## Available States

* **ssh**

  Installs and configures the OpenSSH client, including ssh, sftp, and
  scp.

* **sshd**

  Installs, configures, and starts the OpenSSH server, sshd.

## Configuration

No configuration is required; however, additional settings and more
complicated configurations are possible; for examples refer
to [pillar.example](pillar.example).
