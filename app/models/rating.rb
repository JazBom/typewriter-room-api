class Rating < ApplicationRecord
    belongs_to :text_item
    belongs_to :rater, class_name: :User, foreign_key: :rater_id
end
