class CreateTodosStatus < ActiveRecord::Migration[6.1]
    def up
        create_table :statuses do |t|
            t.string :status, default: "In Progress"
            t.references :todo, foreign_key: true
        end
    end

    def def down 
        drop_table :statuses
    end
end
