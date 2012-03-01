module JunitReport
  class Failure
    include Virtus

    attribute :message, String
    attribute :type, String
    attribute :errors, Array
  end
end