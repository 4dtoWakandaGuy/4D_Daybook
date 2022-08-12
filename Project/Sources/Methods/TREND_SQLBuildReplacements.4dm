//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_SQLBuildReplacements
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	C_LONGINT:C283($_l_Build)
	C_OBJECT:C1216($_obj_Replacements; $0)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_SQLBuildReplacements")
ARRAY TEXT:C222($_at_Replacements; 0)
ARRAY TEXT:C222($_at_WhattoReplace; 0)
If (Count parameters:C259>=2)
	For ($_l_Build; 1; Count parameters:C259; 2)
		APPEND TO ARRAY:C911($_at_Replacements; ${$_l_Build})
		APPEND TO ARRAY:C911($_at_WhattoReplace; ${$_l_Build+1})
	End for 
	OB SET ARRAY:C1227($_obj_Replacements; "ReplaceWhat"; $_at_WhattoReplace)
	OB SET ARRAY:C1227($_obj_Replacements; "ReplaceWith"; $_at_Replacements)
	$0:=$_obj_Replacements
End if 
ERR_MethodTrackerReturn("TREND_SQLBuildReplacements"; $_t_oldMethodName)