require 'rubygems'
gem PLATFORM =='java'?'rmagick4j' : 'rmagick'
require'RMagick'
require'thumbrb'

dir_r = ARGV.to_s.chomp
dir_w = dirname_r.gsub("albums","cache")


dir_r.entries{|file|
  puts file
}


dir_r.close
dir.w.close
