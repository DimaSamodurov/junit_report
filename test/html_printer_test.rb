require_relative "minitest_helper"

describe JunitReport::HtmlPrinter do
  xml = <<-XML
    <testsuite errors="0" failures="1" name="Login/Logout" skipped="0" tests="5" time="16.328231">
      <testcase classname="Login/Logout with credentials.Logout" name="Logout" time="3.679872"/>
    </testsuite>
  XML


  describe 'print' do
    it 'should render html' do
      report = JunitReport.parse_test_suite(xml)
      html = JunitReport::HtmlPrinter.print [report, report]
      ['<html>', '<head>', '<body>', '</html>', 'Logout'].each do |text|
        html.must_include text
      end
    end
  end
end