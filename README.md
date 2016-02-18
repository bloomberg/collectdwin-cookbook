# collectdwin-cookbook
[![License](https://img.shields.io/badge/license-Apache_2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

[Application cookbook][0] which installs and configures the
[CollectdWin monitoring service][1].

This cookbook provides a simple installation and configuration of
the CollectdWin monitoring service. CollectdWin is a Windows only service, so this cookbook supports only Windows platform.

## Usage
The [default recipe](recipes/default.rb) in this cookbook simply
configures the monitoring service to run as a windows service. The
configuration for this service can be tuned using the
[node attributes](attributes/default.rb). 

You're required to write a [wrapper cookbook][2] which overrides the default properties. For example if you want to override write_http plugin configuration, you can do the following:
```ruby
node.default['collectdwin']['plugins']['write_http']['nodes'] =
  [
    'node' => {
      'attr' => { 
        'name' => 'myHttpServer', 
        'url' => 'http://myhttpserver.xyz.com:8787/testhttp1', 
        'timeout' => 20000, 
        'batch_size' => 25, 
        'max_idle_time' => 800000 
        },
      'proxy' => { 
        'attr' => { 
            'enable' => false, 
            'url' => 'http://dummy.url.com' 
            } 
        }
    }
  ]
include_recipe 'collectdwin::default'
```

[0]: http://blog.vialstudios.com/the-environment-cookbook-pattern#theapplicationcookbook
[1]: https://github.com/bloomberg/collectdwin/wiki 
[2]: http://blog.vialstudios.com/the-environment-cookbook-pattern/#thewrappercookbook