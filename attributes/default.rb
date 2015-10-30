#
# Cookbook: CollectdWin-cookbook
#

default['collectdwin']['service']['name']           = 'CollectdWinService'
default['collectdwin']['service']['cfg_dir']        = File.join("#{ENV['ProgramW6432']}",'Bloomberg LP','CollectdWin','config')
default['collectdwin']['service']['package_source'] = File.join('c:', 'scratch','collectdwin-x64.msi')

default['collectdwin']['plugins']['collectd_win_config']['general_settings']['attr']['interval']    =  30
default['collectdwin']['plugins']['collectd_win_config']['general_settings']['attr']['timeout']     =  120
default['collectdwin']['plugins']['collectd_win_config']['general_settings']['attr']['store_rates'] =  false
default['collectdwin']['plugins']['collectd_win_config']['plugins']                                 =
  [
    { 'plugin' => { 'attr' => { 'name' => 'Statsd', 'class' => 'BloombergFLP.CollectdWin.StatsdPlugin', 'enable' => true } } },
    { 'plugin' => { 'attr' => { 'name' => 'WindowsPerformanceCounter', 'class' => 'BloombergFLP.CollectdWin.WindowsPerformanceCounterPlugin', 'enable' => true } } },
    { 'plugin' => { 'attr' => { 'name' => 'Amqp', 'class' => 'BloombergFLP.CollectdWin.AmqpPlugin', 'enable' => false } } },
    { 'plugin' => { 'attr' => { 'name' => 'WriteHttp', 'class' => 'BloombergFLP.CollectdWin.WriteHttpPlugin', 'enable' => false } } },
    { 'plugin' => { 'attr' => { 'name' => 'Console', 'class' => 'BloombergFLP.CollectdWin.ConsolePlugin', 'enable' => true } } }
  ]

default['collectdwin']['plugins']['amqp']['publish']['attr']['name']               =  'testAmqpPublisher1'
default['collectdwin']['plugins']['amqp']['publish']['attr']['host']               =  'testHost1'
default['collectdwin']['plugins']['amqp']['publish']['attr']['port']               =  8090
default['collectdwin']['plugins']['amqp']['publish']['attr']['virtual_host']       =  'collectd.vhost1'
default['collectdwin']['plugins']['amqp']['publish']['attr']['user']               =  'collectd.user1'
default['collectdwin']['plugins']['amqp']['publish']['attr']['password']           =  'collectd.password1'
default['collectdwin']['plugins']['amqp']['publish']['attr']['exchange']           =  'collectd.exchange1'
default['collectdwin']['plugins']['amqp']['publish']['attr']['routing_key_prefix'] =  'collectd.keyPrefix1'

default['collectdwin']['plugins']['write_http']['nodes']                           = 
  [
    'node' => {
      'attr' => { 'name' => 'testNode', 'url' => 'http://localhost:8787/testhttp1', 'timeout' => 10_000, 'batch_size' => 15, 'max_idle_time' => 700_000 },
      'proxy' => { 'attr' => { 'enable' => false, 'url' => 'http://dummy.url.com' } }
    }
  ]

default['collectdwin']['plugins']['statsd']['server']['attr']['host']              = 'localhost'
default['collectdwin']['plugins']['statsd']['server']['attr']['port']              = 8125
default['collectdwin']['plugins']['statsd']['delete_cache']['attr']['counters']    = true
default['collectdwin']['plugins']['statsd']['delete_cache']['attr']['timers']      = true
default['collectdwin']['plugins']['statsd']['delete_cache']['attr']['gauges']      = true
default['collectdwin']['plugins']['statsd']['delete_cache']['attr']['sets']        = true
default['collectdwin']['plugins']['statsd']['timer']['attr']['lower']              = true
default['collectdwin']['plugins']['statsd']['timer']['attr']['upper']              = true
default['collectdwin']['plugins']['statsd']['timer']['attr']['sum']                = true
default['collectdwin']['plugins']['statsd']['timer']['attr']['count']              = true
default['collectdwin']['plugins']['statsd']['timer']['percentiles']                = 
  [
    { 'percentile' => { 'attr' => { 'value' => 90.0 } } },
    { 'percentile' => { 'attr' => { 'value' => 95.0 } } }
  ]

