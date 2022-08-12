//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelFBook
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Mode; $0; $1; SM_l_Clientorapplic)
	C_TEXT:C284($_t_oldMethodName; $Layout; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelFBook")

$_l_Mode:=0
If (Count parameters:C259>=1)
	$_l_Mode:=$1
End if 

$0:=0
ERR_MethodTrackerReturn("Comp_SelFBook"; $_t_oldMethodName)