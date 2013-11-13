if (system("ps auxwww | grep -i terminal.app |grep -v grep"))
  Chef::Log.warn "\033[31m The '#{File.basename(__FILE__)}' recipe works inconsistently while Terminal is running\033[39m"
end
