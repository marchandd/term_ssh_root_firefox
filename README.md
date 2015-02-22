# marchandd/term_ssh_root_firefox

marchandd/term_ssh_root_firefox [Docker:copyright:](https://docs.docker.com/ "Docker") image

## Description

A sandbox container with last version of Mozilla Firefox ready to use from Linux or Windows host.

### Goal

Easy method to produce a light GUI containers to access to Firefox into sandbox from secured host to remote client with SSH.

### Image size

Around 500 Mb.

### References

[Marchand D. Maintainer](https://github.com/marchandd/ "Maintainer")

[Details source](https://github.com/marchandd/term_ssh_root_firefox/ "Details")

[Part of project studies](https://github.com/marchandd/docker_index/ "References")

## Build image

### Command line

:computer: `docker pull marchandd/term_ssh_root_firefox > build.log`

### Command line explanation

Search password value into build.log file to access later to container.

### Firewall

:warning: If your Firewall is enabled on the host, with default outgoing policy turned to 
deny, 
you will have to disable 22 port filtering:  
- Make a new rule for OpenSSH (22/TCP) to enable outgoing policy.

## Build container

### Command line

:computer: `docker run -d -p XXX.XXX.XXX.XXX:YYYYY:22 marchandd/term_ssh_root_firefox`

Where XXX.XXX.XXX.XXX is your IP v4 address.  
Where YYYYY is your Private port, if you doesn't know free port, try from 49200...

### Command line explanation

- Run in detached mode.
- Export port 22.

## Container usage

### SSH access

Open terminal with root/administrator account.

:computer: `ssh -X root@XXX.XXX.XXX.XXX -p YYYYY`

### Alias

When you are into SSH access.

:computer: `firefox`

## Explanations

### Dockerfile

- Make dynamic root password and display it into logs.
- Change config for SSH daemon.
- Give Supervisor management for OpenSSH server.
- Expose SSH port.

### Display

Make sure to have installed OpenSSH client or SSH GUI client (Putty).

### Risks

Root account from container is exposed.  
A password is used and not a certificate that could be more secure.
 
## Linux test environment remote client

### SSH client terminal

- KUbuntu (14.10)
- Docker (1.4.1)
- ssh  
  Address -X root@IPv4 -p PORT

## Windows test environment remote client

### SSH client GUI

:warning: Make sure X11 forwarding is enabled into SSH/X11 Configuration.

- Windows (7 & 8.1)
- Boot2Docker (1.4.1)
- VirtualBox (4.3.20)
- MsysGit (1.9.4)
- PuTTY (0.64)  
  Address Boot2Docker_IPv4:PORT

Remark:  
Docker is accessing on Windows only through VirtualBox network interface. 
So, using 127.0.0.1 is not possible...  
- You must choose Boot2Docker_IPv4 remained at boot start into the dedicated console.
