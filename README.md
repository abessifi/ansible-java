# Ansible Java

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
- `java_version` - The Java version to install (default: '7')
- `java_packages` -  The list of Java JDK package(s) to install (default: [])
- `java_set_as_default` - If true, it sets the currently installed Java as system default version (default: false)

# Usage

## Example Playbook (using default package, usually OpenJDK 7)

    - hosts: localhost
      roles:
        - ansible-java

## Example Playbook (install Oracle JDK 7)

    - hosts: localhost
      roles:
        - { role: ansible-java, java_jdk_type: 'oracle' }

## Example Playbook (install OpenJDK 8 on Debian and set it as default)

    - hosts: localhost
      roles:
        - { role: ansible-java, java_version: '8', java_packages: ['openjdk-8-jdk'], java_set_as_default: true }

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

To run the tests with the suite **override-java-version** for instance, run the following:

    $ kitchen test override-java-version-debian-8-x64

## Author

This role was created by [Ahmed Bessifi](https://www.linkedin.com/in/abessifi), a DevOps enthusiast.
