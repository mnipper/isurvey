require 'spec_helper'

describe Isurvey::Question do
  
  before :all do
    @question1 = Isurvey::Question.new(hash: {:screen_id=>"431424", :question_number=>"0", :screen_id_next=>"431426", :show_labels=>true, :selectable_images=>false, :screen_text=>"This is the Week in the Life Daily Survey. ", :screen_instruction=>nil, :theme_class_id=>"59786", :screen_options=>{:screen_option=>[{:screen_option_ref_code=>"DisplayImageAboveText", :screen_option_value_text=>"False"}, {:screen_option_ref_code=>"SelectableImages", :screen_option_value_text=>false}, {:screen_option_ref_code=>"ShowLabels", :screen_option_value_text=>true}]}, :answers=>nil, :questions=>nil, :@type=>"information", :@next_screen_is_linked=>"false"})
    @question2 = Isurvey::Question.new(hash: {:screen_id=>"431424", :question_number=>"0", :screen_id_next=>"431426", :show_labels=>true, :selectable_images=>false, :screen_text=>"This is the Week in the Life Daily Survey. ", :screen_instruction=>nil, :theme_class_id=>"59786", :screen_options=>{:screen_option=>[{:screen_option_ref_code=>"DisplayImageAboveText", :screen_option_value_text=>"False"}, {:screen_option_ref_code=>"SelectableImages", :screen_option_value_text=>false}, {:screen_option_ref_code=>"ShowLabels", :screen_option_value_text=>true}]}, :answers=>nil, :questions=>nil, :@type=>"information", :@next_screen_is_linked=>"false"})
  end

  it "should return the correct screen_id" do
    @question1.screen_id.should == '431424'
  end

  it "should return the correct screen_text" do
    @question1.screen_text.should == 'This is the Week in the Life Daily Survey. '
  end

  it "should return all questions for all" do
    Isurvey::Question.all.length.should == 2
  end
end
