require "phonegap/version"

module PhoneGap
  autoload :Builder,  "phonegap/builder"
  autoload :Builders, "phonegap/builders"
  
  def build(path, options = {})
    platforms = options[:platforms] || [:ios]
    platforms.each do |platform| 
      Builders.for_platform(platform).build(path)
    end
  end
  
  extend self
end