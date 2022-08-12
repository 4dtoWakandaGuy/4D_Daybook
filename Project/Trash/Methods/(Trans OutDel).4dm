//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans OutDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("Trans OutDel")
Gen_Confirm("NB: Only delete to clear Transactions from previous years"; ""; "")
If (OK=1)
	Minor_Del
End if 
ERR_MethodTrackerReturn("Trans OutDel"; $_t_oldMethodName)