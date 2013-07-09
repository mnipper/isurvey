module Isurvey
  class Answer
    include Base 
    extend Collector
    attr_accessor :result_id
    
    def question
      Question.find_by_screen_id(self.screen_id)
    end

    def self.by_result_id(id)
      all.select do |answer|
        answer.result_id == id
      end
    end
  end
end
