If (False:C215)
	//object Name: [CONTRACT_TYPES]ContractType_In.oContractTab3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_ContractOptions;0)
	C_TEXT:C284($_t_oldMethodName; vButtDisCtypes)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACT_TYPES].ContractType_In.oContractTab3"; Form event code:C388)
Case of 
	: (SVS_at_ContractOptions=1)
		FORM GOTO PAGE:C247(1)
		vButtDisCtypes:="I DPMO  FSSSRCADT"
		In_ButtChkDis(->vButtDisCtypes)
	: (SVS_at_ContractOptions=2)
		FORM GOTO PAGE:C247(4)
		vButtDisCtypes:="I    O  FSSSRCADT"
		In_ButtChkDis(->vButtDisCtypes)
	: (SVS_at_ContractOptions=3)
		
		FORM GOTO PAGE:C247(2)
		vButtDisCtypes:="I DPMO  FSSSRCADT"
		In_ButtChkDis(->vButtDisCtypes)
End case 
ERR_MethodTrackerReturn("OBJ [CONTRACT_TYPES].ContractType_In.oContractTab3"; $_t_oldMethodName)
