# require "sinatra/base"
# require "sinatra/namespace"

class StatusesController < ApplicationController
    register Sinatra::Namespace

    namespace "/api" do
        
        before do
            content_type "application/json"
        end

        get "/statuses" do
            @record = Status.lists
            halt(204, {message: "Todo's Statuses Not Found!"}.to_json) unless @record
            halt(200, {statuses: @record}.to_json)
        end

    end

end