module Isurvey
  module Collector

    def method_missing(method, *args, &block)
      if method.to_s =~ /^find_by_(.+)$/
        to_find = method.to_s.sub(/find_by_/, '')
        all.select { |obj| obj.send(to_find.to_sym) == args.first } 
      else
        super
      end
    end
        
    def all
      ObjectSpace.each_object(self).entries 
    end

    def first
      all.first
    end

    def [](ind)
      all[ind]
    end
  end
end
