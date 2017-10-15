# Ansible Java Role

## Description

This is an Ansible role to install Oracle/OpenJDK Java on several GNU/Linux systems.

## Supported Systems

- Debian
- Ubuntu
- RedHat
- CentOS
- FreeBSD

## Requirements

- **Ansible 1.9** or higher (can be easily installed via `pip`. E.g: `sudo pip install ansible==1.9.2`)
- **[Vagrant](https://www.vagrantup.com) 1.7** or higher
- `sshpass` package which is needed by Ansible if you are using SSH authentication by password. On Ubuntu/Debian: `$ sudo apt-get install sshpass`
- **Virtualbox**
- **[Oh-my-box](https://github.com/abessifi/oh-my-box)** tool, optional, if you want to quickly provision and package a Vagrant base box with **Ansible** and **Ruby** pre-installed.

## Role Variables

Available variables are listed below, along with default values:

- `java_jdk_type` - The Java Development Toolkit type should be `oracle` or `openjdk` (default: 'openjdk')
- `java_version` - The Java version to install (default: '8')
- `java_package` -  The Java JDK package name to install (default: None)
- `java_set_as_default` - If true, it sets the currently installed Java as system default version (default: false)
- `oracle_jdk_rpm_package` - The rpm package name to install oracle jdk on Redhat (default: 'jdk-8u144-linux-x64.rpm')
- `oracle_jdk_rpm_url` - The download url of the oracle jdk rpm package (default: 'http://download.oracle.com/otn-pub/java/jdk/8u144-b01/jdk-8u144-linux-x64.rpm')
- `rpm_download_directory` - The absolute path to a temporary directory where the package will be downloaded to (default: '/var/cache/yum/x86_64/7/extras/packages')

## Available tags

- **`install-java`** - Default tag to perform Java JDK installation.

# Usage

## Install OpenJDK 8 (openjdk default version)

    - hosts: localhost
      sudo: yes
      roles:
        - ansible-java

## Install Oracle JDK 8 (oracle jdk default version)

    - hosts: localhost
      sudo: yes
      roles:
        - { role: ansible-java, java_jdk_type: 'oracle' }

## Install OpenJDK 7 (on Debian and set it as default)

    - hosts: localhost
      sudo: yes
      roles:
        - role: ansible-java
          java_version: 7
          java_package: 'openjdk-7-jdk'
          java_set_as_default: true

## Install Oracle JDK 7 (on Redhat and set it as default)

    - hosts: localhost
      sudo: yes
      roles:
        - role: ansible-java
          java_jdk_type: 'oracle'
          java_version: 7
          oracle_jdk_rpm_package: 'jdk-7u79-linux-x64.rpm'
          oracle_jdk_rpm_url: 'http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm'
          java_set_as_default: true

# Development and testing

## Test with Vagrant

For quick tests, you can spinup a Debian VM using Vagrant. You maybe need to adapt the Vagrantfile to suit your environment (IP addresses, etc).

    $ vagrant up

## Run acceptance tests

Acceptance/Integration tests could be run against the role using the magic `test-kitchen` tool. All the written acceptance tests are in the **./test/integration/** directory.

The `.kitchen.yml` file discribes the testing configuration and the list of tests suite to run. By default, your instances will be converged with Ansible and run in Vagrant virtual machines.

To list the instances:

    $ kitchen list

    Instance                            Driver   Provisioner      Verifier  Transport  Last Action
    default-debian-8-x64                Vagrant  AnsiblePlaybook  Busser    Ssh        <Not Created>
    override-java-version-debian-8-x64  Vagrant  AnsiblePlaybook  Busser    Ssh        <Not Created>
    install-oracle-jdk-debian-8-x64     Vagrant  AnsiblePlaybook  Busser    Ssh        <Not Created>

To run the tests with the suite **override-java-version** on a Debian 8 platform, for instance, run the following:

    $ kitchen test override-java-version-debian-8-x64

## Author

This role was created by [Ahmed Bessifi](https://www.linkedin.com/in/abessifi), a DevOps enthusiast.
