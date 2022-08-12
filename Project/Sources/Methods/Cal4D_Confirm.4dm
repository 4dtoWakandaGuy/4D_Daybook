//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Confirm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:37`Method: Cal4D_Confirm
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Code; $_t_Message; $_t_OkLabel; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Confirm")


$_t_Code:=$1

$_t_OkLabel:="OK"

Case of 
	: ($_t_Code="DeleteConfirm")
		$_t_Message:="Are you sure you want to delete this calendar? "+"All events associated with this calendar will also be deleted."
		$_t_OkLabel:="Delete"
		
	Else   //
		//TRACE  // This shouldn't happen.
End case 

Gen_Confirm($_t_Message; $_t_OkLabel)
ERR_MethodTrackerReturn("Cal4D_Confirm"; $_t_oldMethodName)