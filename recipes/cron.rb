#
# Setup cron for OpenVas
#
cron 'openvas-sync' do
  hour '9'
  minute '0'
  command "sudo openvas-nvt-sync"
end

cron 'openvas-scap' do
  hour '9'
  minute '15'
  command "sudo openvas-scapdata-sync"
end

cron 'openvas-cert' do
  hour '9'
  minute '30'
  command "sudo openvas-certdata-sync"
end

cron 'openvas-rebuild' do
  hour '9'
  minute '45'
  command "sudo openvascmd --rebuild --progress"
end
