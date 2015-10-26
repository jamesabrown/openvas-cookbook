#
# Installs Openvas
#

apt_repository 'openvas' do
  uri 'ppa:mrazavi/openvas'
  action :add
end


