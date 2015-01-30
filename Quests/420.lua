-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:18 PM

local QuestID = 420;
local ReqClv = 27;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 1162;
local RewCxp = 4002;
local RewJxp = 0;
local RewWxp = 0;
local RewItem1 = 0;
local RewItem2 = 0;
local RewItemCount1 = 0;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 42001);
	Saga.AddStep(cid, QuestID, 42002);
	Saga.AddStep(cid, QuestID, 42003);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	-- Gives all rewards
		Saga.GiveZeny(cid, RewZeny);
		Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
		return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid)
	-- Receive reason from Alina
	Saga.AddWaypoint(cid,QuestID,StepID,1,1054);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1054 then
		Saga.GeneralDialog(cid, 3933);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID,i) == false then
			return -1;
		end
	end
	
	-- Clear waypoints
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid,QuestID,StepID);
	return 0;
end

function QUEST_STEP_2(cid)
	-- Visit Pretan
	Saga.AddWaypoint(cid,QuestID,StepID,1,1024);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1024 then
		Saga.GeneralDialog(cid, 3933);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID,i) == false then
			return -1;
		end
	end
	
	-- Clear waypoints
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid,QuestID,StepID);
	return 0;
end

function QUEST_STEP_3(cid)
	-- Send regards to Mike
	Saga.AddWaypoint(cid,QuestID,StepID,1,1182);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1182 then
		Saga.GeneralDialog(cid, 3933);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid,QuestID,StepID,i) == false then
			return -1;
		end
	end
	
	-- Clear waypoints
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid,QuestID,StepID);
	Saga.QuestComplete(cid,QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID );
	local ret = -1;
	StepID = CurStepID;
	
	if CurStepID == 42001 then
		ret = QUEST_STEP_1(cid);
	elseif CurStepID == 42002 then
		ret = QUEST_STEP_2(cid);
	elseif CurStepID == 42003 then
		ret = QUEST_STEP_3(cid);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid);
	end
	
	return ret;
end
