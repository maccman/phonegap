require "phonegap/version"

module PhoneGap
  autoload :Builder,  "phonegap/builder"
  autoload :Builders, "phonegap/builders"
  
  def build(path, options = {})
    platforms = options[:platforms] || []
    platforms.each do |platform| 
      Builders.for_platform(platform).build(path, options)
    end
  end
  
  extend self
end