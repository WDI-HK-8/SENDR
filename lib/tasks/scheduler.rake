task :send_email => :environment do
  Email.where("schedule <= ? AND is_sent = ?", Time.zone.now, false).each do |email|
    hash = Hash.new
    hash[:schedule] = email.schedule
    hash[:to]       = email.to
    hash[:title]    = email.title
    hash[:from]     = email.from
    hash[:content]  = email.content
    test_email      = Email.new(hash)
    MainMailer.send_email(test_email).deliver_now
    email.update({:is_sent => true})
  end
end
