If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oLBAccessTables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_AccessTables;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(vMod2)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oLBAccessTables"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->PER_lb_AccessTables; $_t_VariableName)
			<>DB_at_TableNames:=$_l_Row
			If (vMod2)
				FurthFldP_InLPA
			End if 
			If (<>DB_at_TableNames=0)
				<>DB_at_TableNames:=Find in array:C230(<>DB_al_TableNums; 2)
			End if 
			If (<>SYS_al_TableUniqueField{<>DB_at_TableNames}=0)
				Gen_Alert("Sorry, Field Definitions cannot currently be set up for this file"; "Cancel")
				<>DB_at_TableNames:=Find in array:C230(<>DB_al_TableNums; 2)
				PERS_at_TableNames:=<>DB_at_TableNames
			End if 
			FurthFldP_InLPB(<>DB_al_TableNums{<>DB_at_TableNames})
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oLBAccessTables"; $_t_oldMethodName)
