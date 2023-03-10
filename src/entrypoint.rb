require "pathname"
exit if Pathname.new(File.dirname(__FILE__)).parent.basename.to_s.match(/\Aocr.*\.tmp\z/)

puts "Starting script"

require "tiny_tds"

puts "TinyTds: #{TinyTds.inspect}"
