//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cell_BG_Selected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $0; $1; CAL_t_SelectedRGB)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cell_BG_Selected")

If (Count parameters:C259=1)
	
	
	CAL_t_SelectedRGB:=$1
	
	
End if 

$0:=CAL_t_SelectedRGB
ERR_MethodTrackerReturn("Cal4D_Cell_BG_Selected"; $_t_oldMethodName)