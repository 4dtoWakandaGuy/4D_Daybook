If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oStatus
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oStatus"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vStatus; ""; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status"; "5")
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oStatus"; $_t_oldMethodName)
