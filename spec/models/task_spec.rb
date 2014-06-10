require 'spec_helper'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  before { @task = user.list.tasks.build(content: "Lorem ipsum", mark: false) }
    
  subject { @task }

  it { should respond_to(:content) }
  it { should respond_to(:list_id) }
end