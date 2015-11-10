ActiveAdmin.register Training do
  # menu parent: "Episodes"
  config.sort_order = 'id_asc'

  scope :all

  actions :index, :edit

  index do
    column :slug
    column :title do |training|
      link_to training.title, edit_admin_training_path(training)
    end
    column :image do |training|
      image_tag(training.image_url(:faces_thumb, secure: true), :size => "150x100") if training.image?
    end
    actions do |a|
      link_to "Site", training_path(a.slug)
    end
  end

  show title: :title do
    panel 'training details' do
      attributes_table_for training do
        row :slug
        row :subtitle
        row :description
        row :image do |episode|
          image_tag(training.image_url(:faces_thumb, secure: true), :size => "150x100") if training.image?
        end
      end
    end
  end

  form(:html => { :multipart => true }) do |f|

    f.semantic_errors

    f.inputs "Training Info" do
      f.input :slug
      f.input :title, :as => :string
      f.input :subtitle, :as => :string
      f.input :description, :as => :ckeditor, :input_html => {:rows => 20}
      f.input :image, :as => :cloudinary_image_upload, :hint => 'Image file size should be less than 150k. Always run images through https://tinyjpg.com/ before uploading'
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
    link_to "Back to all trainings", admin_trainings_path
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
