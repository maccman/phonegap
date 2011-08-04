module PhoneGap
  module Builders
    extend self

    def for_platform(platform)
      builders.find {|b| b.platform == platform }
    end
    
    def builders
      @builders ||= []
    end
    
    def register(builder)
      builders << builder
    end
  end
end

require "phonegap/builders/ios"