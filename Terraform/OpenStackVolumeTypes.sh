source ~/keystonerc_admin

openstack volume type create --public \
	--description "QOS: XYZ. $/GB/Month: $6" \
	Platinum
#openstack volume type create --public \
	#--encryption-cipher LUKS \
	#--description "QOS: XYZ. $/GB/Month: $7" \
	#Platinum-Encrypted
openstack volume type create --public \
	--description "QOS: XYZ. $/GB/Month: $4" \
	Gold
#openstack volume type create --public \
	#--encryption-cipher LUKS \
	#--description "QOS: XYZ. $/GB/Month: $5" \
	#Gold-Encrypted
openstack volume type create --public \
	--description "QOS: XYZ. $/GB/Month: $2" \
	Silver
#openstack volume type create --public \
	#--encryption-cipher LUKS \
	#--description "QOS: XYZ. $/GB/Month: $3" \
	#Silver-Encrypted
openstack volume type create --public \
	--description "QOS: XYZ. $/GB/Month: $1" \
	Bronze
