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
