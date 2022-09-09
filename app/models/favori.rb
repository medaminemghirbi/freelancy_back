class Favori < ApplicationRecord

  belongs_to :user ,   class_name: "User", foreign_key: "user_id" , optional: true 

  belongs_to :mission ,   class_name: "Mission", foreign_key: "mission_id" , optional: true 
  
end