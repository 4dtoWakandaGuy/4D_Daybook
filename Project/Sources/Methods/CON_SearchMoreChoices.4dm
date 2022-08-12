//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_SearchMoreChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/05/2010 15:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vO)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_SearchMoreChoices")
vO:=1
Cont_SelP
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("CON_SearchMoreChoices"; $_t_oldMethodName)