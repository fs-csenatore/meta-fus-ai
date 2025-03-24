FILESEXTRAPATHS:prepend := "${THISDIR}/linux-fus:"

SRC_URI:append = " \
	file://0001-add-support-for-NXP-RPI-CAM.patch \
	file://0002-WORKAROUND-do-not-return-in-IOCTRL-VIDEOC_STREAMON.patch \
"
