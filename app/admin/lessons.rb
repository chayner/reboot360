ActiveAdmin.register Lesson do
  # menu parent: "Episodes"
  # config.sort_order = 'aired_on_asc'

  scope :all

  index do
    column :week
    column :title do |lesson|
      link_to lesson.title, edit_admin_lesson_path(lesson)
    end
    column :image do |lesson|
      image_tag(lesson.image_url(:faces_thumb, secure: true), :size => "150x100") if lesson.image?
    end
    actions do |a|
      link_to "Site", lesson_path(a)
    end
  end

  show title: :title do
    panel 'Lesson details' do
      attributes_table_for lesson do
        row :week
        row :description
        row :image do |episode|
          image_tag(lesson.image_url(:faces_thumb, secure: true), :size => "150x100") if lesson.image?
        end
        row :video_embed
        row :videmo_dnload_url
        row :lesson_pdf
        row :handout_pdf
        row :weekly_summary
      end
    end
  end

  form(:html => { :multipart => true }) do |f|

    f.semantic_errors

    f.inputs "Lesson Info" do
      f.input :title, :as => :string
      f.input :week

      f.input :description, :as => :ckeditor, :input_html => {:rows => 10}
      f.input :image, :as => :cloudinary_image_upload, :hint => 'Image file size should be less than 150k. Always run images through https://tinyjpg.com/ before uploading'

      f.input :video_embed, :as => :text, :input_html => {:rows => 4}
      f.input :video_dnload_url, :as => :string
      # f.input :lesson_pdf, :as => :file, :hint => (f.object.lesson_pdf.url if f.object.lesson_pdf.present?)
      # f.input :remove_lesson_pdf, :as => :boolean
      # f.input :handout_pdf, :as => :file, :hint => f.object.handout_pdf.url
      # f.input :remove_handout_pdf, :as => :boolean
      f.input :weekly_summary, :as => :ckeditor, :input_html => {:rows => 10}
    end

    f.inputs "Downloads" do
      f.has_many :downloads, class: "downloads", sortable: :position, heading: '', allow_destroy: true, new_record: "Add new download" do |c|
        c.input :title
        c.input :file, :as => :file, :hint => (c.object.file.url if c.object.file.present?)
      end
    end

    f.inputs "Teaching Tips" do
      f.has_many :videos, class: "teaching-tips", sortable: :position, heading: '', allow_destroy: true, new_record: "Add new teaching tip video" do |c|
        c.input :video_url, :as => :string
      end
    end

    f.actions
  end

  action_item(:edit) do
    link_to "Back to all Lessons", admin_lessons_path
  end

  controller do
    def permitted_params
      params.permit!
    end

    def create
      create!{ collection_path }
    end

    def update
      update!{ collection_path }
    end
  end
end
