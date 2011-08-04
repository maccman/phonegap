require "phonegap/version"
require "fileutils"
require "pathname"

class PhoneGap
  class << self  
    def build(path, options = {})
      platforms = options[:platforms] || [:ios]
      platforms.each {|plat| self.new(path, plat).build }
    end
  end
  
  attr_reader :path, :platform, :build
  
  def initialize(path, platform)
    @path     = Pathname.new(path)
    @platform = platform
    @build    = path.join("build", platform)
    @web      = path
    @web      = path.join("public") if path.join("public").exist?
    @web      = path.join("www") if path.join("www").exist?
  end
  
  def build
    setup
    send("build_#{platform}")
  end
  
  protected
    def setup
      setup_build
      setup_template
      setup_application
    end
    
    def setup_build
      FileUtils.rm_rf(build)
      FileUtils.mkdir_p(build)
    end
    
    def setup_template
      FileUtils.cp_r(templates(platform), build)
    end
    
    def setup_application
      FileUtils.cp_r(web, build.join("www"))
      FileUtils.cp_r(path.join("platforms", platform), build)      
    end
    
    def build_ios
      puts %x{ xcodebuild -target #{path} -buildstyle Deployment build }
    end
  
    def templates(*paths)
      File.join(File.dirname(__FILE__), "..", "templates", *paths)
    end
end