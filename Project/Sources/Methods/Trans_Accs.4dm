//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_Accs
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
	C_TEXT:C284($_t_oldMethodName; vTitle; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_Accs")
//Trans_Accs
Start_Process
vTitle:="TRANSACTIONS BY ACCOUNT"
vTitle2:="Trans by Account"
Trans_List
ERR_MethodTrackerReturn("Trans_Accs"; $_t_oldMethodName)