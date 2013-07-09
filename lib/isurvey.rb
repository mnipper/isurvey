require 'isurvey/version'
require 'savon'
require 'isurvey/soap_client'
require 'isurvey/api'
require 'isurvey/base'
require 'isurvey/collector'
require 'isurvey/question'
require 'isurvey/answer'

module Isurvey
  class Credentials 
    class << self
      attr_accessor :company_identifier, :survey_password
    end
  end
end
