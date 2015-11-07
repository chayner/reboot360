ActiveAdmin.register Lesson do
  # menu parent: "Episodes"
  # config.sort_order = 'aired_on_asc'

  scope :all

  index do
    column :id
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
      attributes_table_for lessons do
        row :subtitle
        row :episode_number
        row :aired_on
        row :published_at
        row :guests
        row (:featured) { status_tag('True', :class => episode.in_feed ? "ok" : "error", :label => episode.in_feed ? "True" : "False") }
        row (:in_feed) { status_tag('True', :class => episode.in_feed ? "ok" : "error", :label => episode.in_feed ? "True" : "False") }

        row :mp3_url
        row :episode_length
        row(:mp3_valid) { status_tag('Valid', :class => episode.mp3_valid? ? "ok" : "error", :label => episode.mp3_valid? ? "Valid" : "Invalid") }

        row :tag_list
        row :category
        row :teaser
        row :meta_keywords
        row :meta_description
      end
    end

    panel 'Images' do
      attributes_table_for episode do
        row :wide_image do |episode|
          image_tag(episode.wide_image_url(:small, secure: true)) if episode.wide_image?
        end
        row :square_image do |episode|
          image_tag(episode.square_image_url(:medium, secure: true)) if episode.square_image?
        end
      end
    end
  end

  sidebar "Status", only: :show do
    attributes_table_for episode do
      h3 status_tag 'Published', :label => episode.published? ? "Published" : "Not Published", :class => episode.published? ? "ok" : "warn"
      h3 status_tag 'Aired', :label => episode.aired? ? "Aired" : "Not Aired", :class => episode.aired? ? "ok" : "warn"
      h3 status_tag 'Podcast', :label => episode.in_podcast? ? "In Podcast" : "Not in Podcast", :class => episode.in_podcast? ? "ok" : "error"
    end
  end


  form do |f|

    f.semantic_errors

    f.inputs "Lesson Info" do
      f.input :title, :as => :string
      f.input :week

      f.input :description, :as => :text, :input_html => {:rows => 4}
      f.input :image, :as => :cloudinary_image_upload, :hint => 'Image file size should be less than 150k. Always run images through https://tinyjpg.com/ before uploading'

      f.input :video_embed, :as => :text, :input_html => {:rows => 4}
      f.input :video_dnload_url, :as => :string
      f.input :lesson_pdf_url, :as => :string
      f.input :handout_pdf_url, :as => :string
      f.input :weekly_summary, :as => :text, :input_html => {:rows => 4}
    end

    f.inputs "Related Resources" do
      # f.has_many :content_references, class: "content_refs", sortable: :position, heading: '', allow_destroy: true, new_record: "Add new resource" do |c|
      #   if c.object.new_record? || !ContentReference::CONTENT_REFERENCE_ADMIN.any? {|field| c.object.send("#{field}_before_type_cast").present?}
      #     content_refs_class = 'closed'
      #   else
      #     content_refs_class = 'open'
      #   end
      #
      #   content_refs_wrapper = { :class => "content-refs-customize #{content_refs_class}" }
      #
      #   c.input :class_name, :label => "Content Type", :as => :select, :collection => ["Article", "Episode", "Other"]
      #   c.input :reference_id, :label => "Content ID", :as => :string, :wrapper_html => { :class => "customize-button #{content_refs_class}" }
      #   c.input :title, :wrapper_html => content_refs_wrapper, :input_html => { :value => c.object.send("title_before_type_cast") }
      #   c.input :url, :wrapper_html => content_refs_wrapper, :input_html => { :value => c.object.send("url_before_type_cast") }
      #   c.input :wide_image_override, :as => :cloudinary_image_upload, :wrapper_html => content_refs_wrapper, :hint => 'Image file size should be less than 150k. Always run images through https://tinyjpg.com/ before uploading'
      #   c.input :remove_wide_image_override, :as => :boolean, :wrapper_html => content_refs_wrapper
      #   c.input :square_image_override, :as => :cloudinary_image_upload, :wrapper_html => content_refs_wrapper
      #   c.input :remove_square_image_override, :as => :boolean, :wrapper_html => content_refs_wrapper
      #   c.input :subtitle, :wrapper_html => content_refs_wrapper, :input_html => { :value => c.object.send("subtitle_before_type_cast") }
      # end
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
