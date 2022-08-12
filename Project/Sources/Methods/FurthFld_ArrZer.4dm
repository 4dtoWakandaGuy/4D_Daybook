//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_ArrZer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_ArrZer")
ARRAY TEXT:C222(FUR_at_CustomFieldNames; 0)
ARRAY TEXT:C222(FUR_at_CustomFieldFormat; 0)
ARRAY TEXT:C222(FUR_at_CustomFieldTypes; 0)
ERR_MethodTrackerReturn("FurthFld_ArrZer"; $_t_oldMethodName)