require "phonegap/version"
require "fileutils"

module PhoneGap
  extend self
  
  def compile(path, options = {})
    platforms = options[:platforms] || []
    compile_ios(path) if platforms.include?(:ios)
  end
  
  def compile_ios(path)
    source = setup(path, :ios)
    puts %x{ xcodebuild -target #{source} -buildstyle Deployment build }
  end
  
  protected
    def setup(path, platform)
      tmp = File.join(path, "build")
      FileUtils.rm_rf(tmp)
      FileUtils.mkdir_p(tmp)

      FileUtils.cp_r(templates(platform), tmp)
      
      web = path
      web = File.join(path, "public") if File.exists?(path, "public")
      web = File.join(path, "www") if File.exists?(path, "www")
      
      FileUtils.cp_r(web, File.join(tmp, "www"))
      FileUtils.cp_r(File.join(path, "platforms", platform), tmp)
      tmp
    end
  
    def templates(*paths)
      File.join(File.dirname(__FILE__), "..", "templates", *paths)
    end
end