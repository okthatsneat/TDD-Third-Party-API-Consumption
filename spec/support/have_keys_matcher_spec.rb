require 'rspec/expectations'

RSpec::Matchers.define :have_keys do |*expected|
  match do |actual|
    keys = actual.keys
    expected.all?{ |k| keys.include?(k) }
  end
end