
require 'gcm'


class MessageController < ApplicationController
  def send_push


  	sender = User.where("regid='#{params["sender"]}'").first;

  	type=""
  	user= Array.new
  	if params['user'] == "All"
  		User.all.each do |_user|
  		type="broadcast"
  		user.push(_user.regid)
  		end

  	else
  		 singleReceiver = User.where("username='#{params["user"]}'").first;
  		user.push(params['sender'])
  		user.push(singleReceiver.regid)
  		type = "whisper"
  	end




gcm = GCM.new("AIzaSyBJPHU6C4TYeUvcARkitaQRqzwshdavKU8")
registration_ids= user
options = {data: {msg: "#{params['message']}", sender: "#{sender.username}", type: "#{type}"}, collapse_key: "new_message"}
response = gcm.send_notification(registration_ids, options)
puts response




  end
end
