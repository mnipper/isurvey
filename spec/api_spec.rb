require 'spec_helper'

describe Isurvey::API do
  before :all do
    Isurvey::Credentials.company_identifier = ENV["ISURVEY_COMPANY_IDENTIFIER"]
    Isurvey::Credentials.survey_password = ENV["ISURVEY_SURVEY_PASSWORD"]
  end

  it "should respond to questions" do
    Isurvey::API.questions.should_not be_blank
  end
end
