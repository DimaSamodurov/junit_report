namespace :junit_report do
  desc "Generate html report on cucumber xml output."
  task :generate, [:pattern, :output_file] do |t, args|
    JunitReport.process args[:pattern] || 'features/reports/*.xml', args[:output_file] || 'features/reports/report.html'
  end
end
