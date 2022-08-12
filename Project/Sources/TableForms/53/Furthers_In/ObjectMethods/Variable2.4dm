If (False:C215)
	//object Name: [ADDITIONAL_RECORD_ANALYSIS]Furthers_In.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ADDITIONAL_RECORD_ANALYSIS].Furthers_In.Variable2"; Form event code:C388)
Gen_ExportButt(->[ADDITIONAL_RECORD_ANALYSIS:53]Export:3)
ERR_MethodTrackerReturn("OBJ [ADDITIONAL_RECORD_ANALYSIS].Furthers_In.Variable2"; $_t_oldMethodName)