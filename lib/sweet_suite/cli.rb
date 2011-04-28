require 'thor'

module SweetSuite

  class CLI < Thor

    include Thor::Actions

    desc 'server', 'Starts a server bound to the correct port for this SS application'
    def server
      unless File.exist?('Sweetfile')
        shell.say('Your Sweetfile is missing', :red)
        exit 1
      end

      File.open('Sweetfile', 'r') do |f|
        @app_name = f.readline.strip
        @port_num = f.readline.strip
      end

      shell.say("Starting #{@app_name}...")
      run "rails server thin -p #{@port_num}"

    end


  end
end
