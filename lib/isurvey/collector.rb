module Isurvey
  module Collector
    def all
      ObjectSpace.each_object(self).entries
    end
  end
end
