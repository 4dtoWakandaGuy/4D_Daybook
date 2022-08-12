If (False:C215)
	//object Name: [USER]CCM_Prefs.Variable39
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CCM_bo_CardLog)
	C_LONGINT:C283($_l_event; CCM_l_LogDecodes)
	C_TEXT:C284($_t_oldMethodName; CCM_t_EmailAddress)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable39"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		CCM_bo_CardLog:=(CCM_l_LogDecodes=1)
		If (CCM_l_LogDecodes=0)
			OBJECT SET VISIBLE:C603(*; "oEmailLabel"; False:C215)
			OBJECT SET VISIBLE:C603(CCM_t_EmailAddress; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oEmailLabel"; True:C214)
			OBJECT SET VISIBLE:C603(CCM_t_EmailAddress; True:C214)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Variable39"; $_t_oldMethodName)
