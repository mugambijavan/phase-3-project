class CreateCategories < ActiveRecord::Migration[6.1]
    def up
        create_table :categories do |t|     
            t.string :category #, if_not_exists => true, default => "general"
            t.datetime :deleted_at 
            t.timestamps
        end
    end

    def def down 
        drop_table :categories
    end
end
