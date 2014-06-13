require 'spec_helper'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  before { @task = user.list.tasks.build(content: "Lorem ipsum", mark: false) }
    
  subject { @task }


end