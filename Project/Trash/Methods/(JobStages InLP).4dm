//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/10/2010 16:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JST_LB_ChargeItems;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; vDirectEdit; vFromIn)
	C_LONGINT:C283($_l_Event; $_l_Index; DB_l_ButtonClickedFunction; iCancel; iOK; P_Message; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9)
	C_POINTER:C301($_ptr_Variable)
	C_REAL:C285(Vtot; Vtot2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR; vButtDisSC; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_InLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		P_Message:=0  //added 27/03/07 -kmw
		
		OpenHelp(Table:C252(->[JOB_STAGES:47]); WIN_t_CurrentInputForm)
		JobStages_InLPB
		JobStages_SbLPB
		If (FORM Get current page:C276=1)
			//SET VISIBLE(eALOrdII;False)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; False:C215)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oFootRctJST_LB_ChargeItems"; False:C215)
			For ($_l_Index; 1; 20)
				$_ptr_Variable:=Get pointer:C304("LBi_t_Value"+String:C10($_l_Index))
				OBJECT SET VISIBLE:C603($_ptr_Variable->; False:C215)
			End for 
		Else 
			//SET VISIBLE(eALOrdII;True)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oFootRctJST_LB_ChargeItems"; True:C214)
			For ($_l_Index; 1; 20)
				$_ptr_Variable:=Get pointer:C304("LBi_t_Value"+String:C10($_l_Index))
				OBJECT SET VISIBLE:C603($_ptr_Variable->; True:C214)
			End for 
		End if 
		If (FORM Get current page:C276=1)
			In_ButtChkDis(->vButtDisSC; "Job Stage"; "Job Personnel")
		Else 
			In_ButtChkDis(->vButtDisSC; "Job Stage"; "Cost Item")
		End if 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[JOB_STAGES:47]); "JobStages In13")
		OpenHelp(Table:C252(->[JOB_STAGES:47]); WIN_t_CurrentInputForm)
		If (vTot2=1)
			JobStages_InTo
		End if 
		If (vTot=1)
			JobStages_InT3
		End if 
		vFromIn:=After:C31
		
		If (FORM Get current page:C276=1)
			In_ButtChkDis(->vButtDisSC; "Job Stage"; "Job Personnel")
		Else 
			In_ButtChkDis(->vButtDisSC; "Job Stage"; "Cost Item")
		End if 
		
		If (Records in selection:C76([JOB_STAGES:47])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		If (FORM Get current page:C276=1)
			
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; False:C215)
		Else 
			
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				
				inButtSubHandle(FORM Get current page:C276; ->[JOB_STAGES:47])
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				IP_t_MessageReplySTR:=[JOB_STAGES:47]Job_Code:1
				DB_l_ButtonClickedFunction:=0
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				If (FORM Get current page:C276=2)
					$_ptr_Variable:=->[ORDER_ITEMS:25]
				Else 
					$_ptr_Variable:=->[JOB PERSONNEL:48]
				End if 
				In_ButtCall("JobStages_INLPA"; "Gen_ItemsLPA"; "JobStages_InDel"; ->[JOB_STAGES:47]; ->[JOB_STAGES:47]Stage_Code:2; "Job Stages"; "1 2"; "JobStages_InLPB"; ""; ""; ""; $_ptr_Variable; ->vButtDisSC)
				DB_l_ButtonClickedFunction:=0
			Else 
				
				If (P_Message>0)
					
					Case of 
						: (P_Message=111)  //update job totals
							
							vDirectEdit:=True:C214  //means it will update the job stage time totals to reflect the totals on the job stage personel regardless of Actual and Budget posting checkboxes being turned on on the Job or not
							JC_UpdateJSAllTotals
							
							JC_JSTotalArraysLoadValues
							
					End case 
					P_Message:=0
				End if 
		End case 
	: ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Menu Selected:K2:14)
		JobStages_LP
		If ($_l_Event=On Menu Selected:K2:14)
			DB_SetInputFormMenu(Table:C252(->[JOB_STAGES:47]); "JobStages In13")
			If (vTot2=1)
				JobStages_InTo
			End if 
			If (vTot=1)
				JobStages_InT3
			End if 
			If (FORM Get current page:C276=1)
				In_ButtChkDis(->vButtDisSC; "Job Stage"; "Job Personnel")
			Else 
				In_ButtChkDis(->vButtDisSC; "Job Stage"; "Cost Item")
			End if 
			
			If (Records in selection:C76([JOB_STAGES:47])<=1)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
			If (FORM Get current page:C276=1)
				
				OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; False:C215)
			Else 
				
				OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			End if 
		End if 
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("JobStages_InLP"; $_t_oldMethodName)