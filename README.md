# Personal Cloud

Ansible playbooks to deploy docker infrastructure on my personal virtual
private server as well as some apps I use and develop.

This is a personal project, not intended to be reused. Feel free to copy
snippets you find useful though.

Below is a cheat-sheet for myself on what do I have and how things are done,
after I revisit the project after a year.


## Common actions

### Starting and accessing virtual server

```sh
$ cd vagrant
$ vagrant up
$ vagrant ssh
virtual:~$ sudo docker ps
```

### Setting up environment

Before you run any playbooks, you need a shell with some environment variables set. To load them, typically you do:

```sh
$ . .env
```

In case this file is lost, copy `sample.env` to `.env` and correct the variable
values.

### Typical ansible tasks

* Ping all hosts
    ```sh
    $ ansible all -m ping
    ```

* Set up services on single host:

    ```sh
    $ ansible-playbook -l virtual playbook-soaring-coupons.yaml
    ```

* Edit ansible vault (where all the secrets go)

    ```sh
    $ ansible-vault edit vars/fluent_vault.yaml
    ```

### Docker

* Shell into running container:

    ```sh
    $ docker exec -it fluentd sh
    ```

### Dokku

Dokku hosts various apps and databases.

* List apps:

    ```
    $ dokku apps:list
    ```

* Connect to running app container:

    ```sh
    $ dokku enter soaring-coupons
    ```

### Fluentd

Fluentd collects and forwards logs to aggregators. Currently these are used:

* https://kedder.loggly.com/

### Openvario

Static file hosting for openvario opkg repo. Files are hosted from `/home/openvario/www` dir and available through http://openvario.lebedev.lt/.

## Other related services

* https://app.freshping.io/ - ping monitoring
* https://www.vhost.lt/ - domain hosting and DNS management
* https://klientams.iv.lt/ - virtual server hosting
