require 'unit/spec_helper'

describe 'sprout-terminal::set_profile' do
  let(:chef_run) { ChefSpec::Runner.new }
  let(:domain) { 'com.apple.Terminal' }

  before do
    Mixlib::ShellOut.stub(:new).with(/ps auxwww/).and_return(double('shellout', run_command: nil, exitstatus: 1))
    chef_run.node.set['sprout']['terminal']['default_profile'] = 'Foo'
    chef_run.converge(described_recipe)
  end

  it 'warns if terminal is running' do
    expect(chef_run).to include_recipe('sprout-terminal::check_for_active')
  end

  it 'updates the default profile' do
    expect(chef_run).to write_osx_defaults(domain, 'Default Window Settings').with_string('Foo')
  end

  it 'updates the startup profile' do
    startupmatcher = ChefSpec::Matchers::ResourceMatcher.new(:osx_defaults, :write, /startup/)
    expect(chef_run).to startupmatcher.with(key: 'Startup Window Settings', string: 'Foo')
  end
end
