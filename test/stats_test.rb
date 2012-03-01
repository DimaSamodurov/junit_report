require_relative "minitest_helper"

describe JunitReport::Stats do
  describe 'sum(metric)' do
    it  "should calculate sum or appropriate metric across all reports" do
      tc = JunitReport::TestSuite.new(
          name: "Login/Logout",
          tests: "10",
          errors: "1",
          failures: "2",
          skipped: "3",
          time: "2.555"
      )
      stats = JunitReport::Stats.new( (1..10).map{tc} )

      stats.sum(:tests).must_equal 100
      stats.sum(:errors).must_equal 10
      stats.sum(:failures).must_equal 20
      stats.sum(:skipped).must_equal 30
      stats.sum(:time).must_equal 25.55
    end
  end
end
