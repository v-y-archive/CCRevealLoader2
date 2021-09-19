## CCRevealLoader 2 Tweak

**Now supports Reveal 32+**

CCRevealLoader dynamically loads RevealServer.framework  (Reveal.app support) into iOS apps on jailbroken devices. Configuration is via the CCRevealLoader menu in Settings.app

Reveal is an OS X application that allows you to remotely introspect a running applications view hierarchy and edit various view properties. 

Generally you have to include their debugging framework in your application at build time in-order to perform debugging actions, however with this tweak installed this is no longer necessary. 

For more info see [revealapp.com](http://revealapp.com)


## Build Requirements

- Theos
- Reveal.app installed
- libimobiledevice (iproxy)
- ldid

## Install tweak

If you have multiple devices then run:

```
make package install udid=D371c31D...
```

Else simply run:

```
make package install
```

If password requested, try `alpine`


## How to Use
Open 'Settings > CCRevealLoader > Enabled Applications' and toggle the application or applications that you want to debug to on.

Launch the target application and it should appear inside Reveal.app on your Mac. 

(You will likely need to quit and relaunch the target application)
