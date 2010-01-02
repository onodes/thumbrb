require 'rubygems'
gem PLATFORM == 'java'? 'rmagick4j':'rmagick'
require 'RMagick'

class Thumb
  
  def initialize(path_r,opt='')
    @path_r = path_r
    @path_w = path_r.gsub("albums","cache")
  end

  def split_ext(file)
    extname = File.extname(file)
    filename = File.split(file)[1].gsub(extname,"")
    dirname = File.dirname(file)
    return [dirname,filename,extname]
  end
 
  def rename(filename,add)
    name=  split_ext(filename)[0] + '/' + split_ext(filename)[1] + add + split_ext(filename)[2]
    return name
  end


  def convert
    img = Magick::Image::read(@path_r).first
    new_img1 = img.resize(85,85)
    new_img1.write(rename(@path_w,'_100_cw85_ch85_thumb'))
      
    new_img2 = img.resize(595,398)
    new_img2.write(rename(@path_w,'_595'))

    puts split_ext(@path_r)[1]+"created"
  end
end 
