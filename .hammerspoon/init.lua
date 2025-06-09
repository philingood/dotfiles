-- Латиница + цифры + пробел + enter
local keyCodeMap = {
	a = 0,
	b = 11,
	c = 8,
	d = 2,
	e = 14,
	f = 3,
	g = 5,
	h = 4,
	i = 34,
	j = 38,
	k = 40,
	l = 37,
	m = 46,
	n = 45,
	o = 31,
	p = 35,
	q = 12,
	r = 15,
	s = 1,
	t = 17,
	u = 32,
	v = 9,
	w = 13,
	x = 7,
	y = 16,
	z = 6,
	["0"] = 29,
	["1"] = 18,
	["2"] = 19,
	["3"] = 20,
	["4"] = 21,
	["5"] = 23,
	["6"] = 22,
	["7"] = 26,
	["8"] = 28,
	["9"] = 25,
	[" "] = 49,
	["\n"] = 36,
}

-- Маппинг кириллицы → QWERTY клавиши (при US на Mac и RU в Windows)
local cyrillicToKeyCodeMap = {
	["й"] = 12,
	["ц"] = 13,
	["у"] = 14,
	["к"] = 15,
	["е"] = 17,
	["н"] = 16,
	["г"] = 32,
	["ш"] = 34,
	["щ"] = 31,
	["з"] = 35,
	["х"] = 33,
	["ъ"] = 30,
	["ф"] = 0,
	["ы"] = 1,
	["в"] = 9,
	["а"] = 0,
	["п"] = 35,
	["р"] = 15,
	["о"] = 31,
	["л"] = 37,
	["д"] = 2,
	["ж"] = 38,
	["э"] = 41,
	["я"] = 6,
	["ч"] = 8,
	["с"] = 1,
	["м"] = 46,
	["и"] = 34,
	["т"] = 17,
	["ь"] = 45,
	["б"] = 11,
	["ю"] = 46,
	["ё"] = 50,
}

local specialCharMap = {
	["@"] = { key = 19, shift = true }, -- Shift + 2
	["#"] = { key = 20, shift = true }, -- Shift + 3
	["\\"] = { key = 42, shift = false }, -- обратный слеш
	["_"] = { key = 27, shift = true }, -- Shift + -
	["-"] = { key = 27, shift = false }, -- -
	["+"] = { key = 24, shift = true }, -- Shift + =
	["="] = { key = 24, shift = false }, -- =
	["!"] = { key = 18, shift = true }, -- Shift + 1
	["1"] = { key = 18, shift = false },
	["2"] = { key = 19, shift = false },
	["3"] = { key = 20, shift = false },
	["."] = { key = 47, shift = false },
	[","] = { key = 43, shift = false },
	[" "] = { key = 49, shift = false },
	-- Добавь ещё по необходимости
}

-- Ввод одного символа
local function tapKey(character)
	local lowerChar = character:lower()

	local keyInfo = nil
	if keyCodeMap[lowerChar] then
		keyInfo = { key = keyCodeMap[lowerChar], shift = character:match("%u") ~= nil }
	elseif cyrillicToKeyCodeMap[lowerChar] then
		keyInfo = { key = cyrillicToKeyCodeMap[lowerChar], shift = character:match("%u") ~= nil }
	elseif specialCharMap[character] then
		keyInfo = specialCharMap[character]
	else
		hs.alert.show("Unsupported char: " .. character)
		print("Unsupported char: " .. character)
		return
	end

	if keyInfo.shift then
		hs.eventtap.event.newKeyEvent("shift", true):post()
	end

	hs.eventtap.event.newKeyEvent(keyInfo.key, true):post()
	hs.eventtap.event.newKeyEvent(keyInfo.key, false):post()

	if keyInfo.shift then
		hs.eventtap.event.newKeyEvent("shift", false):post()
	end

	hs.timer.usleep(5000)
end

-- Основной хоткей
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "V", function()
	local text = hs.pasteboard.getContents()
	if text then
		hs.alert.show("Typing " .. #text .. " chars...")
		for p, c in utf8.codes(text) do
			local ch = utf8.char(c)
			tapKey(ch)
		end
	end
end)

hs.alert.show("Hammerspoon hotkey ready: Cmd+Alt+Ctrl+V")
