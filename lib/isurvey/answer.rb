module Isurvey
  class Answer
    include Base 
    extend Collector
    attr_accessor :result_id
    
    def question
      Question.find_by_screen_id(self.screen_id)
    end
  end
end
