module PhoneGap
  module Builders
    class IOS < Builder
      register :ios
      
      def build
        setup

        create_script = platform_path.join("create_project.sh").to_s
        system(create_script, "app", build_path.to_s)
        
        setup_platform

        build_script = platform_path.join("build.sh").to_s
        system(build_script, "debug", "emulator", build_path.to_s)
      end
    end
  end
end