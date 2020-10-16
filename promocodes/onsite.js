codes = ["SMYTHSHEADPHONES2020","AMAZONNARWHAL2020","ARGOSWINGS2020","TARGETFOX2020","SPIRIT2020","TWEET2MIL"]
for (let i = 0; i < codes.length; i++) {
	document.getElementById("pin").value = codes[i]
	console.log(codes[i])
	Roblox.GameCard.redeemCode()
}