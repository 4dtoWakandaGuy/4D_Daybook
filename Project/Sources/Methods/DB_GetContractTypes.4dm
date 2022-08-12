//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetContractTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/01/2011 18:31 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	//ARRAY TEXT(DB_at_ContractTypesCodes;0)
	//ARRAY TEXT(DB_at_ContractTypesNames;0)
	C_BOOLEAN:C305(DB_bo_ContractTypesReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetContractTypes")

If (Count parameters:C259>=1)
	READ ONLY:C145([CONTRACT_TYPES:19])
	ALL RECORDS:C47([CONTRACT_TYPES:19])
	
	SELECTION TO ARRAY:C260([CONTRACT_TYPES:19]Contract_Type_Code:1; $_at_Codes; [CONTRACT_TYPES:19]Contract_Type_Name:2; $_at_Names)
	$_l_BlankRow:=Find in array:C230($_at_Codes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_Codes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_Names; $_l_BlankRow)
	End if 
	
	VARIABLE TO VARIABLE:C635($1; DB_at_ContractTypesNames; $_at_Names; DB_at_ContractTypesCodes; $_at_Codes)
	SET PROCESS VARIABLE:C370($1; DB_bo_ContractTypesReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetContractTypes"; $_t_oldMethodName)