If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.oLBModifications
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/10/2012 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SMC_at_LastModifiedTexts;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SMC_T_LastModifiedData)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.oLBModifications"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		SMC_T_LastModifiedData:=SMC_at_LastModifiedTexts{$_l_Row}
End case 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.oLBModifications"; $_t_oldMethodName)
