<h1>mkinitcpio</h1>

<b>mkinitcpio</b> is a script to generate a modular initrd, taken largely from the
mkinitramfs script in BLFS. It is not yet feature complete - do not use yet.

<h2>Hooks:</h2>
  Hooks can be broken into several parts and their file extension
  determines how and when they are used within the script. Modules are
  lcated in the "$DATADIR/modules" directory.

  <b>Input hooks</b> drag in binaries (and their needed shared libraries) that
  will be included in the base image, but do not require any
  modifications to the init script. These hooks have a ".in" extension.

  <b>Output hooks</b> pull in other specific files, such as configuration and
  data files, after the base is created. These hooks typically also
  require an associated init modification and have a ".out" extension.

  <b>Standalone hooks</b> create separate image files of their own such as
  those used for CPU microcode or a busybox rescue image. These hooks
  have a ".sa" extension.


<h2>init modifications:</h2>
  Any hook can also have an associated init addition containing bash
  scriptlets, located in the "$DATADIR/init/" directory, which will be
  included in the init script. These scriptlets should match the name
  of the associated hook and have a ".init" extension.


<h2>mkinitcpio.conf:</h2>
  The mkinitcpio.conf file is the primary configuration file and contains
  four variables that control the operation of mkinitcpio.

  <b>DATADIR</b>: This is the root directory for the "modules" and "init" files.

  <b>hooks</b>: This is a list of mkinitcpio hooks that will be included
  (without file extensions). The hooks will be imported in the order they
  are listed. This defaults to the udev, elogind, kmods, and ucode modules. 

  <b>firmware</b>: This determines what firmware files are included and is
  releative to the /lib/firmware path. The special keyword "autodetect"
  will try to resolve currently used firmware from the running environment
  and is the default setting.

  <b>modules</b>: This detemines what kernel modules are included in the initrd
  environment. The special keyword "autodetect" will try to resolve the
  currently loaded modules from the running environment and is the
  default setting.

