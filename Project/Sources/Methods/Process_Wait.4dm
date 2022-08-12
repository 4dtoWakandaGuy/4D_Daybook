//%attributes = {}
If (False:C215)
	//Project Method Name:      Process_Wait
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(P_0)
	//C_UNKNOWN(P_1)
	C_TEXT:C284($_t_menuCommand; $_t_oldMethodName; $_t_oldMethodName2; P_0; P_1; <>EXECUTE; $_t_menuCommand; $_t_oldMethodName; $_t_oldMethodName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Process_Wait")

PAUSE PROCESS:C319(Current process:C322)
If (P_0#"")
	$_t_menuCommand:=P_0
	P_0:=""
Else 
	
	$_t_menuCommand:=<>Execute
End if 
<>Execute:=""
Case of 
	: ($_t_menuCommand="Companies_Mod")
		Companies_Mod
	: ($_t_menuCommand="Companies_In")
		DB_MenuNewRecord("Companies")
		
	: ($_t_menuCommand="Contacts_Mod")
		Contacts_Mod
	: ($_t_menuCommand="Diary_In")
		Diary_In
	: ($_t_menuCommand="Diary DiartT")
		Diary_DiaryT
	: ($_t_menuCommand="Diary_DiaryT1")
		Diary_DiaryT1
	: ($_t_menuCommand="Products_Mod")
		Products_Mod
	: ($_t_menuCommand="Orders_Mod")
		Orders_Mod
	: ($_t_menuCommand="Orders_In")
		Orders_In
	: ($_t_menuCommand="Letters_In")
		If (P_1#"")
			Letters_In(P_1)
		Else 
			Letters_In
		End if 
	Else 
		If ($_t_menuCommand#"")
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_menuCommand)
			EXECUTE FORMULA:C63($_t_menuCommand)
		End if 
End case 
P_1:=""
ERR_MethodTrackerReturn("Process_Wait"; $_t_oldMethodName)
