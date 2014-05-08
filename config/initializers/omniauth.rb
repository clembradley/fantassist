if Rails.env.development?
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    {
      uid: '12345',
      info:
      {
        first_name: 'Bob',
        last_name: 'Loblaw',
        email: 'bobloblawslawblog@example.com',
        image: 'uiface.jpg'
      }
    }
  )
end
