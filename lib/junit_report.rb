require "nokogiri"
require "virtus"
require "junit_report/version"
require "junit_report/failure"
require "junit_report/test_case"
require "junit_report/test_suite"
require "junit_report/stats"
require "junit_report/html/printer"
require "junit_report/railtie" if defined?(Rails)

module JunitReport

  # Method parses xml files defined by path_pattern, generates the report and prints it to the output_file.
  def self.process(path_pattern, output_file)
    reports = Dir.glob(path_pattern).inject([]) do |items, file_name|
      items << parse_test_suite(IO.read(file_name))
    end
    output = HtmlPrinter.print(reports) #TODO select printer by extension: html or csv, pass configuration options
    IO.write output_file, output
  end

  # Parses an xml containing results of running single test suite (cucumber feature) and returns TestSuite object.
  def self.parse_test_suite(xml)
    doc = Nokogiri.XML(xml)
    testsuite_node = doc.root

    raise "Invalid xml" if testsuite_node.nil?
    raise "#{file_name} format is not supported: expected root element 'testsuite'." if testsuite_node.name != 'testsuite'

    testsuite = TestSuite.new(Hash[testsuite_node.attributes.map{|k,v| [k, v.to_s]}])

    testsuite.testcases = (testsuite_node > 'testcase').map do |testcase_node|
      testcase = TestCase.new(Hash[testcase_node.attributes.map{|k,v| [k, v.to_s]}])
      if (failure_node = (testcase_node > 'failure').first)
        testcase.failure = Failure.new(
            message: failure_node['message'],
            type: failure_node['type'],
            errors: failure_node.children.map(&:text).reject{|s|s.strip.empty?})
      end
      testcase
    end
    testsuite
  end
end
