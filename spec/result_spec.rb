require 'spec_helper'

describe Isurvey::Result do
  before :all do
    Isurvey::Credentials.company_identifier = ENV["ISURVEY_COMPANY_IDENTIFIER"]
    Isurvey::Credentials.survey_password = ENV["ISURVEY_SURVEY_PASSWORD"]
    Isurvey::API.load
  end

  it "should not be empty" do
    Isurvey::Result.all.should_not be_blank
  end
end
