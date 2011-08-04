module PhoneGap
  module Builders
    class IOS < Builder
      register :ios
      
      def build
        setup_build

        create_script = platform_path.join("create_project.sh")
        system(
          create_script.to_s, 
          options[:name], 
          build_path.to_s
        )

        setup_template
        setup_application        
        setup_platform

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