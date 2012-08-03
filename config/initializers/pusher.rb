unless Rails.env.production?
  Pusher.app_id = '22092'
  Pusher.key = 'acecc5ffed2935bdc2d9'
  Pusher.secret = ENV['PUSHER_SECRET']
end
