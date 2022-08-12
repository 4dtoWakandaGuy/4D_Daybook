If (False:C215)
	//object Name: [ACTIONS]Action_In.oModifyTablesButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	//ARRAY TEXT(SD2_at_rTableNames;0)
	C_LONGINT:C283($_l_event; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable33"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD2_ModifyTables(->SD2_al_rTableNUMs)
		SORT ARRAY:C229(SD2_al_rTableNUMs; >)
		ARRAY TEXT:C222(SD2_at_rTableNames; Size of array:C274(SD2_al_rTableNUMs))
		For ($_l_Index; 1; Size of array:C274(SD2_at_rTableNames))
			If (SD2_al_rTableNUMs{$_l_Index}>0)  //it should be but just in case
				If (Is table number valid:C999(SD2_al_rTableNUMs{$_l_Index}))
					
					SD2_at_rTableNames{$_l_Index}:=Table name:C256(Table:C252(SD2_al_rTableNUMs{$_l_Index}))
				End if 
			End if 
			
		End for 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable33"; $_t_oldMethodName)
