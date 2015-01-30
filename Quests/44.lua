-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM
--"boiled rice" may be consumable needs testing
--Spanner 7/25/08

local QuestID = 44;
local ReqClv = 13;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 406;
local RewCxp = 1242;
local RewJxp = 508;
local RewWxp = 0;
local RewItem1 = 2641;
local RewItem2 = 0;
local RewItemCount1 = 5;
local RewItemCount2 = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 4401);
	Saga.AddStep(cid, QuestID, 4402);
	Saga.AddStep(cid, QuestID, 4403);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end
function QUEST_FINISH(cid)
	local freeslots = Saga.FreeInventoryCount(cid, 0);
	if freeslots > 1 then
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.GiveItem(cid, RewItem1, RewItemCount1 );
	Saga.GiveItem(cid, RewItem2, RewItemCount2 );
	return 0;
	else
	return -1;
	end

end

function QUEST_CANCEL(cid)
	return 0;
	end

	fucntion QUEST_sTEP_1(cid)
	--Loot Sea Flatro
	--Harvest a Sansam Plant

	Saga.FindQuestItem(cid, QuestID, 4401, 10066, 1670, 6000, 5, 1);
	Saga.FindQuestItem(cid, QuestID, 4401, 10067, 1670, 6000, 5, 1);
	Saga.FindQuestItem(cid, QuestID, 4401, 20, 1669, 10000, 5, 2);
	--Object Activation Toggle
	
	if Saga.IsSubStepCompleted(cid, QuestID, 4401, 2) == false
	then
	Saga.UserUpdateActionObjectType(cid, QuestID, 4401, 20, 0);
	else
	Saga.UserUpdateActionObjectType(cid, QuestID, 4401, 20, 1);
	end

	--check if all substeps are complete
	for i = 1, 2 do
	if Saga.IsSubStepCompleted(cid, QuestID, 4401, i) == false
	then
	return -1;
	end

	end
	Saga.StepComplete(cid, QuestID, 4401);
	return 0;
end

function QUEST_STEP_2(cid)
	--Deliver Material to Averro Reinhold

	Saga.AddWaypoint(cid, QuestID, 4402, 1, 1004);

	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	local ItemCountA = Saga.CheckUserInventory(cid, 1670);
	local ItemCountB = Saga.CheckUserInventory(cid, 1669);
	if ret == 1004
	then
	Saga.GeneralDialog(cid, 3936);
	if ItemCountA > 4 and ItemCountB > 4
	then
	Saga.NpcTakeItem(cid, 1670, 5);
	Saga.NpcTakeItem(cid, 1669, 5);
	Saga.NpCGiveItem(cid, 3561, 1);
	Saga.SubstepComplete(cid, QuestID, 4402, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, 4402, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, 4402);
	return 0;
end

function QUEST_STEP_3(cid)
	--Deliver Rice to Scacciano Morrigan

	Saga.AddWaypoint(cid, QuestID, 4403, 1, 1003);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	local ItemCount = Saga.CheckUserInventory(cid, 3561);
	if ret == 1003
	then
	Saga.GeneralDialog(cid, 3936);
	if ItemCount > 0
	then
	Saga.NpcTakeItem(cid, 3561, 1);
	Saga.SubstepComplete(cid, QuestID, 4403, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, 4403, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, 4403);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end
	
function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID );
	local ret = -1;

	if CurStepID == 4401 then
		ret = QUEST_STEP_1(cid);
	elseif CurStepID == 4402 then
		ret = QUEST_STEP_2(cid);
	elseif CurStepID == 4403 then
		ret = QUEST_STEP_3(cid);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
