require 'haml'
module JunitReport
  # Should implement 'print' method
  module HtmlPrinter

    extend self

    # options is a hash with possible keys:
    # :template => haml template content
    # :style => css content
    def print(reports, options = {})
      style = options[:style] ||  IO.read(File.join(File.expand_path('..', __FILE__),'default_style.css'))
      template = options[:template] || Haml::Engine.new(IO.read File.join(File.expand_path('..', __FILE__), 'default_template.html.haml'))
      stats = Stats.new(reports)
      template.render binding
    end
  end
end