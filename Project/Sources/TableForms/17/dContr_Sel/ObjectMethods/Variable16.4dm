If (False:C215)
	//object Name: [CONTRACTS]dContr_Sel.Variable16
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; vCompCode; vJob)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].dContr_Sel.Variable16"; Form event code:C388)
If (cNAL=0)
	$_t_CompanyCode:=vCompCode
	Check_CompanyNC(->vJob; ->[CONTACTS:1]Contact_Code:2; ->[CONTRACTS:17])
	vCompCode:=$_t_CompanyCode
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].dContr_Sel.Variable16"; $_t_oldMethodName)
