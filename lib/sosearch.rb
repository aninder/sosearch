require "sosearch/version"
require 'active_record'
require 'sqlite3'

module Sosearch
  # Your code goes here...
end

ActiveRecord::Base.establish_connection(
   adapter: "sqlite3",
   database: "db/soruby.sqlite",
   pool: "5",
   timeout: "10000"
)

#ActiveRecord::Base.class_eval do
#  m = method(:inherited)
#  define_method self.inherited do |c|
#    c.instance_eval do
#      def hello
#        puts "hi!!"
#      end
#      m.bind(self).call(c)
#    end
#  end
#end
class User < ActiveRecord::Base
end
class Comment < ActiveRecord::Base
end
class Post < ActiveRecord::Base
  has_many :children, :class_name=>"Post", :foreign_key=>"ParentId", :primary_key => "Id"
end
class Search < ActiveRecord::Base
  self.table_name= "searchIndex"
end
