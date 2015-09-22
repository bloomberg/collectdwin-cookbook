#
# Cookbook: CollectdWin-cookbook
#

guard 'foodcritic', cookbook_paths: '.', cli: '-t ~FC023 -t ~FC005', all_on_start: false do
  watch(%r{^(?:recipes|libraries|providers|resources)/.+\.rb$})
  watch('metadata.rb')
end

# More info at https://github.com/guard/guard#readme
guard 'rubocop' do
  watch(%r{^attributes/.+\.rb$})
  watch(%r{^providers/.+\.rb$})
  watch(%r{^recipes/.+\.rb$})
  watch(%r{^resources/.+\.rb$})
  watch(%r{^libraries/.+\.rb$})
  watch('metadata.rb')
end

guard :rspec, :cmd => 'chef exec /opt/chefdk/embedded/bin/rspec', all_on_start: false, notification: false do
  watch(%r{^(recipes|libraries|providers|resources)/(.+)\.rb$}) do |m|
    "test/spec/#{m[0]}/#{m[1]}_spec.rb"
  end
  watch('test/spec/spec_helper.rb')      { 'test/spec' }
end

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
