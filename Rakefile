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