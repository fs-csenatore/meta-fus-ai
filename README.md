# meta-fus-imx93
This is a test meta-layer for imx93 yocto-sdk

### Install with RDP-Support in weston
include following into local.conf:
```
PACKAGECONFIG:append:pn-weston = " rdp"
PACKAGECONFIG:append:pn-weston-init = " rdp"
```

Reccomended weston version is 10.0.3:
```
PREFERRED_VERSION_weston:imx-nxp-bsp = "10.0.3.imx"
```

### Helpful configs in local.conf
```
### When building with imx images ###
IMAGE_OVERHEAD_FACTOR = "1.7"
IMAGE_FSTYPES:append = " ext4"
```

## HOW to build
Go to "<yocto-dir>/sources/"
```
git clone https://github.com/fs-csenatore/meta-fus-ai.git
```
create build env
```
MACHINE=fsimx93 DISTRO=fus-imx-wayland . fus-setup-release.sh
```

edit \<yocto-dir\>/\<build-dir\>/conf/bblayer.conf. Add following line:
```
BBLAYERS += " ${BSPDIR}/sources/meta-fus-ai "
```
Please make sure that meta-imx-ml is also included.
```
BBLAYERS += "${BSPDIR}/sources/meta-imx/meta-imx-ml"
```


build image
```
bitbake python-ethosu-img
```
