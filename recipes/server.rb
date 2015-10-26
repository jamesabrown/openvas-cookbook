#
# Installs Openvas
#

apt_repository 'openvas' do
  uri 'ppa:mrazavi/openvas'
  distribution 'trusty'
  action :add
end

apt_package 'openvas' do
  action :install
end

apt_package 'sqlite3' do
  action :install
end

execute 'openvas-nvt-sync' do
  command '/usr/sbin/openvas-nvt-sync'
end

execute 'openvas-scapdata-sync' do
  command '/usr/sbin/openvas-scapdata-sync'
end

execute 'openvas-certdata-sync' do
  command '/usr/sbin/openvas-certdata-sync'
end

service 'openvas-scanner' do
  action :restart
end

service 'openvas-manager' do
  action :restart
end

