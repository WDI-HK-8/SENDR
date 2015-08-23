json.array! @emails do |email|
  json.id         email.id
  json.title      email.title
  json.from       email.from
  json.to         email.to
  json.schedule   email.schedule
  json.content    email.content
  json.is_sent    email.is_sent
  json.visible    email.visible
  json.created_at email.created_at
  json.updated_at email.updated_at
end
