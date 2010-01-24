#require 'rubygems'
#gem PLATFORM == 'java'? 'rmagick4j':'rmagick'
#require 'RMagick'
include Java
#require 'jmagick6.jar'
#import 'magick.ImageInfo'
#import 'magick.MagickImage'
#include_class 'ImageInfo'
#include_class 'MagickImage'
#module Magick
#  include_package "magick"
#end
#
#import ImageInfo
#import MagickImage
include_class "magick.MagickImage"
include_class "magick.ImageInfo"


class Thumb

  def initialize(path_r,opt='')
    @path_r = path_r
    @path_w = path_r.gsub("albums","cache")
  end

  def rename(add)
    dirname + '/' + filename + add + extname
  end


  def convert
  #  img = Magick::Image::read(@path_r).first
  #  img.resize(85,85).write(rename('_100_cw85_ch85_thumb'))
  #  img.resize(595,398).write(rename('_595'))

  img = MagickImage.new(ImageInfo.new(@path_r))
  resized = img.scaleImage(85,85)
  resized.setFileName(rename('_100_cw85_ch85_thumb'))
  resized.writeImage(ImageInfo().new)

  resized = img.scaleImage(595,398)
  resized.setFileName(rename('_595'))  
  resized.writeImage(ImageInfo().new)

  
  
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
