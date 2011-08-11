module PhoneGap
  module Builders
    class IOS < Builder
      register :ios
      
      def generate
        setup_build
        
        create_script = platform_path.join("create_project.sh")
        system(
          create_script.to_s, 
          options[:name], 
          build_path.to_s
        )
      
        setup_template
      end
      
      def build
        setup_platform
        setup_application
        
        build_script = platform_path.join("build.sh")
        system(
          build_script.to_s, 
          options[:config], 
          options[:target], 
          build_path.to_s
        )
      end
    end
  end
end