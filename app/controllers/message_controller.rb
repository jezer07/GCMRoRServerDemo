
require 'gcm'


class MessageController < ApplicationController
  def send_push

  	user = User.where("username='#{params["user"]}'").first;
  	sender = User.where("regid='#{params["sender"]}'").first;

gcm = GCM.new("AIzaSyBJPHU6C4TYeUvcARkitaQRqzwshdavKU8")
registration_ids= [user.regid]
options = {data: {msg: "#{params['message']}", sender: "#{sender.username}"}, collapse_key: "new_message"}
response = gcm.send_notification(registration_ids, options)
puts response




  end
end
