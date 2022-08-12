If (False:C215)
	//object Name: [CONTRACTS]dContr_Sel.Variable17
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
	C_TEXT:C284($_t_oldMethodName; $_t_ContCode; vContCode; vOrderCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].dContr_Sel.Variable17"; Form event code:C388)
If (cNAL=0)
	$_t_ContCode:=vContCode
	Check_ContactNC(->vOrderCode; ->[COMPANIES:2]Company_Code:1; ->[CONTRACTS:17])
	vContCode:=$_t_ContCode
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].dContr_Sel.Variable17"; $_t_oldMethodName)
