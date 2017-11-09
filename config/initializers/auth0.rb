Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
      :auth0,
      'npyBD_mrOT4XgQzyK_RHayEAxyHlAVax',
      '-qMgCDv2iCatk5GQaFRX70CTIrKSW7tgH6rsXmJamL5OCGGNivNUcTr80uF0SCfi',
      'sengaa-app.eu.auth0.com',
      callback_path: "/auth/oauth2/callback",
      authorize_params: {
          scope: 'openid profile',
          audience: 'https://sengaa-app.eu.auth0.com/userinfo'
      },
      :provider_ignores_state => true
  )
end