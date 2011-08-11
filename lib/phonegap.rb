require "phonegap/version"

module PhoneGap
  autoload :Builder,  "phonegap/builder"
  autoload :Builders, "phonegap/builders"
  
  def process(path, options = {})
    platforms = options[:platforms] || []
    platforms.each do |platform| 
      Builders.for_platform(platform).process(path, options)
    end
  end
  
  extend self
end