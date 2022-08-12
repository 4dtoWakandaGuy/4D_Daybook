If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oCoType
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
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oCoType"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Type"; "2")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oCoType"; $_t_oldMethodName)
