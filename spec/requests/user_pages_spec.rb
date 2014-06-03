require 'spec_helper'
#This are tests for the user pages of the Todolist App
describe "User pages" do

  let(:base_title) { "Todolist App" }
  subject { page }

  describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit user_path(user) }

      it { should have_content(user.name) }
      it { should have_title(user.name) }
    end

  describe "signup page" do
      before { visit signup_path }

      it { should have_content('Sign up') }
      it { should have_title("#{base_title}") }
    end
end