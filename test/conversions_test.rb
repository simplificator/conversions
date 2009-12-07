require 'test_helper'

class ConversionsTest < Test::Unit::TestCase
  should 'convert from grams to tons' do
    assert_equal 1, 1000000.g_to_t
    assert_equal 1.234567, 1234567.g_to_t
    assert_equal 0.001, 1000.g_to_t
    assert_equal 0.000001, 1.g_to_t
  end
  
  should 'convert from grams to kg' do
    assert_equal 1, 1000.g_to_kg
    assert_equal 0.001, 1.g_to_kg 
  end
  
  should 'convert from t to grams' do
    assert_equal 1000000, 1.t_to_g
    assert_equal 1234, (0.001234).t_to_g
  end
  
  should 'convert from kg to grams' do
    assert_equal 1000, 1.kg_to_g
    assert_equal 12, 0.012.kg_to_g 
  end
  
  should 'convert from mm2 to m2' do
    assert_equal 1, (1000 * 1000).mm2_to_m2
    assert_equal 0.025, (100 * 250).mm2_to_m2
  end
  
  should 'convert from m2 to mm2' do
    assert_equal 1000, (0.01 * 0.1).m2_to_mm2
  end
  
  
  should 'raise if source or target unit can not be found' do
    assert_raises(NoMethodError) do
      1000.kg_to_m
    end
  end
end
