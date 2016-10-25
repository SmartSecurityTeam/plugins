-- plugin ids-random by @plustm 
local text1 = { 
"√", 
"#", 
"=>", 
"<>", 
">>", 
} 
local text2 = { 
"√", 
"#", 
"=>", 
"<>", 
">>", 
} 
local function run(msg, matches) 
local id = msg.from.id
local gpid = msg.to.id
local user = msg.from.username
local channel = 'ALPHAPLUSTM'
local bot = 'AlphaPlusTG'
local cmd = msg.text
local r1 = text1[math.random(#text1)]
local r2 = text2[math.random(#text2)]
local text = r2.."ایدی ربات:(@"..bot..")\n➖➖➖➖➖➖➖➖➖➖➖\n"..r1.."ایدی شما:("..id..")\n"..r1.."یوزرنیم:(@"..user..")\n"..r1.."ایدی گروه:("..gpid..")\n"..r1.."دستور شما:("..cmd..")\n➖➖➖➖➖➖➖➖➖➖➖\n"..r2.."کانال:(@"..channel..")"
return text
end 
return { 
  patterns = { 
     "^(ایدی)$"
  }, 
  run = run 
} 
-- Create By @Mr_Nitto :-D