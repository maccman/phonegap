require "fileutils"
require "pathname"

module PhoneGap
  class Builder
    class << self
      def register(platform)
        @platform = platform
        Builders.register self
      end
      
      def platform
        @platform
      end
      
      def process(path, options)
        self.new(path, options).process
      end
    end

    attr_reader :options, :path, :build_path, :web_path

    def initialize(path, options)
      @options    = options
      @path       = Pathname.new(path)
      
      @web_path   = @path.join("public") if @path.join("public").exist?
      @web_path   = @path.join("www") if @path.join("www").exist?
    
      if !@web_path && @path.exist?
        @web_path = @path.dup
        @path     = @path.parent
      end
      
      @build_path = @path.join("build", platform)
      @build_path.mkpath
    end
    
    def process
      generate if options[:generate]
      build if options[:build]
    end
    
    def generate
      raise "Implement"
    end

    def build
      raise "Implement"
    end

    protected
      def setup_build
        FileUtils.rm_rf(build_path)
        FileUtils.mkdir_p(build_path)
      end

      def setup_template
        FileUtils.cp_r(template_path, build_path) if template_path.exist?
      end
      
      def setup_platform
        local_platform_path = path.join("platforms", platform)
        FileUtils.cp_r(local_platform_path, build_path) if local_platform_path.exist?
      end

      def setup_application
        return unless web_path.exist?
        www_path = build_path.join("www")
        www_path.rmtree
        FileUtils.cp_r(web_path, www_path)
      end

      def template_path
        Pathname.new(File.join(File.dirname(__FILE__), *%w{ .. .. templates }, platform))
      end

      def platform_path
        Pathname.new(File.join(File.dirname(__FILE__), *%w{ .. .. platform }, platform))
      end
      
      def platform
        self.class.platform.to_s
      end
  end
end