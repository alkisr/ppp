do-- by @Dev_ar
local function Dev_ar(msg,matches)
if matches[1] == "chat_add_user" then 
 local add = "اهلا بك☺~ منور (ة) /n الاسم: " ..msg.action.user.first_name.."\n".."🎗 معرفك : @"..(msg.action.user.username or " " ).."\n"
return add 
elseif matches[1] == "chat_add_user_link" then
 local lin = "اهلا ☺~ منور)ة( \n الاسم: " ..msg.from.first_name.."\n".."\n".."👤<b>username</b> : @"..(msg.from.username or "" ).."\n"
return lin
end
if matches[1] == "chat_del_user" then
 local bye = "🎗 وداعاً عزيزي 😔❤️ \n🎗 الأسم : "..msg.action.user.first_name.."\n".."🎗 المعرف : @"..(msg.from.username or "").."\n"
return bye 
end
end
return {
patterns = {
 "^!!tgservice (chat_add_user)$",
 "^!!tgservice (chat_add_user_link)$",
 "^!!tgservice (chat_del_user)$"
},
 run = Dev_ar,
}
end
-- by dev : @Dev_ar
-- the Serious :)
