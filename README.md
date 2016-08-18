# iphone_opensshfsw

Simple switch using [flipswitch library](https://github.com/a3tweaks/Flipswitch) to turn on/off *OPENSSH* in iphone.

## Building and packing

To build and pack it's necessary to have [Theos]() installed and configured in your machine.

After that, just run: `make package` and theos will compile, link, and pack everything into a *debian package*.

## Installing

There is a version already packed and ready to be used inside *./opensshfsw/debs/*, but it's necessary to check if all dependencies are installed on the phone.


If all dependencies are satisfied, just copy the *.deb* package into the phone and install is as root.

Copying using terminal: `scp opensshfsw.deb root@phone_ip:/phone_dest_folder`

Installing: `root# dpkg -i openssfsw.deb`

### Dependencies

cydia:

* openssh
* mobilesubstrate
* com.a3tweaks.flipswitch

apt-get:

* sudo

### After install

It's necessary to add the following lines in the sudoers file:

```
mobile ALL=(root) NOPASSWD: /usr/sbin/sshd
mobile ALL=(root) NOPASSWD: /usr/bin/killall
```

Now just **respring** the phone and it's done.

## TODO

* ???
