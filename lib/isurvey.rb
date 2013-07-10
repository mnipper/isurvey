require 'savon'
require_relative './isurvey/version'
require_relative './isurvey/soap_client'
require_relative './isurvey/base'
require_relative './isurvey/collector'
require_relative './isurvey/api'
require_relative './isurvey/question'
require_relative './isurvey/answer'
require_relative './isurvey/result'

module Isurvey
  class Credentials 
    class << self
      attr_accessor :company_identifier, :survey_password
    end
  end
end
