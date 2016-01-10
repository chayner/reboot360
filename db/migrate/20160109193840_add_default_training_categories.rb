class AddDefaultTrainingCategories < ActiveRecord::Migration
  def change
    TrainingCategory.create :title => "Starting a Group", :slug => 'start', :description => 'Our goal is to make starting a group as easy as possible. It all starts with building your core leadership team. An ideal team consists of at least 2-3 core leaders. In addition to your core team, make sure to also establish a prayer team to support and strengthen your efforts.'
    TrainingCategory.create :title => "Leading a Group", :slug => 'lead', :description => 'REBOOT leaders demonstrate courage, intentionality and optimism. You may have doubts about your ability to lead or you may be over confident. The important part is that you are prayerful and patient.'
    TrainingCategory.create :title => "Growing Your Group", :slug => 'grow', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    TrainingCategory.create :title => "Adminstration Tools", :slug => 'tools', :description => 'Leading a REBOOT group is challenging! That’s why we have a few simple administrative tips that make managing your group much easier.'
  end
end
