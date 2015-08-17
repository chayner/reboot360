require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        :week => 1,
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :teaching_content => "Teaching Content",
        :teaching_tips => "Teaching Tips",
        :weekly_communication => "Weekly Communication"
      ),
      Lesson.create!(
        :week => 1,
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :teaching_content => "Teaching Content",
        :teaching_tips => "Teaching Tips",
        :weekly_communication => "Weekly Communication"
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Teaching Content".to_s, :count => 2
    assert_select "tr>td", :text => "Teaching Tips".to_s, :count => 2
    assert_select "tr>td", :text => "Weekly Communication".to_s, :count => 2
  end
end
