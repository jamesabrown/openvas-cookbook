#
# openvas-cookbook::server
#
require_relative 'spec_helper'

describe 'openvas-cookbook::server' do
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

it 'adds openvas repo' do
  expect(chef_run).to add_apt_repository('openvas')
end

end