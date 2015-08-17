# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  process :convert => 'jpg'
  process :tags => ['lesson_image']

  # version :standard do
  #   process :resize_to_fill => [100, 150, :north]
  # end

  # version :thumbnail do
  #   resize_to_fit(50, 50)
  # end

  # Create different versions of your uploaded files:
  # version :simple do
  #   process :resize_to_fill => [164, 164, :fill]
  #   process :convert => 'jpg'
  #   cloudinary_transformation :quality => 80
  # end

  # Generate a 100x150 face-detection based thumbnail,
  # round corners with a 20-pixel radius and increase brightness by 30%.
  version :faces do
    cloudinary_transformation :width => 600, :height => 400, :crop => :fill, :gravity => :faces
  end

  version :faces_thumb do
    cloudinary_transformation :width => 300, :height => 200, :crop => :fill, :gravity => :faces
  end

  version :vert do
    cloudinary_transformation :width => 500, :height => 500, :crop => :fill, :gravity => :faces
  end

  version :horz do
    cloudinary_transformation :width => 1050, :height => 600, :crop => :fill, :gravity => :faces
  end

  # version :standard do
  #   process :resize_to_fill => [100, 150, :north]
  # end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  # def public_id
  #   return model.short_name
  # end
end
