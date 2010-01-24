#jruby start.rb /path
#require 'rubygems'
#gem PLATFORM =='java'?'rmagick4j' : 'rmagick'
#require'RMagick'
#require'thumb'
#require 'pp'
#require 'thread'
require 'rubygems'
require 'thread'
require 'pp'
require 'thumb'
#include Java
#require '/usr/share/java/jmagick6-6.2.6-0.jar'

q = Queue.new

dir_r = ARGV.to_s.chomp
dir_w = dir_r.gsub("albums","cache")


ary = Dir::glob(dir_r + "*.{jpg,JPG}").map{|filename| Thumb.new(filename)}
puts
puts
puts "-"*30
puts "-"*3 + "For zenphoto On PHP Web Album" + "-"*3
puts "Created by onodes 2009-2010"
puts
puts "-"*30

sleep 1.5


ary.each{|r|
  q.push(r)
}

t1 = Thread.new{
  while(!q.empty?)
    print "Thread1 : "
    instance = q.pop
    instance.convert
  end
self.kill
}

t2 = Thread.new{
  while(!q.empty?)
    print "Thread2 : "
    instance = q.pop
    instance.convert
  end
self.kill
}

t3 = Thread.new{
  while(!q.empty?)
    print "Thread3 : "
    instance = q.pop
    instance.convert
  end
self.kill
}

t1.join
t2.join
t3.join

puts "End"
