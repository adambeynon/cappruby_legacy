require 'yard'

desc "Rebuild parser"
task :parser do
  Dir.chdir(File.join(Dir.getwd, 'lib')) do |lib|
    puts `narwhal ../../jison/bin/jison cappruby_parser.jison`
  end
end

desc "Rebuild CappRuby.js ready for browser"
task :browser do
  src = %w[cappruby string_scanner cappruby_parser nodes lexer parse]
  
  File.open 'build/CappRuby.js', 'w' do |out|
    out.write "(function() {\n"
    src.each do |input|
      out.write("console.log('#{input}');")
      out.write(File.read("lib/#{input}.js"))
    end
    out.write "\n})();\n"
  end
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['framework/**/*.rb']
  # t.options = ['-o./doc/opalbrowser/']
  # t.options += ['-r./opals/opalbrowser/README.md']
  # t.options += ['-mmarkdown']
  # t.options += ['--title', 'Browser Documentation']
end

task :doc => ['yard'] do
  # go through each set of generated docs, and replace the style.css file
    from = File.join(File.dirname(__FILE__), 'yard', 'style.css')
    to = File.join(File.dirname(__FILE__), 'doc', 'css', 'style.css')
    FileUtils.copy from, to
  
  
  # # copy our index.html and its necessary css files
  # %w{index.html style.css}.each do |resource|
  #   from = File.join File.dirname(__FILE__), 'yard', resource
  #   to = File.join(File.dirname(__FILE__), 'doc')
  #   FileUtils.copy from, to
  # end
end