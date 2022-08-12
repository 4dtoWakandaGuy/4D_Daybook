If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oAnalysisCON
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vAnalysis)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oAnalysisCON"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vAnalysis; ""; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Further Analysis")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oAnalysisCON"; $_t_oldMethodName)
