If (False:C215)
	//object Name: [USER]CCM_Prefs.Variable38
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
	C_BOOLEAN:C305(CCM_bo_CardDecode)
	C_LONGINT:C283($_l_event; CCM_l_AllowDecode; CCM_l_LogDecodes)
	C_TEXT:C284($_t_oldMethodName; CCM_t_EmailAddress)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable38"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		CCM_bo_CardDecode:=(CCM_l_AllowDecode=1)
		If (CCM_l_AllowDecode=0)
			
			OBJECT SET VISIBLE:C603(CCM_l_LogDecodes; False:C215)
			OBJECT SET VISIBLE:C603(*; "oEmailLabel"; False:C215)
			OBJECT SET VISIBLE:C603(CCM_t_EmailAddress; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(CCM_l_LogDecodes; True:C214)
			OBJECT SET VISIBLE:C603(*; "oEmailLabel"; True:C214)
			OBJECT SET VISIBLE:C603(CCM_t_EmailAddress; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Variable38"; $_t_oldMethodName)
