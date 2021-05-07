# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(name: 'jess', password: 'abc123')
User.create(name: 'colin', password: 'def456')
User.create(name: 'seb', password: 'ghi789')
User.create(name: 'bash', password: 'jkl000')

Inspiration.create(sentence: 'it was the best of times, it was the worst of times...', sentenceOf: 'charles dickens', imageUrl: 'https://i.imgur.com/LTeu8Pr.jpg', imageOf: 'coffee')
Inspiration.create(sentence: 'ich bin ein berliner', sentenceOf: 'john f kennedy', imageUrl: 'https://i.imgur.com/hiJzNhh.jpg', imageOf: 'uffizi')
Inspiration.create(sentence: 'ich bin ein berliner', sentenceOf: 'john f kennedy', imageUrl: 'https://i.imgur.com/LTeu8Pr.jpg', imageOf: 'coffee')
Inspiration.create(sentence: 'it was the best of times, it was the worst of times...', sentenceOf: 'charles dickens', imageUrl: 'https://i.imgur.com/hiJzNhh.jpg', imageOf: 'uffizi')

TextItem.create(title: 'Story 1', text: 'This is story 1', published: false, writer_id: 1, inspiration_id: 1)
TextItem.create(title: 'Story 2', text: 'This is story 2', published: true, writer_id: 2, inspiration_id: 2)
TextItem.create(title: 'Story 3', text: 'This is story 3', published: false, writer_id: 3, inspiration_id: 3)
TextItem.create(title: 'Story 4', text: 'This is story 4', published: true, writer_id: 4, inspiration_id: 4)

Rating.create(text_item_id: 1, rater_id: 2, rating: 4.5)
Rating.create(text_item_id: 1, rater_id: 3, rating: 2)
Rating.create(text_item_id: 1, rater_id: 4, rating: 4.5)
Rating.create(text_item_id: 2, rater_id: 1, rating: 5)
Rating.create(text_item_id: 2, rater_id: 3, rating: 3.5)
Rating.create(text_item_id: 2, rater_id: 4, rating: 2.5)
Rating.create(text_item_id: 3, rater_id: 1, rating: 4)
Rating.create(text_item_id: 3, rater_id: 2, rating: 3.5)
Rating.create(text_item_id: 3, rater_id: 4, rating: 2.5)
Rating.create(text_item_id: 4, rater_id: 1, rating: 3)
Rating.create(text_item_id: 4, rater_id: 2, rating: 3.5)
Rating.create(text_item_id: 4, rater_id: 3, rating: 4.5)
