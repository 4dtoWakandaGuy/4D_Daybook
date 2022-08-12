//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InDel")
DB_t_CurrentFormUsage:="One"
Contacts_InMCA
Contacts_Del
ERR_MethodTrackerReturn("Contacts_InDel"; $_t_oldMethodName)