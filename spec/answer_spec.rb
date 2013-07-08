require 'spec_helper'

describe Isurvey::Answer do
  
  before :all do
    @answer1 = Isurvey::Answer.new(hash: {:screen_id=>"431583", :question_id=>nil, :answer_id=>nil, :result_answer=>"9", :response_date=>"2013-06-14 19:34:58"})
    @answer2 = Isurvey::Answer.new(hash: {:screen_id=>"431583", :question_id=>nil, :answer_id=>nil, :result_answer=>"9", :response_date=>"2013-06-14 19:34:58"})
  end

  it "should return the correct screen_id" do
    @answer1.screen_id.should == '431583'
  end

  it "should return the correct result_answer" do
    @answer1.result_answer.should == '9'
  end

  it "should return all questions for all" do
    Isurvey::Answer.all.length.should == 2
  end
end
