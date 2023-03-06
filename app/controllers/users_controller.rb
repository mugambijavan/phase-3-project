# require "sinatra/base"
# require "sinatra/namespace"

class UsersController < ApplicationController
    register Sinatra::Namespace

    namespace "/api" do
        
        before do
            content_type "application/json"
        end

        def user
            User.find_by(id: params[:id])
        end

        def halt_with_error
            halt(404, {message: "User Not Found!"}.to_json)
        end

        get "/user/all" do
            halt(200, User.all.to_json)
        end

        get "/user/:id" do
            @record = user
            halt_with_error unless @record
            @record.to_json
        end

        patch "/user/:id" do
            @record = user 
            halt_with_error unless @record
            User.update(params[:id], params)
            @record.to_json
        end

        delete "/user/:id" do
            @record = user
            halt_with_error unless @record
            @record.destroy
            halt(204, @record.to_json)
        end

        post "/user/new" do
            @record = User.new(name: params[:name], email: params[:email], password: params[:password])
            if @record.save
                halt(201, @record.to_json)
            else
                halt(202, @record.errors.messages.to_json)
            end
        end

    end

end