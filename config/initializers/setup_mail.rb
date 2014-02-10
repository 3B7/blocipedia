if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app22047874@heroku.com",
    :password       => "udz0gpdq",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end