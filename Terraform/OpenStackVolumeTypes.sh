source ~/keystonerc_admin

openstack volume type create --public \
	--description "Min: 1000 IOPs, Max: 5000 IOPs, Burst: 10000 IOPs" \
	Platinum
openstack volume type create --public \
	--description "Min: 500 IOPs, Max: 2500 IOPs, Burst: 5000 IOPs" \
	Gold
cinder encryption-type-create Gold LUKS
openstack volume type create --public \
	--description "Min: 100 IOPs, Max: 500 IOPs, Burst: 1000 IOPs" \
	Silver
openstack volume type create --public \
	--description "Min: 0 IOPs, Max: 100 IOPs, Burst: 500 IOPs" \
	Bronze
