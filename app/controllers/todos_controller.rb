# require "sinatra/base"
# require "sinatra/namespace"

class TodosController < ApplicationController
    register Sinatra::Namespace

    namespace "/api" do
        
        before do
            content_type "application/json"
        end

        def todo
            Todo.find_by(id: params[:id])
        end

        def halt_with_error
            halt(404, {message: "Todo Not Found!"}.to_json)
        end

        get "/todo/all" do
            puts "-> GET Request: todo/all"
            @all_records = Todo.all
            @all_records_filtered = @all_records.to_json(:includes => {
                :status => 
                    {:only => :status}, 
                # :category =>
                #     {:only=>:category}
            })
            halt(200, Todo.all.to_json)
        end

        get "/todo/progress" do
            puts "-> GET Request: todo/progress"
            @record = Todo.left_joins(:status).where(status: {status: "In Progress"})
            @record.to_json(:include => {
                :status => 
                    {:only => :status}, 
                :category =>
                    {:only=>:category}
            })
        end
        
        get "/todo/completed" do
            puts "-> GET Request: todo/completed"
            @record = Todo.left_joins(:status).where(status: {status: "Done"})
            @record.to_json(:include => {
                :status => 
                    {:only => :status}, 
                :category =>
                    {:only=>:category}
            })
        end

        get "/todo/today" do
            puts "-> GET Request: todo/today"
            halt(200, Todo.today.to_json)
        end
        get "/todo/week" do
            puts "-> GET Request: todo/week"
            halt(200, Todo.week.to_json)
        end
        get "/todo/month" do
            puts "-> GET Request: todo/month"
            halt(200, Todo.month.to_json)
        end

        patch "/todo/status/:id" do
            puts "-> GET Request: todo/test"
            @record = todo
            @record.status.update(status: params[:status])
            halt(200, @record.to_json)
        end

        get "/todo/:id" do
            puts "-> GET Request: todo/:id"
            @record = todo
            halt_with_error unless @record
            @record.to_json(:include => { :category => { :only => :category } })
        end

        patch "/todo/:id" do
            puts "-> PATCH Request: todo/:id"
            @record = todo 
            halt_with_error unless @record
            Todo.update(params[:id], params)
            halt(200, @record.to_json)
        end

        delete "/todo/:id" do
            puts "-> DELETE Request: todo/:id"
            @record = todo
            @record_deleted
            halt_with_error unless @record
            @record.destroy
            halt(204, @record_deleted.to_json)
        end

        post "/todo/new" do
            puts "-> POST Request: todo/new"
            @new_todo = params[:todo]
            @new_category = params[:category]
            # binding.pry
            if @new_todo
                @todo_record = Todo.new(title: @new_todo[:title], content: @new_todo[:content])
                if @todo_record.save
                    @todo_record.create_status(status: "In Progress")
                    if @new_category
                        @category_record = Category.new(category: @new_category[:category])
                        if @category_record.save
                            @todo_record.update(category: @category_record) 
                            # binding.pry
                            @newObj = {
                                todo: @todo_record,
                                category: @category_record
                            }
                            halt(201, @newObj.to_json)
                        end
                    else
                        halt(201, @todo_record.to_json)
                    end
                else
                    halt(202, {message: "bad request!!!!"}.to_json)
                end
            end

            
        end

    end

end