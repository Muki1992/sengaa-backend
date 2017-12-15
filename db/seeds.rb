# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sengaa_partner = Partner.create(name: 'sengaa', url: 'challenge')
sengaa_category = Category.create(name: 'Sommer Look')
sengaa_participation_reward = ParticipationReward.create(title: 'Participation Reward', description: 'Upload a picture and get a free code', partner_id: sengaa_partner.id, code: 'df', amount: 10, distributed_amount: 0)
sengaa_challenge = Challenge.create(title: 'sengaa Challenge', start: DateTime.new(2009, 9, 14, 8), end: DateTime.new(2009, 9, 15, 8), description: 'This is the ultimate challenge for all fashionistas', category_id: sengaa_category.id, participation_reward_id: sengaa_participation_reward.id)

user_a = User.create(username: 'Muki')
user_b = User.create(username: 'Khan')
following = Following.create(following_user_id: user_a.id, followed_user_id: user_b.id)

style_1 = Style.create(title: 'Style 1', user_id: user_a.id)
comment_1 = Comment.create(style_id: style_1.id, user_id: user_b.id, content: 'Looks great :-)')
wow1 = Wow.create(user_id: user_b.id, style_id: style_1.id)