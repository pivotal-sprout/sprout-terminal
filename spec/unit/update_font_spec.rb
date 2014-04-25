require 'unit/spec_helper'

describe 'sprout-terminal::update_font' do
  let(:chef_run) { ChefSpec::Runner.new }
  let(:file) { '/home/fauxhai/Library/Preferences/com.apple.Terminal.plist' }
  let(:plist_cmd) { '/usr/libexec/PlistBuddy -c' }
  let(:font_path) { '/var/chef/cache/customFont.bin' }

  before do
    Mixlib::ShellOut.stub(:new).with(/ps auxwww/).and_return(double('shellout', run_command: nil, exitstatus: 1))
    chef_run.node.set['sprout']['terminal']['default_profile'] = 'Foo'
    chef_run.node.set['sprout']['terminal']['font_src'] = 'http://example.com/someFont.ttf'
    chef_run.converge(described_recipe)
  end

  it 'warns if terminal is running' do
    expect(chef_run).to include_recipe('sprout-terminal::check_for_active')
  end

  it 'downloads a font file to install in the terminal app' do
    expect(chef_run).to create_remote_file(font_path).with(
      source: 'http://example.com/someFont.ttf',
      owner: 'fauxhai'
    )
  end

  it 'installs the font for the default profile' do
    command = %Q(#{plist_cmd} 'import :Window\\ Settings:Foo:Font #{font_path}' #{file})
    expect(chef_run).to run_execute(command).with_user('fauxhai')
  end

  it 'turns on font antialiasing' do
    command = %Q(#{plist_cmd} 'set :Window\\ Settings:Foo:FontAntialias true' #{file})
    expect(chef_run).to run_execute(command).with_user('fauxhai')
  end
end
