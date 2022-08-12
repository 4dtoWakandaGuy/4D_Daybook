//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cell_BG_WeekOf
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:51`Method: Cal4D_Cell_BG_WeekOf
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $0; $1; CAL_t_WeekOfRGB)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cell_BG_WeekOf")
$_t_MethodName:=Current method name:C684
//=====================    Declare Variables    ==================================
//method_parameters_declarations
//--------------------------------------------------------------------------------
//method_wide_constants_declarations
//--------------------------------------------------------------------------------
//local_variable_declarations

If (Count parameters:C259=1)
	CAL_t_WeekOfRGB:=$1
End if 

//========================    Clean up and Exit    =================================

$0:=CAL_t_WeekOfRGB
ERR_MethodTrackerReturn("Cal4D_Cell_BG_WeekOf"; $_t_oldMethodName)