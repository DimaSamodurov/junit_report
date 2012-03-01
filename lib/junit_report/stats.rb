module JunitReport
  class Stats
    attr_reader :reports

    def initialize(reports)
      @reports = reports
    end

    def sum(attr)
      @reports.inject(0){|result, testsuite| result += testsuite.send(attr.to_sym) }
    end
  end
end