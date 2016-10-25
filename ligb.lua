local function run(msg, matches)
  local url2 = http.request('http://api.varzesh3.com/v1.0.live/leaguestat/table/live/900931')
  local jdat2 = json:decode(url2)
  local text2 = ''
  for i = 1 , #jdat2 do
    text2 = text2..'رتبه'..i
    text2 = text2..'\n'..jdat2[i].Team
    text2 = text2..'\nبازی         |'..jdat2[i].Played
 text2 = text2..'\nبرد            |'..jdat2[i].Victories
 text2 = text2..'\nباخت       |'..jdat2[i].Defeats
 text2 = text2..'\nتساوی    |'..jdat2[i].Draws
 text2 = text2..'\nگل زده:    |'..jdat2[i].Made
 text2 = text2..'\nگل خورده|'..jdat2[i].Let
 text2 = text2..'\nتفاصل گل|'..jdat2[i].Diff
 text2 = text2..'\nامتیاز       |'..jdat2[i].Points..'\n\n_________\n'
    end
    return text2..'by @pl_open'
  end
return {
  usage = '',
  patterns = {
    "^(لیگ برتر)$",
 "^(جام خلیج فارس)$",
    "^(لیگ ایران)$"
  },
  run = run
}