-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM

local QuestID = 133;
local ReqClv = 12;
local ReqJlv = 0;
local NextQuest = 346;
local RewZeny = 212;
local RewCxp = 360;
local RewJxp = 0;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 2;
local RewItemCount2 = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	--Saga.AddStep(cid, QuestID, 13301);
	Saga.AddStep(cid, QuestID, 13302);
	Saga.InsertQuest(cid, QuestID, 2);
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

function QUEST_STEP_1(cid)
	Saga.StepComplete(cid, QuestID, 13301);
	return 0;
end

function QUEST_STEP_2(cid)
	--Talk to Klaret Natali
	Saga.AddWaypoint(cid, QuestID, 13302, 1, 1001);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1001
	then
	Saga.GeneralDialog(cid, 3936);
	Saga.SubstepComplete(cid, QuestID, 13302, 1);
	end
	end
	--check if all substeps are completed
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, 13302, i) == false
	then
	return -1;
	end
	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, 13302);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID );
	local ret = -1;

	if CurStepID == 13301 then
		ret = QUEST_STEP_1(cid);
	elseif CurStepID == 13302 then
		ret = QUEST_STEP_2(cid);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
