#Action Mailer

#We can easily send emails as Active Job is integrated with Action Mailer
# If you want to send the email now use #deliver_now
UserMailer.welcome(@user).deliver_now

# If you want to send the email through Active Job use #deliver_later
UserMailer.welcome(@user).deliver_later
