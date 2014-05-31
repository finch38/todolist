require 'spec_helper'
#This are tests for the user pages of the Todolist App
describe "User pages" do

  let(:base_title) { "Todolist App" }
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title("#{base_title}") }
  end
end