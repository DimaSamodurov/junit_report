require_relative "minitest_helper"

describe JunitReport do
  xml = <<-XML
    <testsuite errors="0" failures="1" name="Login/Logout" skipped="0" tests="5" time="16.328231">
    <testcase classname="Login/Logout with credentials.Logout" name="Logout" time="3.679872"/>
    </testsuite>
  XML

  describe 'parse_test_suite' do
    it 'should parse JUnit xml' do
      suite = JunitReport.parse_test_suite(xml)
      suite.must_be_instance_of JunitReport::TestSuite

      suite.tests.must_equal 5
      suite.errors.must_equal 0
      suite.failures.must_equal 1
      suite.skipped.must_equal 0
      suite.time.must_equal 16.328231
    end
  end

  describe 'process' do
    JunitReport.process(File.join(File.expand_path('..', __FILE__), 'samples', '*.xml'), 'report.html')
  end
end