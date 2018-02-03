ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 '587',
    domain:               'https://fierce-sierra-61774.herokuapp.com/',
    user_name:            ENV["adrien.jourdier@eemi.com"],
    password:             ENV["arrokqbk"],
    authentication:       'plain',
    enable_starttls_auto: true
}