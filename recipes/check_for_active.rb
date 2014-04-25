shell_out = Mixlib::ShellOut.new('ps auxwww | grep -i terminal.app |grep -v grep')
shell_out.run_command

if shell_out.exitstatus == 0
  Chef::Log.warn "\033[31m The 'sprout-terminal' cookbook works inconsistently while Terminal is running\033[39m"
end
