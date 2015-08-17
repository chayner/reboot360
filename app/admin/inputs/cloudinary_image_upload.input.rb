class CloudinaryImageUploadInput < Formtastic::Inputs::StringInput
  include Formtastic::Inputs::Base

  def to_html
    input_wrapping do
      label_html <<

      "<div id='#{method.to_s}_uploader' class='upload-wrap'>".html_safe +
        "#{input_html_options[:label]}".html_safe +
        "<div class='preview'>".html_safe +
          template.image_tag(object.send("#{method.to_s}_url", :faces_thumb, secure: true), :id => "#{method.to_s}_preview") +
        "</div>".html_safe +
        builder.cl_image_upload(method) +
        "<br /><div class=\"upload-status\"></div>".html_safe +
      "</div>".html_safe
    end
  end
end
