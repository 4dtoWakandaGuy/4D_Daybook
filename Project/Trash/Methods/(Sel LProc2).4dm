//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_LProc2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL; DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_LONGINT:C283(<>BUTTPROC; <>WS_Search_Message; $_l_Event; $2; ch1; ch2; IP_l_SearchMessage; RHold; SM_l_MonitorCall; SRCH_l_TableNumber; SRCH_l_And)
	C_LONGINT:C283(SRCH_l_Not; SRCH_l_or)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_LProc2")
//Sel_LProc2` see also Sel_LProc
If (Count parameters:C259<=1)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$2
End if 

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		RHold:=0
		
		WS_bo_InsearchScreen:=True:C214
		SRCH_l_And:=0
		SRCH_l_or:=0
		SRCH_l_Not:=0
		cNAL:=Num:C11(<>NAL)
		ch1:=0
		ch2:=0
		If ((DB_GetModuleSettingByNUM(1))=5)
			DB_MenuAction("Functions"; "Calculations"; 3; "")
			
			// DISABLE MENU ITEM(2050;21)
		End if 
	: ($_l_Event=On Activate:K2:9)
		
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_Event=On Outside Call:K2:11)
		
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
			<>WS_Search_Message:=0
		Else 
			In_ButtdCall($1)
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("Sel_LProc2"; $_t_oldMethodName)