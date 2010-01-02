require 'rubygems'
gem PLATFORM =='java'?'rmagick4j' : 'rmagick'
require'RMagick'
require'thumb'

dir_r = ARGV.to_s.chomp
dir_w = dir_r.gsub("albums","cache")


p Dir::glob(dir_r + "*.{jpg,JPG}")
