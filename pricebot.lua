-- PID = stn-dTXxp5AysgaOcdH3ohunW_fYL4YHuSPXwEn_1qk

_0RBIT = "WSXUI2JjYUldJ7CKq9wE1MGwXs-ldzlUlHOQszwQe0s"

function handleError(msg, errorMessage)
ao.send({
    Target = msg.From,
    Tags = {
        Action = "Error",
        ["Message-Id"] = msg.Id,
        Error = errorMessage
    }
})
end

Handlers.add("mohammadrifqi",
Handlers.utils.hasMatchingTag("Action", "mohammad-rifqi"),
function(msg)
local token = msg.Tags.Token
local url = "https://api.coingecko.com/api/v3/simple/price" .. "?ids=" .. token .. "&vs_currencies=usd"
ao.send({
    Target = _0RBIT,
    Action = "Get-Real-Data",
    Url = url
})
Handlers.utils.reply("PriceFetch")
(msg)
end
)