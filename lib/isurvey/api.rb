module Isurvey
  class API
    def self.load
      questions
      answers
      results
    end

    def self.questions
      unless @questions 
        @questions = []
        self.screens.each do |question|
          @questions << Question.new(hash: question)
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

    def self.answers
      unless @answers
        @answers = []
        survey_results.each do |result|
          result[:screen_results][:result].each do |answer|
            answer = Answer.new(hash: answer)
            answer.result_id = result[:result_id]
            @answers << answer 
          end
        end
      end
      @answers
    end

    def self.results
      unless @results
        @results = []
        survey_results.each do |result|
          @results << Result.new(hash: result) 
        end
      end
      @results
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
end
