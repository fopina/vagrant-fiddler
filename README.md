Vagrant VM with a ready-to-use [Fiddler](http://www.telerik.com/fiddler) installation using [joepurdy's](https://github.com/joepurdy/Vagrantfiles/) modifed modern.ie box.

HowTo
=====

Clone the repo then run `vagrant up` and wait!

```
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
(...)
==> default: Fiddler2 machine is now running!
==> default: Configure your devices to use this host machine's IP/name with port 8888 as an HTTP/HTTPS proxy
==> default: After you set up the device with the proxy, you can access http://my.fiddler to install Fiddler root certificate
```

VBox GUI should have popup with Fiddler window open and host port 8888 is being forwarded to Fiddler.
