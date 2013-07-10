module Isurvey
  class Result
    include Base
    extend Collector

    def answers
      Answer.by_result_id(self.result_id)
    end
  end
end
