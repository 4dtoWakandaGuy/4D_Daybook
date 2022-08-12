If (False:C215)
	//object Name: [DOCUMENTS]dSaveAs.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vTitle1)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dSaveAs.Variable9"; Form event code:C388)
vTitle1:=Uppers2(RemoveLeadTr(vTitle1))
If (Length:C16(vTitle1)>15)
	Gen_Alert("NB: The Code has been shortened to 15 Characters - the maximum available.")
	vTitle1:=Substring:C12(vTitle1; 1; 15)
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dSaveAs.Variable9"; $_t_oldMethodName)
