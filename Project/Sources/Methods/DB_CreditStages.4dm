//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CreditStages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/01/2011 14:54 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CreditStageCodes; 0)
	ARRAY TEXT:C222($_at_CreditStageNames; 0)
	//ARRAY TEXT(DB_at_CredStgCodes;0)
	//ARRAY TEXT(DB_at_CredStgNames;0)
	C_BOOLEAN:C305(DB_bo_CredStgReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CreditStages")
If (Count parameters:C259>=1)
	READ ONLY:C145([CREDIT_STAGES:54])
	ALL RECORDS:C47([CREDIT_STAGES:54])
	
	SELECTION TO ARRAY:C260([CREDIT_STAGES:54]Stage_Name:2; $_at_CreditStageNames; [CREDIT_STAGES:54]Stage_Code:1; $_at_CreditStageCodes)
	$_l_BlankRow:=Find in array:C230($_at_CreditStageCodes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_CreditStageCodes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_CreditStageNames; $_l_BlankRow)
	End if 
	
	VARIABLE TO VARIABLE:C635($1; DB_at_CredStgNames; $_at_CreditStageNames; DB_at_CredStgCodes; $_at_CreditStageCodes)
	SET PROCESS VARIABLE:C370($1; DB_bo_CredStgReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_CreditStages"; $_t_oldMethodName)