require 'rspec/expectations'

RSpec::Matchers.define :have_values do |*expected|
  match_for_should do |actual|
    values = actual.values
    expected.all?{ |v| values.include?(v) }
  end
  match_for_should_not do |actual|
    values = actual.values
    expected.none?{ |v| values.include?(v) }
  end
end