require 'rubygems'
gem PLATFORM == 'java'? 'rmagick4j':'rmagick'
require 'RMagick'

class Thumb

  def initialize(path_r,opt='')
    @path_r = path_r
    @path_w = path_r.gsub("albums","cache")
  end

  def rename(filename,add)
    dirname + '/' + filename + add + extname
  end


  def convert
    img = Magick::Image::read(@path_r).first
    new_img1 = img.resize(85,85)
    new_img1.write(rename(@path_w,'_100_cw85_ch85_thumb'))

    new_img2 = img.resize(595,398)
    new_img2.write(rename(@path_w,'_595'))

    puts filename+"created"
  end

  private
  def extname
    @extname ||= File.extname(@path_w)
  end

  def filename
    @filename ||= File.basename(@path_w, extname)
  end

  def dirname
    @dirname ||= File.dirname(@path_w)
  end
end
