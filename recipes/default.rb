#
# Cookbook: CollectdWin-cookbook
#
# Copyright (c) 2015 Bloommberg L.P., All Rights Reserved.
#

windows_package 'CollectdWinService' do
  action :install
  source 'C:\github\bloomberg\collectdwin\src\installer\bin\x64\Debug\CollectdWin-x64.msi'
end