//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Text_Unfold
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_InputString; $_t_MethodName; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Text_Unfold")

$_t_InputString:=$1

//========================    Method Actions    ==================================

$_t_InputString:=Replace string:C233($_t_InputString; "\r\n "; "")
$_t_InputString:=Replace string:C233($_t_InputString; "\r\n\t"; "")

//========================    Clean up and Exit    =================================

$0:=$_t_InputString
ERR_MethodTrackerReturn("Cal4D_Text_Unfold"; $_t_oldMethodName)