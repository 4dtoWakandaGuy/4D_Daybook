If (False:C215)
	//object Name: [ANALYSES]dAsk_Analysis.Variable5
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
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ANALYSES].dAsk_Analysis.Variable5"; Form event code:C388)
If (GEN_at_Name<Size of array:C274(GEN_at_Name))
	GEN_at_Name:=GEN_at_Name+1
	GEN_at_RecordCode:=GEN_at_RecordCode+1
	<>Per_t_CurrentDefaultAnalCode:=GEN_at_RecordCode{GEN_at_RecordCode}
End if 
ERR_MethodTrackerReturn("OBJ [ANALYSES].dAsk_Analysis.Variable5"; $_t_oldMethodName)
