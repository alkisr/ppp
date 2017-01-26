--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀    BY MOHAMMED HISHAM                ▀▄ ▄▀ 
▀▄ ▄▀   BY MOHAMMEDHISHAM (@TH3BOSS)      ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY MOHAMMED HISHAM       ▀▄ ▄▀ 
▀▄ ▄▀                   كتم الوسائط            ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
—]] 
do 

local function pre_process(msg) 
local mohammed = msg['id'] 
  local user = msg.from.id 
local chat = msg.to.id 
    local moody = 'mate:'..msg.to.id 
    if redis:get(moody) and msg.media and not is_momod(msg) then 

            delete_msg(msg.id, ok_cb, false) 
local test = "اهلا ☺ "..msg.from.first_name.."⌘".."\n".."يمنع نشر صور فيديوهات صوتيات وكافة الميديا هنا التزم بقوانين المجموعة 🎬⛔️".."\n".." 👤 username : @"..(msg.from.username or " ") 
reply_msg(mohammed, test, ok_cb, true) 

end 

        return msg 
    end 

local function MOHAMMED(msg, matches) 
local mohammed = msg['id'] 

    if matches[1] == 'k media'  and is_momod(msg) then 
                    local th3boss= 'mate:'..msg.to.id 
                    redis:set(th3boss, true) 
local boss = '☑️ تم قفل 🔒 جميع الوسائط 🔕'
reply_msg(mohammed, boss, ok_cb, true) 
elseif matches[1] == 'k media' and not is_momod(msg) then 
local moody = '⚠للمشرفين فقط' 
reply_msg(mohammed, moody, ok_cb, true) 
  elseif is_momod(msg) and matches[1] == 'n media' then 
      local th3boss= 'mate:'..msg.to.id 
      redis:del(th3boss) 
local boss = '☑️ تم فتح جميع الوسائط 🔓🔔'
reply_msg(mohammed, boss, ok_cb, true) 
elseif matches[1] == 'n media' and not is_momod(msg) then 
local moody= '⚠للمشرفين فقط' 
reply_msg(mohammed, moody, ok_cb, true) 
end 
end 

return { 
    patterns = { 
    "^[/](k media)$", 
    "^[/](n media)$", 
  }, 
run = MOHAMMED, 
    pre_process = pre_process 
} 

end
