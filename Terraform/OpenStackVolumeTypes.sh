source ~/keystonerc_admin

openstack volume type create --public \
	--description "Min: 1000 IOPS, Max: 5000 IOPS, Burst: 10000 IOPS $10/GB/month" \
	Platinum
openstack volume type create --public \
	--description "Min: 500 IOPS, Max: 2500 IOPS, Burst: 5000 IOPS $5/GB/month" \
	Gold
cinder encryption-type-create Gold LUKS
openstack volume type create --public \
	--description "Min: 100 IOPS, Max: 500 IOPS, Burst: 1000 IOPS $3/GB/month" \
	Silver
openstack volume type create --public \
	--description "Min: 0 IOPS, Max: 100 IOPS, Burst: 500 IOPS $1/GB/month" \
	Bronze
