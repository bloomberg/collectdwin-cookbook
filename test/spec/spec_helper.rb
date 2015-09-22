#
# Cookbook: CollectdWin-cookbook
#

require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'
require 'chef/sugar'
require 'chef-vault'

RSpec.configure do |config|
  # Set default platform family and version for ChefSpec.
  config.platform = 'redhat'
  config.version = '6.4'

  config.color = true
  config.alias_example_group_to :describe_recipe, type: :recipe

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  Kernel.srand config.seed
  config.order = :random

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end

def chef_vault_mock(bag, item, value)
  allow(ChefVault::Item).to receive(:load).with(bag, item).and_return(value)
end

def chef_vault_mock_for_environment(bag, item, environment, value)
  chef_vault_mock(bag, item, environment, environment => value)
end

RSpec.shared_context 'recipe tests', type: :recipe do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
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
