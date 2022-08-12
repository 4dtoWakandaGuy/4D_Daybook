//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/10/2010 08:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; Gen_bo_StateModified; PAL_bo_ButtonSubFunction; vDirectEdit; vFromIn; vUpdateActualCostTotal; vUpdateActualTimeTotal; vUpdateBudgetCostTotal; vUpdateBudgetTimeTotal)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; P_Message; PAL_but_LastRecord; PAL_but_PreviousRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_FirstRecord; vAB)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(vTot; vTot3)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisJob; vCurrentStageDesc; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLP")
$_l_Event:=Form event code:C388  //Jobs_InLP

Case of 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[JOBS:26]); "Job_In")
		If (Records in selection:C76([JOBS:26])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		OpenHelp(Table:C252(->[JOBS:26]); WIN_t_CurrentInputForm)
		If (vTot3=1)
			vTot3:=0
			Jobs_InLPOI
			//Jobs_InLPTot
		End if 
		If (vFromIn)
			States_CUArr(->[JOBS:26]State:9)
		End if 
		vFromIn:=After:C31
		
		Case of 
			: (FORM Get current page:C276=1)
				In_ButtChkDis(->vButtDisJob; "Job"; "Job Stage")
			: (FORM Get current page:C276=3)
				In_ButtChkDis(->vButtDisJob; "Job"; "Cost Item")
		End case 
		
		
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				
				inButtSubHandle(FORM Get current page:C276; ->[JOBS:26]; "Job_In")
				
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				If (FORM Get current page:C276=3)
					$_Ptr_Table:=->[ORDER_ITEMS:25]
				Else 
					$_Ptr_Table:=->[JOB_STAGES:47]
				End if 
				In_ButtCall("P:Jobs_InLPA:D:Jobs_InCan"; ""; "Jobs_InDel"; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; "Jobs"; "1 3"; "Jobs_InLPPB"; "JMaster"; "Jobs_Sel"; ""; $_Ptr_Table; ->vButtDisJob)
				
			Else 
				
				
				If (P_Message>0)
					Case of 
						: (P_Message=111)  //update job totals
							P_Message:=0
							
							//19/03/07 -kmw - moved to here from object method because it takes a while to run and this way 4D shoul dhave worked out which clicks are actually double clicks (previously because the below code takes a while to run and the on click/on double click was running after it - 4d was seeing on clicks as on double clicks)
							DB_SaveRecord(->[ORDER_ITEMS:25])
							DB_SaveRecord(->[JOB_STAGES:47])
							vDirectEdit:=True:C214  //means it will update the job time totals to reflect the totals on the job stages regardless of Actual and Budget posting checkboxes being turned on or not
							JC_UpdateJobAllTotals
							
							JC_JobTotalArraysLoadValues  //added kmw 19/03/07, more appropriate place to update arrays - ie after any re-calc of field values
					End case 
				End if 
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		
		Gen_ChkMod2
		Jobs_InLPD
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[JOBS:26]); "Job_In")
				End if 
				BAR_t_Button:=""
			: (Modified:C32([JOBS:26]Stage_Code:18))
				Check_MinorNC(->[JOBS:26]Stage_Code:18; "Stage"; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
				vCurrentStageDesc:=[STAGES:45]Stage_Name:2  //added 22/03/07 -kmw (not sure why the check for stage code modification isn't in Jobs_InLPD with all the others but left it here where i found it)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[JOBS:26]Stage_Code:18)
			: (vTot3=1)
				vTot3:=0
				//Jobs_InLPTot
				DB_bo_RecordModified:=True:C214
			: (vTot=1)
				vTot:=0
				If (vAB=0)
					//Jobs_InLPTot3
					//Jobs_InLPTot2
				End if 
				DB_bo_RecordModified:=True:C214
			Else 
				If (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
				End if 
				If ($_l_Event=On Menu Selected:K2:14)
					DB_SetInputFormMenu(Table:C252(->[JOBS:26]); "Job_In")
					If (Records in selection:C76([JOBS:26])<=1)
						OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					If (vTot3=1)
						vTot3:=0
						Jobs_InLPOI
						//Jobs_InLPTot
					End if 
					Case of 
						: (FORM Get current page:C276=1)
							In_ButtChkDis(->vButtDisJob; "Job"; "Job Stage")
						: (FORM Get current page:C276=3)
							In_ButtChkDis(->vButtDisJob; "Job"; "Cost Item")
					End case 
				End if 
		End case 
		If (False:C215)  //no longer needed 19/02/07 -kmw
			//********************************added 13/02/07 -kmw *****************************  `*
			//The above vTot totaling system seems to be at least partially broken...possibly d  `ue to differences in the way 2004 handles event management...hopefully the follow  `ing should work.
			//NOTE: The main point of these calls being placed here is so that upon direct job   `stage value alteration the screen provides immediate feedback to the user on what  ` the Job totals currently are...
			//...job totals are in fact also updated via process services using a cascading sys  `tem where alterations to child records cause updates to totals on parent records   `cause more process service calls etc...
			If (vUpdateActualTimeTotal)
				vUpdateActualTimeTotal:=False:C215
				JC_UpdateJobActualTime
			End if 
			If (vUpdateBudgetTimeTotal)
				vUpdateBudgetTimeTotal:=False:C215
				JC_UpdateJobBudgetTime
			End if 
			If (vUpdateActualCostTotal)
				vUpdateActualCostTotal:=False:C215
				JC_UpdateJobActualCost
			End if 
			If (vUpdateBudgetCostTotal)
				vUpdateBudgetCostTotal:=False:C215
				JC_UpdateJobBudgetCost
			End if 
		End if 
		//******************************************************************************
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		Gen_bo_StateModified:=False:C215
		P_Message:=0  //added 27/03/07 -kmw
		
		OpenHelp(Table:C252(->[JOBS:26]); WIN_t_CurrentInputForm)
		ARRAY POINTER:C280(JOB_aPtr_OrderItemsSetup; 0)
		Jobs_InLPPB
		//vCompNameAndTel:=vCompName+"   "+vTel  `added 16/01/07 - kmw (couldn't find where vCompName and vTel get set on load but   `this line would be better off there)
		//Above line moved to "Jobs_CompRel" 22/03/07 -kmw
		
		If (False:C215)  //no longer needed 19/02/07 -kmw
			vUpdateActualTimeTotal:=False:C215  //added 13/02/07 - kmw (not sure if this best place for this)
			vUpdateBudgetTimeTotal:=False:C215  //added 13/02/07 - kmw (not sure if this best place for this)
			vUpdateActualCostTotal:=False:C215  //added 13/02/07 - kmw (not sure if this best place for this)
			vUpdateBudgetCostTotal:=False:C215  //added 13/02/07 - kmw (not sure if this best place for this)
		End if 
		Case of 
			: (FORM Get current page:C276=1)
				In_ButtChkDis(->vButtDisJob; "Job"; "Job Stage")
			: (FORM Get current page:C276=3)
				In_ButtChkDis(->vButtDisJob; "Job"; "Cost Item")
		End case 
		
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Jobs_InLP"; $_t_oldMethodName)