require 'rubygems'
gem PLATFORM =='java'?'rmagick4j' : 'rmagick'
require'RMagick'
require'thumb'

dir_r = ARGV.to_s.chomp
dir_w = dir_r.gsub("albums","cache")


ary = Dir::glob(dir_r + "*.{jpg,JPG}")
p ary2 = ary.map{|filename| filename.gsub("albums","cache")}
data = Thumb.new(ary[0],ary2[0])
data.convert


