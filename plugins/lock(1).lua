do
local function pre_process(msg) 
local r = get_receiver(msg) 
local link = 'link:'..msg.to.id
local fwd = 'fwd:'..msg.to.id
local chat = 'chat:'..msg.to.id
local photo = 'photo:'..msg.to.id
local audio =  'audio:'..msg.to.id
local inline = 'inline:'..msg.to.id
local link2 = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm]%.[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Oo][Rr][Gg]") or msg.text:match("[Gg][Oo][Oo]%.[Gg][Li]/") or msg.text:match("[Aa][Dd][Ff]%.[Ll][Yy]/") or msg.text:match("[Bb][Ii][Tt]%.[Ll][Yy]") or msg.text:match("[Cc][Ff]%.[Ll][Yy]/") or msg.text:match("[Bb][Vv]%.[Vv][Cc]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]")
if redis:get(link) and not is_momod(msg) and link2 then
    delete_msg(msg.id, ok_cb, true)
    send_large_msg(get_receiver(msg), 'اهلا ☺~' ..msg.from.first_name..'\n يمنع نشر (قنوات - اعلانات - روابط - مواقع) التزم بالقوانين📵⛔️\n👤<b>username </b>: @'..msg.from.username or '')
elseif redis:get(fwd) and not is_momod(msg) and msg.fwd_from then
delete_msg(msg.id, ok_cb, true)
send_large_msg(get_receiver(msg), 'اهلا ☺~ ' ..msg.from.first_name..'\n يمنع اعادة التوجيه هنا التزم بالقوانين المجموعة 🔁⛔️\n👤<b>username </b>: @'..msg.from.username or '')
elseif redis:get(chat) and not is_momod(msg) and msg.to.type == 'channel' then
delete_msg(msg.id, ok_cb, true)
send_large_msg(get_receiver(msg), 'اهلا ☺ ~ ' ..msg.from.first_name..'\n المجموعة الان في وضع صامت🔕❎\n👤<b>username</b>: @'..msg.from.username or '')
elseif redis:get(photo) and not is_momod(msg) and msg.media and msg.media.type == 'photo' then
delete_msg(msg.id, ok_cb, true)
send_large_msg(get_receiver(msg), 'اهلا ☺~ ' ..msg.from.first_name..'\n #تنبيه يمنع ارسال الصور هنا  في المجموعة📵⛔️\n👤<b>username</b>: @'..msg.from.username or '')
elseif redis:get(photo) and not is_momod(msg) and msg.media and msg.media.type == 'audio' then
delete_msg(msg.id, ok_cb, true)
send_large_msg(get_receiver(msg), 'اُهلُا ☺~ ' ..msg.from.first_name..'\n #تنبيه يمنع ارسال #الصوتيات 🔇 في المجموعة📵⛔️\n👤معرف المستخدم :: @'..msg.from.username or '')
elseif redis:get(inline) and not is_momod(msg) and msg.text == '[unsupported]' then
delete_msg(msg.id, ok_cb, true)
send_large_msg(get_receiver(msg), 'اهلا ☺~ ' ..msg.from.first_name..'\n يمنع نشر اعلانات بالكايبورد شفاف هنا التزم بقوانين المجموعة ⌨⛔️️\n👤<b> username</b>: @'..msg.from.username or '')
return "done"
       end
   return msg
 end
 
 
local function debye(msg, matches) 
    local debye = msg['id'] 
    chat_id =  msg.to.id 
if is_momod(msg) and matches[1]== 'warn' and matches[2]== 'ads' then
    local link = 'link:'..msg.to.id 
    redis:set(link, true)
    local text = 'تم تفعيل قفل 🔒 الروابط 🔗 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)
    
 elseif is_momod(msg) and matches[1]== 'nwarn' and matches[2]== 'ads' then
    local link = 'link:'..msg.to.id 
    redis:del(link)
    local text = 'تم تعطيل قفل 🔓 الروابط 🔗 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)   
end

if is_momod(msg) and matches[1]== 'warn' and matches[2]== 'fwd' then
    local fwd = 'fwd:'..msg.to.id 
    redis:set(fwd, true)
    local text = 'تم تفعيل قفل التوجيه 🔁 بالتحذير💡'
    return reply_msg(msg.id, text, ok_cb, false)
    
 elseif is_momod(msg) and matches[1]== 'nwarn' and matches[2]== 'fwd' then
    local fwd = 'fwd:'..msg.to.id 
    redis:del(fwd)
    local text = 'تم تعطيل قفل التوجيه 🔁 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)   
end

if is_momod(msg) and matches[1]== 'warn' and matches[2]== 'all' then
    local chat = 'chat:'..msg.to.id 
    redis:set(chat, true)
    local text = '<b> تم وضع #الصامت للمجموعة🔕 لمدة (360) دقيقة⏳ بعدها يمكنكم الارسال✅</b>'
    return reply_msg(msg.id, text, ok_cb, false)
    
 elseif is_momod(msg) and matches[1]== 'nwarn' and matches[2]== 'all' then
    local chat = 'chat:'..msg.to.id 
    redis:del(chat)
    local text = 'تم تعطيل قفل المجموعة 🔓 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)   
end
if is_momod(msg) and matches[1]== 'warn' and matches[2]== 'photo' then
    local photo = 'photo:'..msg.to.id 
    redis:set(photo, true)
    local text = 'تم تفعيل قفل الصور 🔒 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)
    
 elseif is_momod(msg) and matches[1]== 'nwarn' and matches[2]== 'photo' then
    local photo = 'photo:'..msg.to.id 
    redis:del(photo)
    local text = 'تم تعطيل قفل الصور 🔓 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)   
end
if is_momod(msg) and matches[1]== 'warn' and matches[2]== 'audio' then
    local audio = 'audio:'..msg.to.id 
    redis:set(audio, true)
    local text = 'تم تفعيل قفل الصوتيات 🔒 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)
    
 elseif is_momod(msg) and matches[1]== 'nwarn' and matches[2]== 'audio' then
    local audio = 'audio:'..msg.to.id 
    redis:del(audio)
    local text = 'تم تعطيل قفل الصوتيات 🔓 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)
end
if is_momod(msg) and matches[1]== 'warn' and matches[2]== 'inline' then
    local inline = 'inline:'..msg.to.id 
    redis:set(inline, true)
    local text = 'تم تفعيل قفل الكيبورد 🔒 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)
    
 elseif is_momod(msg) and matches[1]== 'nwarn' and matches[2]== 'inline' then
    local inline = 'inline:'..msg.to.id 
    redis:del(inline)
    local text = 'تم تعطيل قفل الكيبورد 🔓 بالتحذير 💡'
    return reply_msg(msg.id, text, ok_cb, false)
end
end
return {
    patterns = {
        '^[/!#](warn) (ads)$',
        '^[/!#](nwarn) (ads)$',
        '^[/!#](warn) (fwd)$',
        '^[/!#](nwarn) (fwd)$',
        '^[/!#](warn) (all)$',
        '^[/!#](nwarn) (all)$',
        '^[/!#](warn) (photo)$',
        '^[/!#](nwarn) (photo)$',
        '^[/!#](warn) (audio)$',
        '^[/!#](nwarn) (audio)$',
        '^[/!#](warn) (inline)$',
        '^[/!#](nwarn) (inline)$'
    },
    run = debye,
    pre_process = pre_process
}
end
