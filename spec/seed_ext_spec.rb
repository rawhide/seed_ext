require 'spec_helper'

describe 'SeedExt' do

  context "when truncation!" do
    before { User.truncation! }
    it "record's count should == 0" do
      User.count.should == 0
    end
  end

  describe "truncation" do
    context "when load from csv" do
      before { User.truncation(:csv, "spec/db/seeds") }
      it "should seed data" do
        User.count.should == 2
        User.find(1).name == '担当者1'
        User.find(2).sex == 0
      end
    end
    context "when load from yml" do
      before { User.truncation(:yml, "spec/db/seeds") }
      it "should seed data" do
        User.count.should == 2
        User.find(3).name == '担当者3'
        User.find(4).sex == 1
      end
    end
  end

end
