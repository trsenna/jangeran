Jangeran
========

Easily vagrant up the latest ubuntu (Interim Releases) machine.


Included Software
-----------------

- Ubuntu 18.04
- Git
- PHP 7.2
- Apache
- MySQL
- Sqlite3
- PostgreSQL
- Composer
- Node
- MailHog
- mhsendmail
- Oh My ZSH!


Accessing Globally
------------------

Sometimes you may want to `vagrant up` your Jangeran machine from anywhere on your filesystem. You can do this on Mac / Linux systems by adding a Bash function to your Bash profile. Here goes a nice sample:

```bash
jangeran() {
  if [ "destroy" == $1 ];
  then
    echo "Sorry, the '$1' command is not encouraged!"
    return 1
  fi

  ( cd /opt/vagrant-local/jangeran && vagrant $* )
}
```

Make sure to tweak the `/opt/vagrant-local/jangeran` path in the function to the location of your actual Jangeran installation. Once the function is installed, you may run commands like `jangeran up` or `jangeran ssh` from anywhere on your system.


The Hosts File
--------------

You must add the "domains" for your sites to the `hosts` file on your machine. The `hosts` file will redirect requests for your sites into your Jangeran machine. On Mac and Linux, this file is located at `/etc/hosts`. The lines you add to this file will look like the following:

~~~
192.168.28.10 jangeran.local
~~~
