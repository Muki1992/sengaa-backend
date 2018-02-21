partner_sengaa = Partner.create(name: 'sengaa', url: 'https://sengaa.com/', logo: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/partner/sengaa.jpeg')

category = Category.create(name: 'Winter')
sengaa_participation_reward = ParticipationReward.create(title: 'Participation Reward', description: 'Upload a picture and get a free code', partner_id: partner_sengaa.id, code: 'df', amount: 10, distributed_amount: 0)

single_challenge = SingleChallenge.create(title: 'Sengaa Challenge', description: 'For honor and glory...', gender: 'every', category_id: category.id,
                                          start: DateTime.new(2016, 9, 1, 17), end: DateTime.new(2019, 9, 1, 17), participation_reward_id: sengaa_participation_reward.id)

team_challenge = TeamChallenge.create(title: 'Sengaa TEAM Challenge', description: 'For honor and glory...', gender: 'every', category_id: category.id,
                                      start: DateTime.new(2016, 9, 1, 17), end: DateTime.new(2019, 9, 1, 17), participation_reward_id: sengaa_participation_reward.id)

stage1 = TeamChallengeStage.create(challenge_id: team_challenge.id, end: DateTime.new(2018, 9, 1, 17), bonus: 10)
stage2 = TeamChallengeStage.create(challenge_id: team_challenge.id, end: DateTime.new(2018, 10, 1, 17), bonus: 10)
stage3 = TeamChallengeStage.create(challenge_id: team_challenge.id, end: DateTime.new(2018, 11, 1, 17), bonus: 10)

muki = User.create(username: 'Muki', picture: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_1.jpg', email: 'test1@googlemail.com')
Style.create(title: 'This is a title', user_id: muki.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_1.jpg')
Style.create(title: 'This is a title', user_id: muki.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/style/style_1.jpg')

marko = User.create(username: 'Marko', picture: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_2.jpg', email: 'test2@googlemail.com')
Style.create(title: 'This is a title', user_id: marko.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_2.jpg')
Style.create(title: 'This is a title', user_id: marko.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/style/style_10.jpg')

beke = User.create(username: 'Beke', picture: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_3.jpg', email: 'test3@googlemail.com')
Style.create(title: 'This is a title', user_id: beke.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_3.jpg')
Style.create(title: 'This is a title', user_id: beke.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/style/style_11.jpg')

aleyna = User.create(username: 'Aleyna', picture: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_4.jpg', email: 'test4@googlemail.com')
Style.create(title: 'This is a title', user_id: aleyna.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_4.jpg')
Style.create(title: 'This is a title', user_id: aleyna.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/style/style_8.jpg')

khan = User.create(username: 'Khan', picture: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_5.jpg', email: 'test5@googlemail.com')
Style.create(title: 'This is a title', user_id: khan.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/user/img_5.jpg')
Style.create(title: 'This is a title', user_id: khan.id, challenge_id: single_challenge.id, image: 'https://s3-eu-west-1.amazonaws.com/new-sengaa/style/style_12.jpg')