default['collectdwin']['plugins']['windows_performance_counter']['reload_configuration']['attr']['Enable'] = true
default['collectdwin']['plugins']['windows_performance_counter']['reload_configuration']['attr']['Interval'] = 1200
default['collectdwin']['plugins']['windows_performance_counter']['counters']       = 
  [
    { 'counter' => { 'attr' => { 'category' => 'Processor', 'name' => '% Processor Time',  'instance' => '_Total', 'collectd_plugin' => 'cpu', 'collectd_plugin_instance' => 'cpu-average', 'collectd_type' => 'cpu', 'collectd_type_instance' => 'processor' } } },
    { 'counter' => { 'attr' => { 'category' => 'Processor', 'name' => '% Idle Time',       'instance' => '_Total', 'collectd_plugin' => 'cpu', 'collectd_plugin_instance' => 'cpu-average', 'collectd_type' => 'cpu', 'collectd_type_instance' => 'idle' } } },
    { 'counter' => { 'attr' => { 'category' => 'Processor', 'name' => '% Privileged Time', 'instance' => '_Total', 'collectd_plugin' => 'cpu', 'collectd_plugin_instance' => 'cpu-average', 'collectd_type' => 'cpu', 'collectd_type_instance' => 'system' } } },
    { 'counter' => { 'attr' => { 'category' => 'Processor', 'name' => '% User Time',       'instance' => '_Total', 'collectd_plugin' => 'cpu', 'collectd_plugin_instance' => 'cpu-average', 'collectd_type' => 'cpu', 'collectd_type_instance' => 'user' } } },
    { 'counter' => { 'attr' => { 'category' => 'Processor', 'name' => '% Interrupt Time',  'instance' => '_Total', 'collectd_plugin' => 'cpu', 'collectd_plugin_instance' => 'cpu-average', 'collectd_type' => 'cpu', 'collectd_type_instance' => 'interrupt' } } },

    { 'counter' => { 'attr' => { 'category' => 'Memory', 'name' => 'Available Bytes',           'collectd_plugin' => 'memory', 'collectd_plugin_instance' => '', 'collectd_type' => 'memory', 'collectd_type_instance' => 'free' } } },
    { 'counter' => { 'attr' => { 'category' => 'Memory', 'name' => 'Page Faults/sec',           'collectd_plugin' => 'memory', 'collectd_plugin_instance' => '', 'collectd_type' => 'memory', 'collectd_type_instance' => 'faults_per_sec' } } },
    { 'counter' => { 'attr' => { 'category' => 'Memory', 'name' => '% Committed Bytes In Use',  'collectd_plugin' => 'memory', 'collectd_plugin_instance' => '', 'collectd_type' => 'memory', 'collectd_type_instance' => 'percent_committed_inuse' } } },

    { 'counter' => { 'attr' => { 'category' => 'Paging File', 'name' => '% Usage', 'instance' => '_Total', 'collectd_plugin' => 'swap', 'collectd_plugin_instance' => '', 'collectd_type' => 'swap', 'collectd_type_instance' => 'percent_used' } } },

    { 'counter' => { 'attr' => { 'category' => 'System', 'name' => 'System Up Time',    'collectd_plugin' => 'uptime', 'collectd_plugin_instance' => '', 'collectd_type' => 'uptime', 'collectd_type_instance' => '' } } },
    { 'counter' => { 'attr' => { 'category' => 'System', 'name' => 'System Calls/sec',  'collectd_plugin' => 'system', 'collectd_plugin_instance' => '', 'collectd_type' => 'gauge',  'collectd_type_instance' => 'sys_calls_per_sec' } } },

    { 'counter' => { 'attr' => { 'category' => 'System', 'name' => 'File Data Operations/sec',   'collectd_plugin' => 'io', 'collectd_plugin_instance' => '', 'collectd_type' => 'gauge',  'collectd_type_instance' => 'file_ops_per_sec' } } },
    { 'counter' => { 'attr' => { 'category' => 'System', 'name' => 'File Read Operations/sec',   'collectd_plugin' => 'io', 'collectd_plugin_instance' => '', 'collectd_type' => 'gauge',  'collectd_type_instance' => 'file_read_ops_per_sec' } } },
    { 'counter' => { 'attr' => { 'category' => 'System', 'name' => 'File Write Operations/sec',  'collectd_plugin' => 'io', 'collectd_plugin_instance' => '', 'collectd_type' => 'gauge',  'collectd_type_instance' => 'file_write_ops_per_sec' } } },
    # Convert Megabytes to Bytes using ScaleUpFactor = 1024 * 1024 = 1048576
    { 'counter' => { 'attr' => { 'category' => 'LogicalDisk', 'name' => '% Free Space', 'instance' => '*', 'collectd_plugin' => 'df', 'collectd_plugin_instance' => '', 'collectd_type' => 'percent_bytes', 'collectd_type_instance' => 'free' } } },
    { 'counter' => { 'attr' => { 'category' => 'LogicalDisk', 'name' => 'Free Megabytes', 'instance' => '*', 'scale_up_factor' => 1_048_576, 'collectd_plugin' => 'df', 'collectd_plugin_instance' => '', 'collectd_type' => 'df_complex', 'collectd_type_instance' => 'free' } } },

    { 'counter' => { 'attr' => { 'category' => 'Process', 'name' => 'Handle Count', 'instance' => '_Total', 'collectd_plugin' => 'processes', 'collectd_plugin_instance' => '', 'collectd_type' => 'gauge', 'collectd_type_instance' => 'handles' } } },

    { 'counter' => { 'attr' => { 'category' => 'Network Interface', 'name' => 'Packets Received/Sec,Packets Sent/Sec',               'instance' => '*', 'collectd_plugin' => 'interface', 'collectd_plugin_instance' => '', 'collectd_type' => 'if_packets',  'collectd_type_instance' => '' } } },
    { 'counter' => { 'attr' => { 'category' => 'Network Interface', 'name' => 'Bytes Received/Sec,Bytes Sent/Sec',                   'instance' => '*', 'collectd_plugin' => 'interface', 'collectd_plugin_instance' => '', 'collectd_type' => 'if_octets',   'collectd_type_instance' => '' } } },
    { 'counter' => { 'attr' => { 'category' => 'Network Interface', 'name' => 'Packets Received Errors,Packets Outbound Errors',     'instance' => '*', 'collectd_plugin' => 'interface', 'collectd_plugin_instance' => '', 'collectd_type' => 'if_errors',   'collectd_type_instance' => '' } } }
  ]

# ----------------------------------------------------------------------------
# Copyright (C) 2015 Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------- END-OF-FILE ----------------------------------
