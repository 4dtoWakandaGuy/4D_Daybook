If (False:C215)
	//object Name: [ADDRESS_FORMATS]types_in.Variable4
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ADDRESS_FORMATS].types_in.Variable4"; Form event code:C388)
Gen_ExportButt(->[ADDITIONAL_RECORD_ANALYSIS:53]Export:3)
ERR_MethodTrackerReturn("OBJ [ADDRESS_FORMATS].types_in.Variable4"; $_t_oldMethodName)