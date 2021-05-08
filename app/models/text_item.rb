class TextItem < ApplicationRecord
    belongs_to :inspiration
    belongs_to :writer, class_name: :User, foreign_key: :writer_id
    has_many :ratings
    validates :title, presence: true, length: { minimum: 1 }
    validates :inspiration_id, presence: true
    #just added validates stuff
    def avg_rating
        self.ratings.average(:rating)
    end
end
