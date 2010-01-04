require 'rubygems'
gem PLATFORM =='java'? 'rmagick4j' : 'rmagick'
require 'RMagick'
#require 'magickwand'
dirname = ARGV.to_s.chomp



def run_gc
#	fDisabled = GC.enable
#	GC.start
#	GC.disable if fDisabled
end


open(dirname+"index.html","a").close
#dir = Dir.open(dirname)

i = 0

infile = []
new_dir = dirname.sub('albums','cache')
#fp = popen("mkdir "+newdir)
open(new_dir+"index.html","a").close
dir = Dir.open(new_dir)
ar_file_count = 0
new_file_count = 0

dir.each{|filename|
	next if filename =='index.html' || filename == '.' || filename == '..' || !(filename.to_s.include?('thumb.jpg'))
	infile<<filename.to_s[0,8] + '.jpg'

}
p infile.sort


dir = Dir.open(dirname)
count = 0
dir.each{|filename|
   next if filename=='.' || filename =='..' || filename == 'index.html'
   count += 1
}

dir.each{ |filename|
  
  next if filename == '.' || filename == '..' || filename == 'index.html'
puts filename 
 if infile.include?(filename.to_s)
	puts 'fileOK!'
	next
  end	
  puts '----------------'
  puts filename + ' => start'
  
  f1 = File.basename(filename) + '_100_cw85_ch85_thumb.jpg'
  f2 = File.basename(filename) + '_595.jpg'

  puts new_dir
  new_filename1 = new_dir + f1
  new_filename2 = new_dir + f2
  
 img = Magick::Image::read(dirname + filename).first
  
  new_img1 = img.resize(85,85)
  new_img1.write(new_filename1)
#IO.popen("convert -resize 80x80 " + dirname+filename +" " + new_filename1 ) 
 
  puts 'create => ' + f1

  
  new_img2 = img.resize(595,398)
  new_img2.write(new_filename2)
  puts 'create => ' + f2
#IO.popen("convert -resize 595x398 " + dirname+filename +" " + new_filename2 ) 

run_gc
  #puts
  #puts i.to_s + " / " + count.to_s
  #puts ((i/count.to_f)*100).to_s + "%"
  #i+=1
   

}

puts 'end and ' + i.to_s +  ' files'
