ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 '587',
    domain:               'heroku.com',
    user_name:            ENV["adrien.jourdier@eemi.com"],
    password:             ENV["arrokqbk"],
    authentication:       'plain',
    enable_starttls_auto: true
}