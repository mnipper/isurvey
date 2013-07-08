module Isurvey
  module Base
    attr_reader :hash

    def initialize(options)
      @hash = options[:hash]
    end

    def method_missing(method, *args, &block)
      if hash.has_key? method
        @hash[method]
      else
        super
      end
    end
  end
end
