require './data_mapper_setup'

class Database

   include DataMapper::Resource

   property :id,     Serial
   property :item,   String
   property :quantity,  Integer
end
