local function run(msg)
if not is_momod(msg) then
    local data = load_data(_config.moderation.data)

     if data[tostring(msg.to.id)]['settings']['lock_cmd'] == 'yes' then


if msg.to.type == 'channel' and not is_momod(msg) then
	delete_msg(msg.id,ok_cb,false)
	send_large_msg(msg.to.id,'کاربر '..msg.from.print_name..' پیامش به دلیل ارسال دستورات ربات حذف شد!')
	else
	kick_user(msg.from.id, msg.to.id)
    send_large_msg(msg.to.id,'کاربر '..msg.from.print_name..' به دلیل ارسال دستورات ربات از گروه اخراج شد')
        return 
      end
   end
end
end
return {
patterns = {
      "!(.*)",
      "/(.*)"
}, 
run = run
}
