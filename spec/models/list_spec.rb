require 'spec_helper'

describe List do

  let(:user) { FactoryGirl.create(:user) }
  before { @list = user.lists.build(title: "Lorem ipsum", description: "Lorem ipsum") }

  subject { @list }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @list.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @list.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @list.title = "a" * 70 }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @list.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @list.description = "a" * 141 }
    it { should_not be_valid }
  end
end