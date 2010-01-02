require 'rubygems'
gem PLATFORM =='java'?'rmagick4j' : 'rmagick'
require'RMagick'
require'thumb'
require 'pp'
require 'thread'

q = Queue.new

dir_r = ARGV.to_s.chomp
dir_w = dir_r.gsub("albums","cache")


Dir::glob(dir_r + "*.{jpg,JPG}").each{|filename| q.push Thumb.new(filename)}

puts
puts
puts "-"*30
puts "-"*3 + "For zenphoto On PHP Web Album" + "-"*3
puts "Created by onodes 2009-2010"
puts
puts "-"*30

sleep 1.5

proc = Proc.new do |n|
  unless(q.empty?)
    print "Thread#{n} : "
    q.pop.convert
  end
  self.kill
end

3.times.map{|n| Thread.new(n+1, &proc)}.each(&:join)

puts "End"
