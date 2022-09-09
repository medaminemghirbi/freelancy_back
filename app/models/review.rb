class Review < ApplicationRecord

    belongs_to :user, optional: true, counter_cache: true
    belongs_to :mission 
    
# has_one :client, class_name: "client", foreign_key: "client_id"

# has_one :freelancer, class_name: "freelancer", foreign_key: "freelancer_id"

# has_one :mission, class_name: "mission", foreign_key: "mission_id"

end
