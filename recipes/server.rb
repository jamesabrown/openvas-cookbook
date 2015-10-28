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

