local addonName, addon = ...
local L = addon.L
local function print(...) _G.print("|c259054ffSocialite:|r", ...) end
local frame = addon.frame
frame.name = addonName
frame:Hide()

frame:SetScript("OnShow", function(frame)
  local function newCheckbox(key)
    local label = L[key]
    local description = L[key.."Description"]
    local check = CreateFrame("CheckButton", "SocialiteCheck"..key, frame, "InterfaceOptionsCheckButtonTemplate")
    check:SetScript("OnClick", function(self)
      local tick = self:GetChecked()
      addon:setDB(key, tick and true or false)
      if tick then
        PlaySound(856) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON
      else
        PlaySound(857) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
      end
    end)
    check.label = _G[check:GetName() .. "Text"]
    check.label:SetText(label)
    check.tooltipText = label
    check.tooltipRequirement = description
    return check
  end

  -- Battle.net Friends
  local RealID = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  RealID:SetPoint("TOPLEFT", 16, -16)
  RealID:SetText(L["Battle.net Friends"])

  local ShowRealID = newCheckbox("ShowRealID")
  ShowRealID:SetChecked(addon.db.ShowRealID)
  ShowRealID:SetPoint("TOPLEFT", RealID, "BOTTOMLEFT", -2, -16)

  local ShowRealIDBroadcasts = newCheckbox("ShowRealIDBroadcasts")
  ShowRealIDBroadcasts:SetChecked(addon.db.ShowRealIDBroadcasts)
  ShowRealIDBroadcasts:SetPoint("TOPLEFT", ShowRealID, "BOTTOMLEFT", 0, -8)

  local ShowRealIDFactions = newCheckbox("ShowRealIDFactions")
  ShowRealIDFactions:SetChecked(addon.db.ShowRealIDFactions)
  ShowRealIDFactions:SetPoint("TOPLEFT", ShowRealIDBroadcasts, "BOTTOMLEFT", 0, -8)

  local ShowRealIDNotes = newCheckbox("ShowRealIDNotes")
  ShowRealIDNotes:SetChecked(addon.db.ShowRealIDNotes)
  ShowRealIDNotes:SetPoint("TOPLEFT", ShowRealIDFactions, "BOTTOMLEFT", 0, -8)

  local ShowRealIDApp = newCheckbox("ShowRealIDApp")
  ShowRealIDApp:SetChecked(addon.db.ShowRealIDApp)
  ShowRealIDApp:SetPoint("TOPLEFT", ShowRealIDNotes, "BOTTOMLEFT", 0, -8)

  -- Character friends
  local Friends = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  Friends:SetPoint("TOPLEFT", ShowRealIDApp, "BOTTOMLEFT", 2, -16)
  Friends:SetText(L["Character Friends"])

  local ShowFriends = newCheckbox("ShowFriends")
  ShowFriends:SetChecked(addon.db.ShowFriends)
  ShowFriends:SetPoint("TOPLEFT", Friends, "BOTTOMLEFT", -2, -16)

  local ShowFriendsNote = newCheckbox("ShowFriendsNote")
  ShowFriendsNote:SetChecked(addon.db.ShowFriendsNote)
  ShowFriendsNote:SetPoint("TOPLEFT", ShowFriends, "BOTTOMLEFT", 0, -8)

  -- Tooltip config

  local Tooltip = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  Tooltip:SetPoint("TOPLEFT", ShowFriendsNote, "BOTTOMLEFT", 2, -16)
  Tooltip:SetText(L["Tooltip Settings"])

  -- "ShowStatus" select box
  -- L.MENU_STATUS_ICON
  -- L.MENU_STATUS_TEXT
  -- L.MENU_STATUS_NONE

  -- "TooltipInteraction" select box
  -- L.MENU_INTERACTION_ALWAYS
  -- L.MENU_INTERACTION_OOC
  -- L.MENU_INTERACTION_NEVER

  -- Guild config
  local Guild = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  Guild:SetPoint("TOPLEFT", 320, -16)
  Guild:SetText(L["Guild Members"])

  local ShowGuild = newCheckbox("ShowGuild")
  ShowGuild:SetChecked(addon.db.ShowGuild)
  ShowGuild:SetPoint("TOPLEFT", Guild, "BOTTOMLEFT", -2, -16)

  local ShowGuildLabel = newCheckbox("ShowGuildLabel")
  ShowGuildLabel:SetChecked(addon.db.ShowGuildLabel)
  ShowGuildLabel:SetPoint("TOPLEFT", ShowGuild, "BOTTOMLEFT", 0, -8)

  local ShowGuildNote = newCheckbox("ShowGuildNote")
  ShowGuildNote:SetChecked(addon.db.ShowGuildNote)
  ShowGuildNote:SetPoint("TOPLEFT", ShowGuildLabel, "BOTTOMLEFT", 0, -8)

  local ShowGuildONote = newCheckbox("ShowGuildONote")
  ShowGuildONote:SetChecked(addon.db.ShowGuildONote)
  ShowGuildONote:SetPoint("TOPLEFT", ShowGuildNote, "BOTTOMLEFT", 0, -8)

  local ShowSplitRemoteChat = newCheckbox("ShowSplitRemoteChat")
  ShowSplitRemoteChat:SetChecked(addon.db.ShowSplitRemoteChat)
  ShowSplitRemoteChat:SetPoint("TOPLEFT", ShowGuildONote, "BOTTOMLEFT", 0, -8)

  local GuildSort = newCheckbox("GuildSort")
  GuildSort:SetChecked(addon.db.GuildSort)
  GuildSort:SetPoint("TOPLEFT", ShowSplitRemoteChat, "BOTTOMLEFT", 0, -8)

  local GuildSortInverted = newCheckbox("GuildSortInverted")
  GuildSortInverted:SetChecked(addon.db.GuildSortInverted)
  GuildSortInverted:SetPoint("TOPLEFT", GuildSort, "BOTTOMLEFT", 0, -8)

  -- "GuildSortKey" select box
  -- L.MENU_GUILD_SORT_NAME
  -- L.MENU_GUILD_SORT_RANK
  -- L.MENU_GUILD_SORT_CLASS
  -- L.MENU_GUILD_SORT_NOTE
  -- L.MENU_GUILD_SORT_LEVEL
  -- L.MENU_GUILD_SORT_ZONE

  --

  frame:SetScript("OnShow", nil)
end)
InterfaceOptions_AddCategory(frame)