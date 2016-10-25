--An empty table for solving multiple kicking problem(thanks to @crazy_sudo )
kicktable = {}
local function run(msg, matches)
if msg.to.type == 'channel' then
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_hashtag'] then
                lock_tag = data[tostring(msg.to.id)]['settings']['lock_hashtag']
            end
        end
    end
    local channel = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_hashtag == "yes" then
        delete_msg(msg.id, ok_cb, false)
        send_large_msg(msg.to.id,'کاربر '..msg.from.print_name..' پیامش به دلیل وجود هشتگ پاک شد !')
    end
end
 end
return {
 usage = {
  "lock tag: If User Send A Message With # , @ Then Bot Removed User.",
  "unlock tag: No Action Execute If User Send Mesage With # , @",
  },
  patterns = {
 "#(.*)",
"(.*)#",
  "^#",
"^#[^%s]+",
"^[^%s]+#",
"^#[%a%d]"
 },
  run = run
}
