require "rails"

module JunitReport
  class Railtie < Rails::Railtie

    rake_tasks do
      load "junit_report/tasks.rake"
    end
  end
end
