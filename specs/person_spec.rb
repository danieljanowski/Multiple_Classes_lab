require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../person.rb')

class TestBus < Minitest::Test

  def setup
    @person1 = Person.new('Daniel', 42)
  end

  def test_name
    assert_equal('Daniel', @person1.name)
  end

  def test_age
    assert_equal(42, @person1.age)
  end

end
