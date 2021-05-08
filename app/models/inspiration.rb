class Inspiration < ApplicationRecord
    has_many :text_items
    validates :sentence, presence: true, length: { minimum: 1 }
    validates :imageUrl, presence: true, length: { minimum: 1 }
end
