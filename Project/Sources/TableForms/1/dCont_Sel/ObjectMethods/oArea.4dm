If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oArea
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
	C_TEXT:C284($_t_oldMethodName; vArea)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oArea"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vArea; ""; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Area")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oArea"; $_t_oldMethodName)
