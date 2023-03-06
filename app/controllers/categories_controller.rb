# require "sinatra/base"
# require "sinatra/namespace"

class CategoriesController < ApplicationController
    register Sinatra::Namespace

    namespace "/api" do
        
        before do
            content_type "application/json"
        end

        def category
            Category.find_by(id: params[:id])
        end

        def halt_with_error
            halt(404, {message: "Todo Not Found!"}.to_json)
        end

        get "/category/all" do
            halt(200, Category.all.to_json)
        end

        get "/category/:id" do
            @record = category
            halt_with_error unless @record
            @record.to_json
        end
        
        get "/category/title/:title" do
            @record = Category.find_by(category: params[:title])
            halt_with_error unless @record
            @record.to_json
        end
        
        patch "/category/:id" do
            @record = category 
            halt_with_error unless @record
            @record.update(category: params[:category])
            halt(202, @record.to_json)
        end

        delete "/category/:id" do
            @record = category
            halt_with_error unless @record
            @record.destroy
            halt(204, @record.to_json)
        end

        post "/category/new" do
            @record = Category.new(category: params[:category])
            if @record.save
                halt(201, @record.to_json)
            else
                halt(202, @record.errors.messages.to_json)
            end
        end

    end

end