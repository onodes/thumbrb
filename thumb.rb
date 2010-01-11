require 'rubygems'
#gem PLATFORM == 'java'? 'rmagick4j':'rmagick'
#require 'RMagick'




class Thumb
  def initialize(path_r,opt='')
    @path_r = path_r
    @path_w = path_r.gsub("albums","cache")
  end

  def rename(add)
    dirname + '/' + filename + add + extname
  end


  def convert
    img = Magick::Image::read(@path_r).first
    img.resize(85,85).write(rename('_100_cw85_ch85_thumb'))
    img.resize(595,398).write(rename('_595'))

    puts filename+"created"
  end

  private
  def extname
    @extname ||= File.extname(@path_w)
  end

  def filename
    @filename ||= File.split(@path_w)[1].gsub(extname,"")
  end

  def dirname
    @dirname ||= File.dirname(@path_w)
  end
end
