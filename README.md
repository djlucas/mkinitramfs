mkinitcpio is a script to generate a modular initrd, taken largely from the
mkinitramfs script in BLFS. It is not yet feature complete - do not use yet.


Hooks:
  Hooks can be broken into several parts and their file extension
  determines how and when they are used within the script. Modules are
  lcated in the "$DATADIR/modules" directory.

  Input hooks drag in binaries (and their detected libraries) that
  will be included in the base image, and that do not require any
  modifications to the init script. These files havd a ".in" extension.

  Output hooks pull in other specific files, such as configuration files,
  after the base is created. These modules typically require modifications
  to the init script and have a ".out" extension.

  Standalone hooks create separate image files of their own such as
  those used for CPU microcode or a busybox rescue image. These modules
  have a ".sa" extension.


init modifications:
  Any hook can also have an associated init addition containing bash
  scriptlets, located in the "$DATADIR/init/" directory, which will be
  included in the init script.


mkinitcpio.conf:
  The mkinitcpio.conf file is the primary configuration file and contains
  four variables that control the operation of mkinitcpio.

  DATADIR: This is the root directory for the "modules" and "init" files.

  hooks: This is a list of mkinitcpio modules that will be included
  (without file extensions). The modules will be imported in the order
  they are listed. This defaults to the udev, elogind, and ucode modules. 

  firmware: This determines what firmware files are included and is
  releative to the /lib/firmware path. The special keyword "autodetect"
  will try to resolve currently used firmware from the running environment
  and is the default setting.

  modules: This detemines what kernel modules are included in the initrd
  environment. The special keyword "autodetect" will try to resolve the
  currently loaded modules from the running environment and is the
  default setting.

