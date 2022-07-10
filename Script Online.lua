function login()
Variable = {}
Variable["LoginURL"]= "Paste Link Here" ----- Paste your link Login.php here
Prompt = gg.prompt({"💡Username","💡Password","exit"},nil,{"text","text","checkbox"})
	if not Prompt then
	return
	end
	if Prompt[3] then
	return
	end

Variable["TempLogin"]  = '{"Username":"'..Prompt[1]..'","Password":"'..Prompt[2]..'"}'

ResponseContent = gg.makeRequest(Variable["LoginURL"],nil,Variable["TempLogin"]).content
pcall(load(ResponseContent))
end

function register()
Variable ={}
Variable["RegisterURL"] = "Paste Link Here" ---- Paste Your Link Register.php here
Prompt = gg.prompt({"💡Username","💡Password","💡ConfirmPassword","Back"},nil,{"text","text","text","checkbox"})
	if not Prompt then
	return
	end
	if Prompt[4] then
	return
	end
	

Variable["TempRegister"]  = '{"Username":"'..Prompt[1]..'","Password":"'..Prompt[2]..'","ConfirmPassword":"'..Prompt[3]..'"}'
ResponseContent = gg.makeRequest(Variable["RegisterURL"],nil,Variable["TempRegister"]).content
pcall(load(ResponseContent))
end

function feedback()
Variable = {}
Variable["FeedbackURL"]= "Paste Link Here" ---- Paste Your Link Feedback.php here
Prompt = gg.prompt({"⚠️Your Name :","⚠️Your Feedback :","exit"},nil,{"text","text","checkbox"})
	if not Prompt then
	return
	end
	if Prompt[3] then
	return
	end

Variable["TempFeedback"]  = '{"Username":"'..Prompt[1]..'","Feedback":"'..Prompt[2]..'"}'

ResponseContent = gg.makeRequest(Variable["FeedbackURL"],nil,Variable["TempFeedback"]).content
pcall(load(ResponseContent))
gg.alert("❗Your Feedback Succes Sended!")
end

function changelog()
gg.alert("✉️ Change-log :\n\t\t\t\t- Your New Update\n\t\t\t\t- Your New Update") ---Add your new update with Copy This code : \n\t\t\t\t- (Your New Update)
end

MyMenu = {
	{"💡Script Online", true}, {
		"💡Login", login,
		"💡Register", register,
		"✉️ Feedback", feedback,
		"✉️ Change log", changelog,
		}
}

gg.alert("Script Online")
function initMenu(Menu, prevMenu)
	local title, menuType, cOpt, _opt = Menu[1][1], Menu[1][2], {{},{}}
	for _ = 1, #Menu[2], 2 do
		name, func = Menu[2][_], Menu[2][_ + 1]
		cOpt[1][#cOpt[1] + 1] = (type(func) == "table" and name.." >" or name)
		cOpt[2][#cOpt[2] + 1] = func
	end
	cOpt[1][#cOpt[1] + 1] = (prevMenu and "< Back to " .. prevMenu[1][1] or "Quit Script")

	while(true) do
		if gg.isVisible() then gg.setVisible(false)
			if menuType then _opt = gg.multiChoice(cOpt[1], nil, title) else _opt = gg.choice(cOpt[1], nil, title) end
			if _opt then
				-- Sorry for messy code for menuType handler.
				if not menuType then
					-- choice Handler
					efunc = cOpt[2][_opt]
					if efunc then
						if type(efunc) ~= "table" then efunc() else gg.setVisible(true) initMenu(efunc, Menu) end
					else
						gg.setVisible(true)
						return
					end
				else
					-- multiChoice Handler  
					for _ = 1, #cOpt[1] do
						if _opt[_] then
							efunc = cOpt[2][_]
							if efunc then
								if type(efunc) ~= "table" then efunc() else gg.setVisible(true) initMenu(efunc, Menu) end
							else
								gg.setVisible(true)
								return
							end
						end
					end
				end
			end
		end
		gg.sleep(300)
	end
end

initMenu(MyMenu)