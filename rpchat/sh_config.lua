--[[-------------------------------------------------------------------------
You are free to use, distribute and change this module, as long as you keep
this text here - and/or credit me:

Made by Fillipuster & Lord Robb :D
---------------------------------------------------------------------------]]

SIMPLERP = SIMPLERP or {}

--[[-------------------------------------------------------------------------
					CLASSIC RP CONFIG
---------------------------------------------------------------------------]]

-- The prefix before the adverted text (but after the sending player's name).
SIMPLERP.chatPrefix = "[RP]"

-- The failure message id the players fails to provide text for the advert.
SIMPLERP.failMessage = "You need to provide an action."

-- The chat command for adverts. (A "/" is added at the front automatically.)
SIMPLERP.chatCommand = "rp" -- Please, do not use "/advert" as it is used for the new advert system in DarkRP.

-- The F1 (help menu) description of the advert command.
SIMPLERP.commandDescription = "RP CHAT."

-- The delay (in seconds) between players being able to advert.
SIMPLERP.commandDelay = 0

--[[-------------------------------------------------------------------------
					END OF CONFIG
---------------------------------------------------------------------------]]

DarkRP.declareChatCommand{
    command = SIMPLERP.chatCommand,
    description = SIMPLERP.commandDescription,
    delay = SIMPLERP.commandDelay
}