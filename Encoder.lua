local Handler = {}

function Handler:GetHWID()
  local request = syn and syn.request or request or http.request
  local body = request({Url = 'https://httpbin.org/get', Method = 'GET'}).Body
  local headers = game:GetService('HttpService'):JSONDecode(body).headers
  local hwid = headers['Syn-Fingerprint'] or headers['Sw-Fingerprint'] or nil
  
  return hwid
end

function Handler:Encode(Letters, Numbers, String)
  if not Letters then return end
  if not Numbers then return end
  if not String then return end

  for i = 1,#Numbers do
  	if Numbers[i] and Letters[i] then
  		if string.find(String, Numbers[i]) then
  			String = tostring(string.gsub(String, Numbers[i], Letters[i]))
  		end
  	end
  end

  return String
end

function Handler:Dencode(Letters, Numbers, String)
  if not Letters then return end
  if not Numbers then return end
  if not String then return end

  for i = 1,#Letters do
  	if Letters[i] and Numbers[i] then
  		if string.find(String, Letters[i]) then
  			String = tostring(string.gsub(String, Letters[i], Numbers[i]))
  		end
  	end
  end

  return String
end

return Handler
