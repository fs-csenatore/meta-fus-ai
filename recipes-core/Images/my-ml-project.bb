# Copyright (C) 2023 F&S Elektronik Systeme GmbH
# Released under the GPLv3 license

inherit core-image

CONFLICT_DISTRO_FEATURES = "directfb"

IMAGE_FEATURES += " \
    tools-profile \
    package-management \
    ssh-server-openssh \
    hwcodecs \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston', \
       bb.utils.contains('DISTRO_FEATURES',     'x11', 'x11-base x11-sato', \
                                                       '', d), d)} \
"

CORE_IMAGE_EXTRA_INSTALL += " \
    packagegroup-core-full-cmdline \
    packagegroup-fsl-gstreamer1.0 \
    packagegroup-fsl-gstreamer1.0-full \
    firmwared \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'weston-xwayland xterm', '', d)} \
"

IMAGE_INSTALL += " \
    curl \
    packagegroup-imx-ml \
    tzdata \
	v4l-utils \
    ${IMAGE_INSTALL_OPENCV} \
"

IMAGE_INSTALL_OPENCV              = ""
IMAGE_INSTALL_OPENCV:imxgpu       = "${IMAGE_INSTALL_OPENCV_PKGS}"
IMAGE_INSTALL_OPENCV:mx93-nxp-bsp = "${IMAGE_INSTALL_OPENCV_PKGS}"
IMAGE_INSTALL_OPENCV_PKGS = " \
    opencv-apps \
    opencv-samples \
    python3-opencv \
"

IMAGE_OVERHEAD_FACTOR = "1.7"
IMAGE_FSTYPES:append = " ext4"
