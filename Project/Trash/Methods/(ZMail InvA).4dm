//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZMail_InvA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 14:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZMail_InvA")
//ZProc ("Mail_InvA";◊K4;"Mail Invoices Auto")
DBI_MenuDisplayRecords("InvoicesChasing")
ERR_MethodTrackerReturn("ZMail_InvA"; $_t_oldMethodName)