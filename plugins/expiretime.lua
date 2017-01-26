
local function pre_process(msg)
	local timetoexpire = 'unknown'
	local expiretime = redis:hget ('expiretime', get_receiver(msg))
	local now = tonumber(os.time())
	if expiretime then    
		timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
		if tonumber("0") > tonumber(timetoexpire) and not is_sudo(msg) then
		if msg.text:match('/') then
			return send_large_msg(get_receiver(msg), '☔ <b>ExpireTime Ended.</b> ✅')
		else
			return
		end
	end
	if tonumber(timetoexpire) == 0 then
		if redis:hget('expires0',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '☔ <b>Only [0] Days Please Extend HureyUp /b> ✔.')
		redis:hset('expires0',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 1 then
		if redis:hget('expires1',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '☔ <b><Only And Only 1 Days Please Extend /b> ✔.')
		redis:hset('expires1',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 2 then
		if redis:hget('expires2',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '☔ <b><Only 2 Days Please Extend /b> ✔.')
		redis:hset('expires2',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 3 then
		if redis:hget('expires3',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '☔ <b><Only 3 Days Please Extend /b> ✔.')
		redis:hset('expires3',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 4 then
		if redis:hget('expires4',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '☔ <b><Only 4 Days Please Extend /b> ✔.')
		redis:hset('expires4',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 5 then
		if redis:hget('expires5',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '☔ <b><Only 5 Days Please Extend /b> ✔.')
		redis:hset('expires5',msg.to.id,'5')
	end
end
return msg
end
function run(msg, matches)
	if matches[1]:lower() == 'setexpire' or matches[1]:lower() == 'تفعيل لمدة' then
		if not is_sudo(msg) then return end
		local time = os.time()
		local buytime = tonumber(os.time())
		local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
		redis:hset('expiretime',get_receiver(msg),timeexpire)
		return "✅<b>تم تفعيل البوت👾 ☑️<i>["..matches[2].. "]</i> <b>يوم</b> "
	end
	if matches[1]:lower() == 'expire' or matches[1]:lower() == 'المدة المتبقية' then
		local expiretime = redis:hget ('expiretime', get_receiver(msg))
		if not expiretime then return '⚠ <b>☑️لم تحداد بعد☑️👾</b>' else
			local now = tonumber(os.time())
			return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. "☔  <b>Days</b>"
		end
	end

end
return {
  patterns = {
    "^[!/]([Ss]etexpire) (.*)$",
    "^(تفعيل لمدة) (.*)$",
	"^[!/]([Ee]xpire)$",
	"^(المدة المتبقية)$",
  },
  run = run,
  pre_process = pre_process
}
