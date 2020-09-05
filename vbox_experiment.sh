VM="${1:-MSEdge - Win10}"

VBoxManage controlvm "$VM" poweroff

sleep 3

VBoxManage modifyvm "$VM" --natdnsproxy1 off
VBoxManage modifyvm "$VM" --natdnshostresolver1 on

VBoxManage setextradata "$VM" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/host_webservice/HostIP" "10.0.2.2"
VBoxManage setextradata "$VM" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/host_webservice/HostNamePattern" "github.localhost|*.github.localhost"

VBoxManage modifyvm "$VM" --cpus 2 --memory 2048 --vram 256 --accelerate3d on --accelerate2dvideo on

VBoxManage snapshot "$VM" take "Extra goodies"

VBoxManage startvm "$VM"
VBoxManage --nologo guestcontrol "$VM" --username IEUser --password 'Passw0rd!' start cmd.exe -- '/c' start "microsoft-edge:http://github.localhost"
