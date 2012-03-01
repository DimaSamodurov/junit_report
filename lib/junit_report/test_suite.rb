module JunitReport
  class TestSuite
    include Virtus

    attribute :name,        String
    attribute :errors,      Integer,  default: 0
    attribute :failures,    Integer,  default: 0
    attribute :skipped,     Integer,  default: 0
    attribute :tests,       Integer,  default: 0
    attribute :time,        Float,    default: 0

    attribute :testcases,   Array,    default: []
  end
end