module JunitReport
  class TestCase
    include Virtus
    attribute :class_name,  String
    attribute :name,        String
    attribute :time,        Float
    attribute :failure,     Failure
  end
end