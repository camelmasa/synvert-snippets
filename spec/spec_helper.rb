$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'synvert/core'
require 'fakefs/spec_helpers'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'

  config.before do
    Synvert::Core::Configuration.instance.set :skip_files, []
    Synvert::Core::Configuration.instance.set :path, '.'
    allow_any_instance_of(Synvert::Core::Rewriter::GemSpec).to receive(:match?).and_return(true)
  end
end
