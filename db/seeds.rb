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
sengaa_challenge = SingleChallenge.create(title: 'sengaa Challenge', gender: 'every', start: DateTime.new(2009, 9, 14, 8), end: DateTime.new(2009, 9, 15, 8), description: 'This is the ultimate challenge for all fashionistas', category_id: sengaa_category.id, participation_reward_id: sengaa_participation_reward.id)
sengaa_challenge2 = SingleChallenge.create(title: 'sengaa Challenge2', gender: 'male', start: DateTime.new(2009, 9, 14, 8), end: DateTime.new(2009, 9, 15, 8), description: 'This is the ultimate challenge for all fashionistas', category_id: sengaa_category.id, participation_reward_id: sengaa_participation_reward.id)
sengaa_challenge3 = SingleChallenge.create(title: 'sengaa Challenge3', gender: 'female', start: DateTime.new(2009, 9, 14, 8), end: DateTime.new(2009, 9, 15, 8), description: 'This is the ultimate challenge for all fashionistas', category_id: sengaa_category.id, participation_reward_id: sengaa_participation_reward.id)

sengaa_challenge4 = TeamChallenge.create(title: 'sengaa Challenge3', gender: 'female', start: DateTime.new(2009, 9, 14, 8), end: DateTime.new(2009, 9, 15, 8), description: 'This is the ultimate challenge for all fashionistas', category_id: sengaa_category.id, participation_reward_id: sengaa_participation_reward.id)

sengaa_team_challenge_stage1 = TeamChallengeStage.create(challenge_id: sengaa_challenge4.id, end: DateTime.new(2009, 9, 15, 8), bonus: 500)

deal1 = Deal.create(partner: sengaa_partner, link: 'www.sengaa.de', code: '7439027423', description: 'Use this code to buy awesome stuff')

user_a = User.create(username: 'Muki', auth_id: 'google-oauth2|111020572980551184985')
user_b = User.create(username: 'Khan')
user_c = User.create(username: 'Max')

following = Following.create(following_user_id: user_a.id, followed_user_id: user_b.id)

style_1 = Style.create(title: 'Style 1', user_id: user_a.id, challenge_id: sengaa_challenge.id)
style_2 = Style.create(title: 'Style 2', user_id: user_b.id, challenge_id: sengaa_challenge.id)
style_3 = Style.create(title: 'Style 3', user_id: user_c.id, challenge_id: sengaa_challenge.id)

wow1 = Wow.create(user_id: user_a.id, style_id: style_1.id)
wow2 = Wow.create(user_id: user_b.id, style_id: style_2.id)
wow3 = Wow.create(user_id: user_b.id, style_id: style_2.id)
wow4 = Wow.create(user_id: user_b.id, style_id: style_2.id)
wow5 = Wow.create(user_id: user_b.id, style_id: style_1.id)
wow6 = Wow.create(user_id: user_b.id, style_id: style_1.id)
wow7 = Wow.create(user_id: user_b.id, style_id: style_3.id)
wow8 = Wow.create(user_id: user_b.id, style_id: style_3.id)
wow9 = Wow.create(user_id: user_b.id, style_id: style_3.id)
wow10 = Wow.create(user_id: user_b.id, style_id: style_3.id)
wow11 = Wow.create(user_id: user_b.id, style_id: style_3.id)

comment_1 = Comment.create(style_id: style_1.id, user_id: user_b.id, content: 'Looks great :-)')

award_1 = Award.create(title: 'Award', description: 'Awesome Award', code: '447889320', level: 1, style_id: style_1.id)


team = Team.create(name: 'Team1', description: 'Awesome Team', public: true, user_id: user_a.id)
team2 = Team.create(name: 'Team2', description: 'Awesome Team', public: false, user_id: user_b.id)
team3 = Team.create(name: 'Team3', description: 'Awesome Team', public: false, user_id: user_c.id)

#membership1 = Membership.create(team_id: team.id, user_id: user_a.id)
#membership2 = Membership.create(team_id: team2.id, user_id: user_b.id)
#membership3 = Membership.create(team_id: team3.id, user_id: user_c.id)

request1 = TeamRequest.create(user_id: user_a.id, team_id: team2.id)
request2 = TeamRequest.create(user_id: user_a.id, team_id: team3.id)

request3 = TeamRequest.create(user_id: user_b.id, team_id: team.id)
request4 = TeamRequest.create(user_id: user_b.id, team_id: team3.id)

request5 = TeamRequest.create(user_id: user_c.id, team_id: team.id)
request6 = TeamRequest.create(user_id: user_c.id, team_id: team2.id)