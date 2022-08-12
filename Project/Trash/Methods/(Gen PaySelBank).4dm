//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen PaySelBank
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vAccount; vBank)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen PaySelBank")
QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=vBank)
vAccount:=[ACCOUNTS:32]Account_Name:3
ERR_MethodTrackerReturn("Gen PaySelBank"; $_t_oldMethodName)