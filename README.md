# PhoneGap command line utilities

Easily build PhoneGap applications from the command line.

##Installation

    gem install phonegap-build
    
You'll need to install the PhoneGap libraries separately from [www.phonegap.com](http://www.phonegap.com/). For iOS, [download the libraries](http://www.phonegap.com/download-thankyou), navigate to the `iOS` folder and install `PhoneGapInstaller.pkg`.
Android is currently not supported.
    
##Usage

    $ phonegap -h
      
      Usage: phonegap [OPTIONS] [build/new] PATH

      Configuration:
              --ios                 Compile iOS applications
              --android             Compile Android applications

      Optional:
              --target [TARGET]     Either 'device' or 'emulator'
              --config [TYPE]       Either 'debug' or 'release'
              --name [NAME]         Application name

      Miscellaneous:
          -?, --help                Display this usage information
          -v, --version             Display version
      
    $ phonegap --ios new ./public
    $ cd ./public
    $ ls build/ios
    $ phonegap build

If a dir called `public` or `www` exists under the specified directory, then phonegap-build will use that instead. The application will be created in a directory called `build`.


      