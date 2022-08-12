//%attributes = {}
If (False:C215)
	//Project Method Name:      Modified_AG
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

$_t_oldMethodName:=ERR_MethodTracker("Modified_AG")
//Macro Code Modified 9/5
COMPILER_MACROS
If ([PRODUCTS:9]Group_Code:3="ASS")
	If ([PRODUCTS:9]Model_Code:5#"#@")
		Gen_Alert("This is an asset. Model must begin '#'")
		[PRODUCTS:9]Model_Code:5:=""
	End if 
End if 
ERR_MethodTrackerReturn("Modified_AG"; $_t_oldMethodName)