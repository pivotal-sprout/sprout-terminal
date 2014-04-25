require 'unit/spec_helper'

describe 'sprout-terminal::close_window_on_exit' do
  let(:chef_run) { ChefSpec::Runner.new }
  let(:key) { %Q(:Window\\ Settings:Foo:shellExitAction) }
  let(:file) { '/home/fauxhai/Library/Preferences/com.apple.Terminal.plist' }
  let(:plist_cmd) { '/usr/libexec/PlistBuddy -c' }
  let(:add_command) { %Q(#{plist_cmd} 'add #{key} integer 1' #{file}) }
  let(:set_command) { %Q(#{plist_cmd} 'set #{key} 1' #{file}) }

  before do
    Mixlib::ShellOut.stub(:new).with(/ps auxwww/).and_return(double('shellout', run_command: nil, exitstatus: 1))
    chef_run.node.set['sprout']['terminal']['default_profile'] = 'Foo'
    chef_run.converge(described_recipe)
  end

  it 'warns if terminal is running' do
    expect(chef_run).to include_recipe('sprout-terminal::check_for_active')
  end

  it 'closes the window when shell exits cleanly' do
    expect(chef_run).to run_execute(add_command).with(
      user: 'fauxhai',
      ignore_failure: true
    )

    expect(chef_run).to run_execute(set_command).with(
      user: 'fauxhai',
      ignore_failure: true
    )
  end
end
