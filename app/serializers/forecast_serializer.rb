class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :temp
    has_many :hours 
    has_many :days
end 