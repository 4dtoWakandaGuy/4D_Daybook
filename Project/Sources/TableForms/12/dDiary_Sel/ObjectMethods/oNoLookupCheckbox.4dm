If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oNoLookupCheckbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oNoLookupCheckbox"; Form event code:C388)
<>NAL:=(cNAL=1)
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oNoLookupCheckbox"; $_t_oldMethodName)