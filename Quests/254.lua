-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:16 PM

local QuestID = 254;
local ReqClv = 18;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 609;
local RewCxp = 2150;
local RewJxp = 860;
local RewWxp = 0;
local RewItem1 = 0;
local RewItem2 = 0;
local RewItemCount1 = 0;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	-- Initialize all quest steps
	Saga.AddStep(cid, QuestID, 25401);
	Saga.AddStep(cid, QuestID, 25402);
	Saga.AddStep(cid, QuestID, 25403);
	Saga.AddStep(cid, QuestID, 25404);

	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid)
	--Talk with Monika Reynolds
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1012);

	--Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1012 then
		Saga.GeneralDialog(cid, 3936);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
			return -1;
		end
	end

	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_2(cid)
	--Talk with Niahong
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1156);

	--Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1156 then
		Saga.GeneralDialog(cid, 3936);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
			return -1;
		end
	end

	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_3(cid)
	--Eliminate Footpad Blue Cape Cat;Eliminate Pirate Blue Cape Cat;
	Saga.Eliminate(cid, QuestID, StepID, 10294, 5, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10295, 5, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10296, 5, 2);
	Saga.Eliminate(cid, QuestID, StepID, 10297, 5, 2);

	-- Check if all substeps are completed
	for i = 1, 2 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
			return -1;
		end
	end

	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_4(cid)
	--Report to Niahong
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1156);

	--Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1156 then
		Saga.GeneralDialog(cid, 3936);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
			return -1;
		end
	end

	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end


function QUEST_CHECK(cid)
	local CurStepID = Saga.GetStepIndex(cid, QuestID );
	StepID = CurStepID;
	local ret = -1;

	if CurStepID == 25401 then
		ret = QUEST_STEP_1(cid);
	elseif CurStepID == 25402 then
		ret = QUEST_STEP_2(cid);
	elseif CurStepID == 25403 then
		ret = QUEST_STEP_3(cid);
	elseif CurStepID == 25404 then
		ret = QUEST_STEP_4(cid);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
