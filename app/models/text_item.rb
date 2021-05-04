class TextItem < ApplicationRecord
    belongs_to :inspiration
    belongs_to :writer, class_name: :User, foreign_key: :writer_id
    has_many :ratings

    def avg_rating
        self.ratings.average(:rating)
    end
end
