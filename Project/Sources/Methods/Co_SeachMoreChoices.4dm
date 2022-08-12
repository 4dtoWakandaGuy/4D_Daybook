//%attributes = {}
If (False:C215)
	//Project Method Name:      Co_SeachMoreChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    18/05/2010 22:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; VC)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Co_SeachMoreChoices")
VC:=1
Comp_SelP
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("Co_SeachMoreChoices"; $_t_oldMethodName)