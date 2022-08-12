If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oDMFiles
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/09/2012 17:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DM_LB_DataSetup;0)
	//ARRAY LONGINT(DB_al_TableNums;0)
	//ARRAY LONGINT(DM_al_TableNumber;0)
	//ARRAY TEXT(DB_at_TableNames;0)
	//ARRAY TEXT(DB_at_UserTableNames;0)
	//ARRAY TEXT(DM_at_TableName;0)
	C_BOOLEAN:C305(DB_bo_TableNamesSave)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Row; $_l_RowIndex; $_l_TableRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oDMFiles"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Double Clicked:K2:5)
		//TRACE
		LISTBOX GET CELL POSITION:C971(*; "oDMFiles"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			If (DB_al_TableNums{$_l_Row}#-1)
				DB_EditTableSetup(DB_al_TableNums{$_l_Row})
			End if 
		End if 
	: ($_l_Event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(*; "oDMFiles"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=3)
				If (DB_al_TableNums{$_l_Row}#-1)
					LB_SetEnterable(->DM_LB_DataSetup; False:C215; 0)
					LISTBOX SELECT ROW:C912(DM_LB_DataSetup; $_l_Row)
					
				Else 
					LB_SetEnterable(->DM_LB_DataSetup; True:C214; 3)
					LB_GoToCell(->DM_LB_DataSetup; $_l_Column; $_l_Row)
				End if 
				
		End case 
	: ($_l_Event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(*; "oDMFiles"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=3)
				If (DB_at_TableNames{$_l_Row}#DB_at_UserTableNames{$_l_Row})
					DB_bo_TableNamesSave:=True:C214
					$_l_TableRow:=Find in array:C230(DM_al_TableNumber; DB_al_TableNums{$_l_Row})
					If ($_l_TableRow<0)
						APPEND TO ARRAY:C911(DM_al_TableNumber; DB_al_TableNums{$_l_Row})
						APPEND TO ARRAY:C911(DM_at_TableName; DB_at_UserTableNames{$_l_Row})
					Else 
						DM_al_TableNumber{$_l_TableRow}:=DB_al_TableNums{$_l_Row}
						DM_at_TableName{$_l_TableRow}:=DB_at_UserTableNames{$_l_Row}
					End if 
				Else 
					$_l_TableRow:=Find in array:C230(DM_al_TableNumber; DB_al_TableNums{$_l_Row})
					If ($_l_TableRow>0)
						DB_bo_TableNamesSave:=True:C214
						DM_al_TableNumber{$_l_TableRow}:=DB_al_TableNums{$_l_Row}
						DM_at_TableName{$_l_TableRow}:=DB_at_UserTableNames{$_l_Row}
					End if 
				End if 
				If (False:C215)
					$_l_Row:=0
					For ($_l_RowIndex; $_l_Row; Size of array:C274(DB_al_TableNums))
						If ($_l_RowIndex<Size of array:C274(DB_al_TableNums))
							If (DB_al_TableNums{$_l_RowIndex+1}#-1)
								$_l_Row:=$_l_RowIndex+1
								$_l_RowIndex:=Size of array:C274(DB_al_TableNums)
							End if 
						End if 
					End for 
					
					
					If ($_l_Row>0)
						LB_GoToCell(->DM_LB_DataSetup; $_l_Column; $_l_Row)
					End if 
				End if 
		End case 
	: ($_l_Event=On Selection Change:K2:29)
		
	: ($_l_Event=On Getting Focus:K2:7)
		LISTBOX GET CELL POSITION:C971(*; "oDMFiles"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=3)
				If (DB_al_TableNums{$_l_Row}=-1)
					LB_SetEnterable(->DM_LB_DataSetup; False:C215; 0)
					LISTBOX SELECT ROW:C912(DM_LB_DataSetup; $_l_Row)
					
				Else 
					LB_SetEnterable(->DM_LB_DataSetup; True:C214; 3)
					LB_GoToCell(->DM_LB_DataSetup; $_l_Column; $_l_Row)
				End if 
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oDMFiles"; $_t_oldMethodName)
