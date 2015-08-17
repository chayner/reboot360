require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :week => 1,
      :title => "Title",
      :description => "MyText",
      :image => "Image",
      :teaching_content => "Teaching Content",
      :teaching_tips => "Teaching Tips",
      :weekly_communication => "Weekly Communication"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Teaching Content/)
    expect(rendered).to match(/Teaching Tips/)
    expect(rendered).to match(/Weekly Communication/)
  end
end
