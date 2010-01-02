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

t1 = Thread.new(1, &proc)
t2 = Thread.new(2, &proc)
t3 = Thread.new(3, &proc)

t1.join
t2.join
t3.join

puts "End"
