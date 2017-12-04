# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sengaa_partner = Partner.create(name: 'sengaa', url: 'challenge')
sengaa_category = Category.create(name: 'Sommer Look')
sengaa_challenge = Challenge.create(title: 'sengaa Challenge', start: DateTime.new(2009,9,14,8), end: DateTime.new(2009,9,15,8), description: 'This is the ultimate challenge for all fashionistas', category_id: sengaa_category.id)
sengaa_participation_award = ParticipationReward.create(title: 'Participation Reward', description: 'Upload a picture and get a free code', partner_id: sengaa_partner.id, challenge_id: sengaa_challenge.id, code: '234380ß834', amount: 10, distributed_amount: 0)