antinumber = {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then -- Ignore mods,owner,admins
    return
  end
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]['settings']['lock_number'] then
    if data[tostring(msg.to.id)]['settings']['lock_number'] == 'yes' then
	  if is_whitelisted(msg.from.id) then
		return
	  end
      if antinumber[msg.from.id] == true then 
        return
      end
	  if msg.to.type == 'chat' then
		local receiver = get_receiver(msg)
		local username = msg.from.username
		local name = msg.from.first_name
		if username and is_super_group(msg) then
			send_large_msg(receiver , "Number is not allowed here\n@"..username.."["..msg.from.id.."]\nStatus: User kicked/msg deleted")
		else
			send_large_msg(receiver , "Number is not allowed here\nName: "..name.."["..msg.from.id.."]\nStatus: User kicked/msg deleted")
		end
		local name = user_print_name(msg.from)
		savelog(msg.to.id, name.." ["..msg.from.id.."] kicked (number was locked) ")
		local chat_id = msg.to.id
		local user_id = msg.from.id
			kick_user(user_id, chat_id)
		end
		antinumber[msg.from.id] = true
    end
  end
  return
end

local function cron()
  antinumber = {} -- Clear antiarabic table 
end

return {
  patterns = {
    "0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
    "9"
    },
  run = run,
  cron = cron
}

end
