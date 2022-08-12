If (False:C215)
	//object Name: [USER]User_In.Pop-up%2FDrop-down List3
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
	//ARRAY INTEGER(EW_al_ExportTableNumbers;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_BKTables;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	C_BOOLEAN:C305($_bo_Accept; $_bo_Continue; EW_bo_ModifiedSettings)
	C_LONGINT:C283(EW_l_SelectedMapNumber; EW_l_SelectedTableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Pop-up/Drop-down List3"; Form event code:C388)
Case of 
	: (EW_at_BKTables{EW_at_BKTables}="select table")
		Gen_Alert("Please select an ecommerce table first.")
		Self:C308->:=1
		// : (Self->>1)  ` 1 is "select table"
	: (Self:C308->>0)
		EW_l_SelectedMapNumber:=DM_al_BKModelIDS{DM_at_BKModelNames}
		$_bo_Accept:=True:C214
		If (EW_bo_ModifiedSettings)
			//  $_bo_Accept:=EW_FieldMapSave (EW_l_SelectedTableNumber)
			//   $_bo_Accept:=EW_FieldMapSave (EW_l_SelectedMapNumber)
			$_bo_Accept:=EW_FieldMapSave(DM_al_BKModelIDS{DM_at_BKModelNames})
			If ($_bo_Accept=False:C215)
				EW_at_ExportTableNames:=Find in array:C230(EW_al_ExportTableNumbers; EW_l_SelectedTableNumber)
			End if 
		End if 
		If ($_bo_Accept)
			//   EW_l_SelectedTableNumber:=EW_al_ExportTableNumbers{Self->}
			QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=EW_l_SelectedMapNumber)
			EW_l_SelectedTableNumber:=EW_al_ExportTableNumbers{EW_at_ExportTableNames}
			$_bo_Continue:=True:C214
			If (Records in selection:C76([EW_BK_FieldMap:121])>0) & ([EW_BK_FieldMap:121]DayBookTableNumber:1#EW_l_SelectedTableNumber)
				CONFIRM:C162("Change the selected table?"; "Yes"; "No")
				If (OK=0)
					$_bo_Continue:=False:C215
				Else 
					DELETE SELECTION:C66([EW_BK_FieldMap:121])
				End if 
			End if 
			If ($_bo_Continue)
				If (Records in selection:C76([EW_BK_FieldMap:121])=0)
					//  EW_BKfieldMapCreate (EW_l_SelectedTableNumber)
					EW_BKfieldMapCreate(EW_l_SelectedTableNumber; EW_l_SelectedMapNumber)
				End if 
				//  EW_BKFieldMapArrays (EW_l_SelectedTableNumber;"";"DB")
				EW_BKFieldMapArrays(EW_l_SelectedMapNumber; ""; "DB")
			End if 
			EW_bo_ModifiedSettings:=True:C214  // 01/09/03 pb
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Pop-up/Drop-down List3"; $_t_oldMethodName)
