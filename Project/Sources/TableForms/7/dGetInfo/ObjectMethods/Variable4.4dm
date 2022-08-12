If (False:C215)
	//object Name: [DOCUMENTS]dGetInfo.Variable4
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
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dGetInfo.Variable4"; Form event code:C388)
vTitle2:=Uppers2(RemoveLeadTr(vTitle2))
If (Length:C16(vTitle2)>41)
	Gen_Alert("NB: The Description has been shortened to 41 Characters - the maximum available.")
	vTitle2:=Substring:C12(vTitle2; 1; 41)
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dGetInfo.Variable4"; $_t_oldMethodName)
