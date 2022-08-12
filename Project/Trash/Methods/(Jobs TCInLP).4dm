//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_TCInLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    25/02/2011 18:09 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; vFromIn; vQueryWithinCurrentSelection)
	C_DATE:C307(vDate; vWIPPostDate)
	C_LONGINT:C283($_l_Event; $_l_PeriodID; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR; vButtDisJob; vWIPPostPeriod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TCInLP")
//Jobs_InLP
$_l_Event:=Form event code:C388


Case of 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		
		
		
		OpenHelp(Table:C252(->[ORDERS:24]); "Jobs_TCIn13")
		
		
		If (vTot=1)
			vTot:=0
			Jobs_TCInLPTot
		End if 
		vFromIn:=After:C31
		
		In_ButtChkDis(->vButtDisJob)
		
	: ($_l_Event=On Outside Call:K2:11)
		
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				
				inButtSubHandle(FORM Get current page:C276; ->[ORDERS:24]; "Jobs_TCIn13")
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				IP_t_MessageReplySTR:=[ORDERS:24]Company_Code:1
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Contact Code"))
				IP_t_MessageReplySTR:=[ORDERS:24]Contact_Code:2
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Record ID"))
				If ([ORDERS:24]x_ID:58=0)
					[ORDERS:24]x_ID:58:=AA_GetNextIDinMethod(->[ORDERS:24]x_ID:58)
				End if 
				IP_t_MessageReplySTR:=String:C10([ORDERS:24]x_ID:58)
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				If (FORM Get current page:C276=2)
					$_Ptr_Table:=->[ORDER_ITEMS:25]
				Else 
					$_Ptr_Table:=->[DIARY:12]
				End if 
				In_ButtCall("R:Jobs_TCInLPA:D:Jobs_TCInLPCan"; ""; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Jobs"; ""; "Jobs_TCInLPB"; "JMaster"; ""; ""; $_Ptr_Table; ->vButtDisJob)
				
				
		End case 
		DB_l_ButtonClickedFunction:=0
		
	: ($_l_Event=On Data Change:K2:15)
		
		Case of 
			: (Modified:C32([ORDERS:24]Your_Order_Number:10))
				Check_MinorNC(->[ORDERS:24]Your_Order_Number:10; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
				If ([ORDERS:24]Your_Order_Number:10#"")
					JobsTC_JobCheck(->[ORDERS:24]Your_Order_Number:10)
				End if 
				If ([ORDERS:24]Your_Order_Number:10#"")
					[ORDERS:24]Source:18:=[JOBS:26]Stage_Code:18
				End if 
				TimeCostEntry_UpdateDescFields  //SET DESCRIPTION VARS-ADDED 29/1/7-KMW
				
				
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([ORDERS:24]Source:18))
				Check_MinorNC(->[ORDERS:24]Source:18; ""; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2; "Stage")
				TimeCostEntry_UpdateDescFields  //SET DESCRIPTION VARS-ADDED 29/1/7-KMW
				
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([ORDERS:24]Person:5))
				Check_MinorNC(->[ORDERS:24]Person:5; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
				TimeCostEntry_UpdateDescFields  //SET DESCRIPTION VARS-ADDED 29/1/7-KMW
				
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([ORDERS:24]Taken_By:17))
				vQueryWithinCurrentSelection:=True:C214  //added -kmw, 29/10/07
				QUERY:C277([RESULTS:14]; [RESULTS:14]Time_Result:3=True:C214)  //added -kmw, 29/10/07
				
				
				
				Check_MinorNC(->[ORDERS:24]Taken_By:17; ""; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Charge Type")
				vQueryWithinCurrentSelection:=False:C215  //added -kmw, 29/10/07
				
				If ([ORDERS:24]Taken_By:17#"")
					If ([RESULTS:14]Time_Result:3=False:C215)
						Gen_Alert("That is not a Time Recording 'Charge Type' Result"; "Cancel")
					End if 
				End if 
				TimeCostEntry_UpdateDescFields  //SET DESCRIPTION VARS-ADDED 29/1/7-KMW
				
			: (Modified:C32([ORDERS:24]Order_Period:42))
				Check_MinorNC(->[ORDERS:24]Order_Period:42; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
				If ([ORDERS:24]Required_Date:9=!00-00-00!)
					[ORDERS:24]Required_Date:9:=[PERIODS:33]From_Date:3
				End if 
				vDate:=[ORDERS:24]Required_Date:9
				Check_PerClose
				[ORDERS:24]Order_Period:42:=[PERIODS:33]Period_Code:1
				DB_bo_RecordModified:=True:C214
				
				vWIPPostDate:=[ORDERS:24]Required_Date:9  //added 21/03/07 -kmw (used by
				vWIPPostPeriod:=[ORDERS:24]Order_Period:42  //added 21/03/07 -kmw
				
				
				
			: (Modified:C32([ORDERS:24]Required_Date:9))
				If ([ORDERS:24]Order_Period:42="")
					vDate:=[ORDERS:24]Required_Date:9
					$_l_PeriodID:=Check_Period
					Check_PerClose
					[ORDERS:24]Order_Period:42:=[PERIODS:33]Period_Code:1
				End if 
				
				vWIPPostDate:=[ORDERS:24]Required_Date:9  //added 21/03/07 -kmw
				vWIPPostPeriod:=[ORDERS:24]Order_Period:42  //added 21/03/07 -kmw
				
				
				
				
			: (vTot=1)
				vTot:=0
				Jobs_TCInLPTot
				DB_bo_RecordModified:=True:C214
			: (vTot2=1)
				vTot2:=0
				
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OpenHelp(Table:C252(->[ORDERS:24]); "Jobs_TCIn13")
		Jobs_TCInLPB
	: ($_l_Event=On Deactivate:K2:10)
		
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Jobs_TCInLP"; $_t_oldMethodName)