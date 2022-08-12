If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oContractCode
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
	C_TEXT:C284($_t_oldMethodName; vContrCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].dItems_Sel.oContractCode"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vContrCode; ""; ->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; ->[CONTRACTS:17]Company_Code:1; "Contract")
End if 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].dItems_Sel.oContractCode"; $_t_oldMethodName)
