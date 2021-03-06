require 'test_helper'

class MetricsRailsTest < ActiveSupport::TestCase
  
  test 'is a module' do
    assert_kind_of Module, Metrics::Rails
  end
  
  test 'client is available' do
    assert_kind_of Librato::Metrics::Client, Metrics::Rails.client
  end
  
  test '#increment exists' do
    assert Metrics::Rails.respond_to?(:increment)
    Metrics::Rails.increment :baz, 5
  end
  
  test '#measure exists' do
    assert Metrics::Rails.respond_to?(:measure)
    Metrics::Rails.timing 'queries', 10
  end
  
  test '#timing exists' do
    assert Metrics::Rails.respond_to?(:timing)
    Metrics::Rails.timing 'request.time.total', 121.2
  end
  
  test 'source is assignable' do
    original = Metrics::Rails.source
    Metrics::Rails.source = 'foobar'
    assert_equal 'foobar', Metrics::Rails.source
    Metrics::Rails.source = original
  end
  
  test 'qualified source includes pid' do
    assert_match /\.\d{2,6}$/, Metrics::Rails.qualified_source
  end
  
end
