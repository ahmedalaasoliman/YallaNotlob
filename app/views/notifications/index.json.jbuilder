json.array! @notifications do |notification|
  json.id  notification.id
  #json.recipient notification.recipient
  json.actor notification.actor.name
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url notification_path(notification.notifiable.order_for , notification.notifiable.order_from ,notification.notifiable.status , anchor: dom_id(notification.notifiable))
end
