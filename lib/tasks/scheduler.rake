task :send_email => :environment do
  Email.where("schedule <= ? AND is_sent = ?", Time.zone.now, false).each do |email|
    test = Hash.new
    test[:schedule] = email.schedule
    test[:to] = email.to
    test[:title] = email.title
    test[:from] = email.from
    test[:content] = email.content
    test_email = Email.new(test)
    MainMailer.send_email(test_email).deliver_now
    email.update({:is_sent => true})
  end
end
