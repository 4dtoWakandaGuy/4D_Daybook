If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oCONStatus1
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
	C_TEXT:C284($_t_oldMethodName; vStatus_)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oCONStatus1"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vStatus_; ""; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status"; "1")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oCONStatus1"; $_t_oldMethodName)
