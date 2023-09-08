do_install:append() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'rdp', 'yes', 'no', d)}" = "yes" ]; then
		# Select rdp-backend
		#Note: When --modules=systemd-notify.so is not set by another bbappend,
		#then we have to change Type=simple

		sed -i -e "s|^ExecStart=/usr/bin/weston .* |ExecStart=/usr/bin/weston --log=\$\{XDG_RUNTIME_DIR\}/weston.log --backend=rdp-backend.so --rdp-tls-cert=/etc/freerdp/keys/server.crt --rdp-tls-key=/etc/freerdp/keys/server.key |" ${D}${systemd_system_unitdir}/weston.service

		#Improve weston.service to run with RDP-Backend
		#In some cases, weston will crash, while connecting to remote desktop.
		#Therefore we ensure that weston automativally restarts after crash
		sed -i -e "/^\[Service\]/a RestartSec=5" ${D}${systemd_system_unitdir}/weston.service
		sed -i -e "/^\[Service\]/a Restart=on-failure" ${D}${systemd_system_unitdir}/weston.service
		#sed -i -e "s|Type=.*|Type=simple|" ${D}${systemd_system_unitdir}/weston.service
		sed -i -e "s|^#start-on-startup|start-on-startup|" ${D}${sysconfdir}/xdg/weston/weston.ini
    fi
}

pkg_postinst_ontarget:${PN}() {

#create rdp certificates when freerdp is installed
if test -f "/usr/bin/winpr-makecert"; then
	mkdir -p /etc/freerdp/keys/
	winpr-makecert -rdp -n server -path /etc/freerdp/keys/
fi
}

