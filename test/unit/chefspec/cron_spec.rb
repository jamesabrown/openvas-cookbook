#
# openvas-cookbook::cron
#
require_relative 'spec_helper'

describe 'openvas-cookbook::cron' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      env = Chef::Environment.new
      env.name 'test'

      Chef::Config[:encrypted_data_bag_secret]                  = 'test/data/secret.txt'
      node.set['app']['secrets_key_path']                       = 'test/data/secret.txt'
      node.set['app']['encrypted_data_bag']                     = 'app-test'

      allow(node).to receive(:chef_environment).and_return(env.name)
      allow(Chef::Environment).to receive(:load).and_return(env)
    end.converge(described_recipe)
  end

it 'create openvas sync' do
  expect(chef_run).to create_cron('openvas-sync').with(
    minute: '0',
    hour:   '9',
    command: "sudo openvas-nvt-sync"
  )
end

it 'create openvas scap' do
  expect(chef_run).to create_cron('openvas-scap').with(
    minute: '15',
    hour:   '9',
    command: "sudo openvas-scapdata-sync"
  )
end

it 'create openvas cert' do
  expect(chef_run).to create_cron('openvas-cert').with(
    minute: '30',
    hour:   '9',
    command: "sudo openvas-certdata-sync"
  )
end

it 'create rebuild' do
  expect(chef_run).to create_cron('openvas-rebuild').with(
    minute: '45',
    hour:   '9',
    command: "sudo openvasmd --rebuild --progress"
  )
end

end
