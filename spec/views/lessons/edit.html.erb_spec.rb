require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :week => 1,
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :teaching_content => "MyString",
      :teaching_tips => "MyString",
      :weekly_communication => "MyString"
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input#lesson_week[name=?]", "lesson[week]"

      assert_select "input#lesson_title[name=?]", "lesson[title]"

      assert_select "textarea#lesson_description[name=?]", "lesson[description]"

      assert_select "input#lesson_image[name=?]", "lesson[image]"

      assert_select "input#lesson_teaching_content[name=?]", "lesson[teaching_content]"

      assert_select "input#lesson_teaching_tips[name=?]", "lesson[teaching_tips]"

      assert_select "input#lesson_weekly_communication[name=?]", "lesson[weekly_communication]"
    end
  end
end
