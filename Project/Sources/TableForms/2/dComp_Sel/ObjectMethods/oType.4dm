If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oType
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
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oType"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Type"; "2")
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oType"; $_t_oldMethodName)
