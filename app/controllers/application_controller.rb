require "sinatra/base"
require "sinatra/namespace"

class ApplicationController < Sinatra::Base

    toto_app = proc { [200, {'Content-Type' => 'text/plain'}, ['ok']] }

    get "/" do
        "Welcome in Todos APP"
    end

end