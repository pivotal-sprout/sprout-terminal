if (system("ps auxwww | grep -i terminal.app |grep -v grep"))
  Chef::Log.warn "\033[31m The 'sprout-terminal' cookbook works inconsistently while Terminal is running\033[39m"
end
