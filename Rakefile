# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: [:spec]

desc 'Run the specs.'
RSpec::Core::RakeTask.new do |t|
  t.pattern = '*_spec.rb'
end
