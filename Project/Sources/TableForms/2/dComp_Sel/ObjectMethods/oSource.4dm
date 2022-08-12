If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oSource
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vSource)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oSource"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vSource; ""; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Source"; "2")
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oSource"; $_t_oldMethodName)
