module Isurvey
  class Question
    include Base
    extend Collector

    def answers
      Answer.find_by_screen_id(self.screen_id)
    end

    def answers_by_result_id(id)
      answers.select do |answer|
        answer.result_id == id
      end
    end
  end
end
