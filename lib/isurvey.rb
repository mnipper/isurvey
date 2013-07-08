require "isurvey/version"
require "savon"

module Isurvey
  class SOAPClient 
    class << self
      attr_accessor :company_identifier, :survey_password
    end

    def self.savon_client
      @savon_client ||= Savon.client(
        wsdl: "https://isurveysoft.com/servicesv3/exportservice.asmx?WSDL"
      )
    end

    def self.savon_call(operation)
      self.savon_client.call(
        operation,
        message:
        {
          cp: company_identifier,
          sp: survey_password
        }
      )
    end

    def self.export_survey 
      @export_survey ||= self.savon_call(:export_survey) 
    end

    def self.export_survey_results
      @export_survey_results ||= self.savon_call(:export_survey_results) 
    end
  end

  class API
    def self.questions
      unless @questions 
        @questions = []
        screens.each do |question|
          @questions << question
        end
      end
      @questions
    end

    def self.result_ids
      unless @result_ids
        @result_ids = []
        survey_results.each do |result|
          @result_ids << result[:result_id] 
        end
      end
      @result_ids
    end


    def self.question_by_screen_id(id)
      screens.each do |question|
        if question[:screen_id] == id
          return question[:screen_text]
        end
      end
    end

    def self.answer_by_screen_and_result_id(options)
      answers_by_result_id(options[:result_id]) & answers_by_screen_id(options[:screen_id])
    end

    def self.answers_by_result_id(id)
      survey_results.each do |result|
        if result[:result_id] == id
          return result[:screen_results][:result]
        end
      end
    end

    def self.answers_by_screen_id(id)
      @answers = []
      survey_results.each do |result|
        result[:screen_results][:result].each do |question|
          @answers << question if question[:screen_id] == id
        end
      end
      @answers
    end
  end

  private
  def self.survey
    SOAPClient.export_survey.body[:export_survey_response][:export_survey_result]
  end

  def self.survey_results
    SOAPClient.export_survey_results.body[:export_survey_results_response][:export_survey_results_result][:survey_result]
  end

  def self.screens
    survey[:screens][:screen]
  end
end
