require 'spec_helper'
#This are tests for the static pages of the Todolist App
describe "Static pages" do
  
  let(:base_title) { "Todolist App" }
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Todolist App') }
    it { should have_title("#{base_title}") }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title("#{base_title}") }
  end

  describe "About page" do
    before { visit about_path }
    
    it { should have_content('About') }
    it { should have_title("#{base_title}") }
  end
end
