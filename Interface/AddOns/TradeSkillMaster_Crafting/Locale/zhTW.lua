-- ------------------------------------------------------------------------------------- --
-- 					TradeSkillMaster_Crafting - AddOn by Sapu94							 	  	  --
--   http://wow.curse.com/downloads/wow-addons/details/tradeskillmaster_crafting.aspx    --
--																													  --
--		This addon is licensed under the CC BY-NC-ND 3.0 license as described at the		  --
--				following url: http://creativecommons.org/licenses/by-nc-nd/3.0/			 	  --
-- 	Please contact the author via email at sapu94@gmail.com with any questions or		  --
--		concerns regarding this license.																	  --
-- ------------------------------------------------------------------------------------- --

-- TradeSkillMaster_Crafting Locale - zhTW
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_Crafting/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Crafting", "zhTW")
if not L then return end

L["2H Weapon"] = "双手武器" -- Needs review
-- L["Add Crafted Items from this Group to Auctioning Groups"] = ""
-- L["Added %s crafted items to: %s."] = ""
-- L["Added %s crafted items to %s individual groups."] = ""
L["Add Item to New Group"] = "添加到新的群組" -- Needs review
L["Add Item to Selected Group"] = "添加到所選群組" -- Needs review
L["Add Item to TSM_Auctioning"] = "添加到TSM_Auctioning"
L["Additional Item Settings"] = "附加物品設置"
L["Addon to use for alt data:"] = "插件使用分身資料："
-- L["Adds all items in this Crafting group to Auctioning group(s) as per the above settings."] = ""
-- L["AH/Bags/Bank/Mail/Alts"] = ""
L["All"] = "全部" -- Needs review
-- L["All in Individual Groups"] = ""
-- L["All in Same Group"] = ""
-- L["Allows you to override the minimum profit settings for this profession."] = ""
-- L["Allows you to set a custom maximum queue quantity for this item."] = ""
-- L["Allows you to set a custom maximum queue quantity for this profession."] = ""
-- L["Allows you to set a custom minimum ilvl to queue."] = ""
L["Allows you to set a custom minimum queue quantity for this item."] = "允許你為該物品設定加入佇列的最小數值" -- Needs review
-- L["Allows you to set a custom minimum queue quantity for this profession."] = ""
-- L["All vendor items that cost more than this price will not be ignored by the on-hand queue."] = ""
-- L["Always queue this item."] = ""
L["Are you sure you want to delete the selected profile?"] = "你確定刪除當前設定檔？"
L["Armor"] = "護甲" -- Needs review
L["Armor - Back"] = "背部" -- Needs review
L["Armor - Chest"] = "胸部" -- Needs review
L["Armor - Feet"] = "腳" -- Needs review
L["Armor - Hands"] = "手" -- Needs review
L["Armor - Head"] = "頭部" -- Needs review
L["Armor - Legs"] = "腿部" -- Needs review
L["Armor - Shield"] = "盾牌" -- Needs review
L["Armor - Shoulders"] = "肩膀" -- Needs review
L["Armor - Waist"] = "腰帶" -- Needs review
L["Armor - Wrists"] = "手腕" -- Needs review
L["Auctioneer"] = "拍賣"
-- L["Auction House"] = ""
-- L["Auction House Value"] = ""
L["Bags"] = "背包" -- Needs review
-- L["Bars"] = ""
L["Blackfallow Ink"] = "黑棕墨水" -- Needs review
L["Blue Gems"] = "藍色寶石" -- Needs review
L["Boots"] = "靴子" -- Needs review
L["Bracers"] = "護腕" -- Needs review
L["Buy From Vendor"] = "從商人處購買" -- Needs review
-- L["Cannot delete currently active profile!"] = ""
L["Can not set a max restock quantity below the minimum restock quantity of %d."] = "最大物品保持數量不能比最小物品保持數量%d小"
-- L["Can not set a min restock quantity above the max restock quantity of %d."] = ""
-- L["Category to put groups into:"] = ""
-- L["Celestial Ink"] = ""
-- L["Character(s) (comma-separated if necessary):"] = ""
L["Characters to include:"] = "角色包含："
-- L["Character to Send Crafting Costs to:"] = ""
-- L["Checking this box will allow you to set a custom, fixed price for this item."] = ""
-- L["Chest"] = ""
L["Class"] = "職業"
L["Clear Queue"] = "清除序列"
-- L["Clear Tradeskill Filters"] = ""
-- L["Cloak"] = ""
L["Close TradeSkillMaster_Crafting"] = "關閉TradeSkillMaster_Crafting"
-- L["Cloth"] = ""
-- L["Combine/Split Essences/Eternals"] = ""
-- L["Companions"] = ""
-- L["Compressing and sending %s bytes of data to %s. This will take approximately %s seconds. Please wait..."] = ""
-- L["Consumables"] = ""
L["Copy From"] = "複製從"
L["Copy the settings from one existing profile into the currently active profile."] = "複製設定從一個已存在的設定檔導入到目前作用的設定檔。"
-- L["Cost"] = ""
-- L["Cost to Craft"] = ""
L["Craft"] = "製作"
-- L["Crafting Cost"] = ""
-- L["Crafting Cost: %s (%s profit)"] = ""
-- L["Crafting Cost Synchronization"] = ""
L["Crafting Options"] = "製造選項"
-- L["<Crafting Stage #%s>"] = ""
-- L["Craft Item (x%s)"] = ""
-- L["Craft Management Window Settings"] = ""
L["Craft Next"] = "製造下一個"
L["Crafts"] = "製造"
L["Create a new empty profile."] = "建立新的配置設定"
-- L["Create Auctioning Groups"] = ""
L["Current Profile:"] = "目前的配置設定"
-- L["Custom"] = ""
-- L["Custom Value"] = ""
L["DataStore"] = "資料儲存"
L["Default"] = "預設"
L["Delete a Profile"] = "刪除設定檔"
L["Delete existing and unused profiles from the database to save space, and cleanup the SavedVariables file."] = "刪除已存在且未使用的設定檔從資料庫來節省空間和清除SavedVariables檔案。"
L["Disable All Crafts"] = "禁用所有手工藝"
L["Don't queue this item."] = "不排序這件物品。"
L["Double Click Queue"] = "點擊兩次排序"
-- L["Edit Custom Value"] = ""
-- L["Elixir"] = ""
L["Enable All Crafts"] = "啟用所有手工藝"
L["Enable / Disable showing this craft in the craft management window."] = "啟用/禁用顯示手工藝在手工藝管理視窗。"
-- L["Enable New TradeSkills"] = ""
-- L["Enter a value that Crafting will use as the cost of this material."] = ""
-- L["Enter what you want to multiply the cost of the other item by to calculate the price of this mat."] = ""
-- L["Estimated Total Mat Cost:"] = ""
-- L["Estimated Total Profit:"] = ""
-- L["Ethereal Ink"] = ""
L["Existing Profiles"] = "已存在設定檔"
-- L["Explosives"] = ""
-- L["Export Crafts to TradeSkillMaster_Auctioning"] = ""
-- L["Filter out items with low seen count."] = ""
-- L["Flask"] = ""
-- L["Force Rescan of Profession (Advanced)"] = ""
L["Frame Scale"] = "框架縮放"
-- L["General Price Sources"] = ""
-- L["General Setting Overrides"] = ""
-- L["General Settings"] = ""
L["Get Craft Prices From:"] = "獲得手工藝價錢從："
-- L["Get Mat Prices From:"] = ""
-- L["Gloves"] = ""
L["Gold Amount"] = "金額總和" -- Needs review
-- L["Got invalid crafting cost data from %s."] = ""
-- L["Green Gems"] = ""
-- L["Group Inscription Crafts By:"] = ""
-- L["Group to Add Crafts to:"] = ""
L["Guilds to include:"] = "包括的公會：" -- Needs review
-- L["Guns"] = ""
L["Help"] = "幫助" -- Needs review
-- L["Here, you can override default restock queue settings."] = ""
-- L["Here, you can override general settings."] = ""
-- L["Here you can view and adjust how Crafting is calculating the price for this material."] = ""
-- L["How to add crafts to Auctioning:"] = ""
-- L["If a price source is selected, Crafting will use the secondary price source for mat/craft prices if the price source set above doesn't return a valid price."] = ""
-- L["If checked and a secondary price source is selected, Crafting will use the secondary price source if it's a lower price than the main price source for mats/crafts."] = ""
-- L["If checked, any crafts which are already in an Auctioning group will be removed from their current group and a new group will be created for them. If you want to maintain the groups you already have setup that include items in this group, leave this unchecked."] = ""
-- L["If checked, Crafting will account for items you have on the AH."] = ""
-- L["If checked, Only crafts that are enabled (have the checkbox to the right of the item link checked) below will be added to Auctioning groups."] = ""
-- L["If checked, only vendor items below a maximum price will be ignored by the on-hand queue."] = ""
-- L["If checked, the crafting cost of items will be shown in the tooltip for the item."] = ""
-- L["If checked, the on-hand queue will assume you have all vendor items when queuing crafts."] = ""
-- L["If checked, the profit percent (profit/sell price) will be shown next to the profit in the craft management window."] = ""
-- L["If checked, when Crafting scans a tradeskill for the first time (such as after you learn a new one), it will be enabled by default."] = ""
-- L["If checked, you can change the price source for this mat by clicking on one of the checkboxes below. This source will be used to determine the price of this mat until you remove the override or change the source manually. If this setting is not checked, Crafting will automatically pick the cheapest source."] = ""
-- L["If enabled, any craft with a profit over this percent of the cost will be added to the craft queue when you use the \"Restock Queue\" button."] = ""
-- L["If enabled, any craft with a profit over this value will be added to the craft queue when you use the \"Restock Queue\" button."] = ""
-- L["If enabled, any item with a seen count below this seen count filter value will not be added to the craft queue when using the \"Restock Queue\" button. You can overrride this filter for individual items in the \"Additional Item Settings\"."] = ""
-- L["If you use multiple accounts, you can use the steps below to synchronize your crafting costs between your accounts. This can be useful if you craft on one account and would like to post on another account using % of crafting cost as the threshold/fallback. Read the tooltips of the options below for instructions."] = ""
-- L["Ignored crafting cost data from %s since he is not on your list. You will only see this message once per session for this player."] = ""
-- L["Ignore Seen Count Filter"] = ""
-- L["Ignore Vendor Items"] = ""
L["In Bags"] = "在背包中" -- Needs review
-- L["Include Crafts Already in a Group"] = ""
-- L["Include Items on AH"] = ""
L["Ink"] = "墨水" -- Needs review
-- L["Ink of Dreams"] = ""
-- L["Ink of the Sea"] = ""
-- L["Inks"] = ""
-- L["Inscription crafts can be grouped in TradeSkillMaster_Crafting either by class or by the ink required to make them."] = ""
-- L["Invalid item entered. You can either link the item into this box or type in the itemID from wowhead."] = ""
-- L["Invalid money format entered, should be \"#g#s#c\", \"25g4s50c\" is 25 gold, 4 silver, 50 copper."] = ""
-- L["Invalid Number"] = ""
-- L["Invalid target player \"%s\"."] = ""
-- L["Inventory Settings"] = ""
-- L["Item Enhancements"] = ""
-- L["Item Name"] = ""
-- L["Items will only be added to the queue if the number being added is greater than this number. This is useful if you don't want to bother with crafting singles for example."] = ""
-- L["ItemTracker"] = ""
-- L["Item Value"] = ""
-- L["Jadefire Ink"] = ""
-- L["Leather"] = ""
-- L["Left-Click"] = ""
-- L["Left-Click|r on a row below to enable/disable a craft."] = ""
-- L["Level 1-35"] = ""
-- L["Level 36-70"] = ""
-- L["Level 71+"] = ""
-- L["Limit Vendor Item Price"] = ""
-- L["Lion's Ink"] = ""
-- L["Manual Entry"] = ""
-- L["Mark as Unknown (\"----\")"] = ""
-- L["Material Cost Options"] = ""
L["Materials"] = "材料" -- Needs review
-- L["Mat Price"] = ""
-- L["Maximum Price Per Vendor Item"] = ""
-- L["Max Restock Quantity"] = ""
-- L["Meta Gems"] = ""
-- L["Midnight Ink"] = ""
-- L["Mill"] = ""
-- L["Milling"] = ""
-- L["Min Craft ilvl"] = ""
-- L["Min ilvl to craft:"] = ""
L["Minimum Profit (in %)"] = "最小利润（按%）" -- Needs review
L["Minimum Profit (in gold)"] = "最小利润（按金币）" -- Needs review
-- L["Minimum Profit Method"] = ""
-- L["Min Restock Quantity"] = ""
-- L["Misc Items"] = ""
-- L["Multiple of Other Item Cost"] = ""
L["Name"] = "名称" -- Needs review
-- L["Name of New Group to Add Item to:"] = ""
L["Need"] = "需要" -- Needs review
L["New"] = "新" -- Needs review
-- L["<New Group>"] = ""
-- L["<No Category>"] = ""
-- L["No crafts have been added for this profession. Crafts are automatically added when you click on the profession icon while logged onto a character which has that profession."] = ""
-- L["No Minimum"] = ""
-- L["<None>"] = ""
-- L["Note: By default, Crafting will use the second cheapest value (herb or pigment cost) to calculate the cost of the pigment as this provides a slightly more accurate value."] = ""
-- L["NOTE: Milling prices can be viewed / adjusted in the mat options for pigments. Click on the button below to go to the pigment options."] = ""
-- L["Number Owned"] = ""
L["OK"] = "确定" -- Needs review
-- L["On-Hand Queue"] = ""
-- L["Only Included Enabled Crafts"] = ""
-- L["On the account that will be receiving the crafting cost data (ie the account that doesn't have the profession), list the characters that will be sending the crafting cost data below (ie the characters with the profession)."] = ""
-- L["Open Mat Options for Pigment"] = ""
-- L["Open TradeSkillMaster_Crafting"] = ""
-- L["Options"] = ""
-- L["Orange Gems"] = ""
L["Other"] = "其它" -- Needs review
-- L["Other Consumable"] = ""
-- L["Other Item"] = ""
-- L["Override Max Restock Quantity"] = ""
-- L["Override Minimum Profit"] = ""
-- L["Override Min Restock Quantity"] = ""
-- L["Override Price Source"] = ""
-- L["Percent and Gold Amount"] = ""
-- L["Percent of Cost"] = ""
-- L["Percent to subtract from buyout when calculating profits (5% will compensate for AH cut)."] = ""
-- L["per pigment"] = ""
-- L["Place lower limit on ilvl to craft"] = ""
-- L["Potion"] = ""
L["Price:"] = "價格" -- Needs review
-- L["Price / Inventory Settings"] = ""
-- L["Price Multiplier"] = ""
-- L["Price Settings"] = ""
-- L["Price Source"] = ""
-- L["Prismatic Gems"] = ""
-- L["Profession-Specific Settings"] = ""
-- L["Profiles"] = ""
-- L["Profit"] = ""
-- L["Profit Deduction"] = ""
-- L["Purple Gems"] = ""
-- L["# Queued:"] = ""
-- L["Queue Settings"] = ""
-- L["Red Gems"] = ""
-- L["Reset Profile"] = ""
-- L["Reset the current profile back to its default values, in case your configuration is broken, or you simply want to start over."] = ""
-- L["Restock Queue"] = ""
-- L["Restock Queue Overrides"] = ""
-- L["Restock Queue Settings"] = ""
-- L["Right-Click"] = ""
-- L["Right-Click|r on a row below to show additional settings for a craft."] = ""
-- L["Scopes"] = ""
L["Scrolls"] = "卷軸" -- Needs review
-- L["Secondary Price Source"] = ""
-- L["Seen Count Filter"] = ""
-- L["Seen Count Source"] = ""
-- L["Select an Auctioning group to add these crafts to."] = ""
-- L["Select the crafts you would like to add to Auctioning and use the settings / buttons below to do so."] = ""
-- L["Send Crafting Costs"] = ""
-- L["Sending data to %s complete!"] = ""
-- L["Set Crafted Item Cost to Auctioning Fallback"] = ""
-- L["Shield"] = ""
-- L["Shimmering Ink"] = ""
-- L["Show Crafting Cost in Tooltip"] = ""
-- L["Show Craft Management Window"] = ""
-- L["Show Profit Percentages"] = ""
L["%s not queued! Min restock of %s is higher than max restock of %s"] = "%s 不製造！最小的補貨量%s比最大補貨量%s大"
-- L["Staff"] = ""
-- L["Status"] = ""
-- L["Step 2 (on Crafting Account):"] = ""
-- L["Successfully got %s bytes of crafting cost data from %s!"] = ""
-- L["The checkmarks next to each craft determine whether or not the craft will be shown in the Craft Management Window."] = ""
-- L["The item you want to base this mat's price on. You can either link the item into this box or type in the itemID from wowhead."] = ""
-- L["These options control the \"Restock Queue\" button in the craft management window. These settings can be overriden by profession or by item in the profession pages of the main TSM window."] = ""
-- L["This is where TradeSkillMaster_Crafting will get material prices. AuctionDB is TradeSkillMaster's auction house data module. Alternatively, prices can be entered manually in the \"Materials\" pages."] = ""
-- L["This is where TradeSkillMaster_Crafting will get prices for crafted items. AuctionDB is TradeSkillMaster's auction house data module."] = ""
-- L["This item is already in the \"%s\" Auctioning group."] = ""
-- L["This item will always be queued (to the max restock quantity) regardless of price data."] = ""
-- L["This item will not be queued by the \"Restock Queue\" ever."] = ""
-- L["This item will only be added to the queue if the number being added is greater than or equal to this number. This is useful if you don't want to bother with crafting singles for example."] = ""
-- L["This setting determines where seen count data is retreived from. The seen count data can be retreived from either Auctioneer or TradeSkillMaster's AuctionDB module."] = ""
-- L["This will allow you to base the price of this item on the price of some other item times a multiplier. Be careful not to create circular dependencies (ie Item A is based on the cost of Item B and Item B is based on the price of Item A)!"] = ""
-- L["This will determine how items with unknown profit are dealt with in the Craft Management Window. If you have the Auctioning module installed and an item is in an Auctioning group, the fallback for the item can be used as the market value of the crafted item (will show in light blue in the Craft Management Window)."] = ""
-- L["This will set the scale of the craft management window. Everything inside the window will be scaled by this percentage."] = ""
-- L["Times Crafted"] = ""
-- L["Total"] = ""
-- L["TradeSkillMaster_AuctionDB"] = ""
-- L["TradeSkillMaster_Crafting can use TradeSkillMaster_ItemTracker or DataStore_Containers to provide data for a number of different places inside TradeSkillMaster_Crafting. Use the settings below to set this up."] = ""
-- L["TradeSkillMaster_Crafting - Scanning..."] = ""
-- L["Transmutes"] = ""
-- L["Trinkets"] = ""
-- L["TSM_Auctioning Group to Add Item to:"] = ""
-- L["TSM_Crafting - Buy Vendor Items"] = ""
-- L["Type in the name of the player you want to send your crafting cost data to and hit the \"Send\" button. Remember to do step 1 on the character you're trying to send to first!"] = ""
-- L["Unknown Profit Queuing"] = ""
-- L["Use auction house data from the addon you have selected in the Crafting options for the value of this mat."] = ""
-- L["Use Lower of Price Sources"] = ""
-- L["User-Defined Price"] = ""
-- L["Use the links on the left to select which page to show."] = ""
-- L["Use the price of buying herbs to mill as the cost of this material."] = ""
-- L["Use the price that a vendor sells this item for as the cost of this material."] = ""
-- L["Vendor"] = ""
-- L["Vendor Trade"] = ""
-- L["Vendor Trade (x%s)"] = ""
-- L["Warning: The min restock quantity must be lower than the max restock quantity."] = ""
--[==[ L[ [=[Warning: Your default minimum restock quantity is higher than your maximum restock quantity! Visit the "Craft Management Window" section of the Crafting options to fix this!

You will get error messages printed out to chat if you try and perform a restock queue without fixing this.]=] ] = "" ]==]
-- L["Weapon"] = ""
-- L["Weapon - Main Hand"] = ""
-- L["Weapon - One Hand"] = ""
-- L["Weapon - Thrown"] = ""
-- L["Weapon - Two Hand"] = ""
-- L["When you click on the \"Restock Queue\" button enough of each craft will be queued so that you have this maximum number on hand. For example, if you have 2 of item X on hand and you set this to 4, 2 more will be added to the craft queue."] = ""
-- L["When you double click on a craft in the top-left portion (queuing portion) of the craft management window, it will increment/decrement this many times."] = ""
-- L["When you use the \"Restock Queue\" button, it will ignore any items with a seen count below the seen count filter below. The seen count data can be retreived from either Auctioneer or TradeSkillMaster's AuctionDB module."] = ""
-- L["Which group in TSM_Auctioning to add this item to."] = ""
-- L["Yellow Gems"] = ""
-- L["You can change the active database profile, so you can have different settings for every character."] = ""
-- L["You can choose to specify a minimum profit amount (in gold or by percent of cost) for what crafts should be added to the craft queue."] = ""
-- L["You can click on one of the rows of the scrolling table below to view or adjust how the price of a material is calculated."] = ""
-- L["You can either add every craft to one group or make individual groups for each craft."] = ""
-- L["You can either create a new profile by entering a name in the editbox, or choose one of the already exisiting profiles."] = ""
-- L["You can select a category that group(s) will be added to or select \"<No Category>\" to not add the group(s) to a category."] = ""
-- L["You must have your profession window open in order to use the craft queue. Click on the button below to open it."] = ""
