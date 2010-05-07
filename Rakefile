desc "Rebuild parser"
task :parser do
  Dir.chdir(File.join(Dir.getwd, 'lib')) do |lib|
    puts `narwhal ../../jison/bin/jison cappruby_parser.jison`
  end
end