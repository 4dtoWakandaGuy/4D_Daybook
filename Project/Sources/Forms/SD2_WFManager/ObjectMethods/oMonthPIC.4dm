If (False:C215)
	//object Name: Object Name:      SD2_WFManager.oMonthPIC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $s31_MethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.oMonthPIC"; Form event code:C388)

If (True:C214)
	If (False:C215)
		//*****************************************************************************
		////
		////  Object Method: SVG_Test_d.SVG_Month_G
		////
		////  Written by Charles Vass - 02/27/2009, 12:24
		////
		////  Purpose:
		////
		////  $1 - type - purpose
		////
		////
		//*****************************************************************************
	End if 
	$s31_MethodName:=Current method name:C684
	//===========================    Declare Variables     ===========================
	//method_parameters_declarations
	//--------------------------------------------------------------------------------
	//method_wide_constants_declarations
	//--------------------------------------------------------------------------------
	//local_variable_declarations
	
	//===========================    Initialize and Setup    ===========================
	
End if 
//===========================      Method Actions      ===========================

//Cal4D_OM_CalWithMinis_Month (Self;Form event)

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("OBJ SD2_WFManager.oMonthPIC"; $_t_oldMethodName)
