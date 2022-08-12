If (False:C215)
	//object Name: [WEBSETUP_4D]IPRanges.Variable2
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
	//ARRAY TEXT(<>IWS_at_IPRanges;0)
	C_TEXT:C284(<>IWS_t_IPRanges; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].IPRanges.Variable2"; Form event code:C388)

ARRAY TEXT:C222(<>IWS_at_IPRanges; 0)
STR_Text2Array(<>IWS_t_IPRanges; -><>IWS_at_IPRanges)
ARRAY TO LIST:C287(<>IWS_at_IPRanges; "Valid IP Ranges")
IWS_GetValidIPRanges
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].IPRanges.Variable2"; $_t_oldMethodName)
