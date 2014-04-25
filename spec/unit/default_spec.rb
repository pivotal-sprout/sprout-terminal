require 'unit/spec_helper'

describe 'sprout-terminal::default' do
  let(:chef_run) { ChefSpec::Runner.new }
  before do
    Mixlib::ShellOut.stub(:new).with(/ps auxwww/).and_return(double('shellout', run_command: nil, exitstatus: 1))
    chef_run.converge(described_recipe)
  end

  it 'sets terminal profile' do
    expect(chef_run).to include_recipe('sprout-terminal::set_profile')
  end

  it 'closes windows when the shell exits cleanly' do
    expect(chef_run).to include_recipe('sprout-terminal::close_window_on_exit')
  end

  it 'reloads all preferences since terminal is likely being used to run this cookbook' do
    expect(chef_run).to include_recipe('sprout-terminal::reload')
  end
end
