//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(EW_al_ExportTableNumbers;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	C_LONGINT:C283(EW_l_SelectedMapNumber; EW_l_SelectedTableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Pop-up/Drop-down List1"; Form event code:C388)

Case of 
	: (DM_at_BKModelNames<1)
		Gen_Alert("Please select a Store name first.")
		Self:C308->:=1
	: (Self:C308->{Self:C308->}="select table")
		// do nothing
	Else 
		EW_l_SelectedMapNumber:=DM_al_BKModelIDS{DM_at_BKModelNames}
		//  If (EW_bo_ModifiedSettings)
		CONFIRM:C162("Are you sure you want to change the ecommerce table?"; "Yes"; "No")
		If (OK=1)
			// EW_FieldMapSave (EW_l_SelectedMapNumber)
			DELETE SELECTION:C66([EW_BK_FieldMap:121])
			//     End if
			//     EW_at_ExportTableNames:=1
			//   EW_l_SelectedTableNumber:=0
			//     EW_BKFieldMapArrays (EW_l_SelectedMapNumber;"";"DB")
			//  `   End if
			
			Case of 
				: (Self:C308->{Self:C308->}="items")
					ARRAY TEXT:C222(EW_at_ExportTableNames; 1)
					ARRAY LONGINT:C221(EW_al_ExportTableNumbers; 1)
					//  EW_at_ExportTableNames{1}:="Select a Table"
					//  EW_at_ExportTableNames{2}:="Catalogues"
					EW_at_ExportTableNames{1}:="Products"
					// EW_al_ExportTableNumbers{1}:=0
					//  EW_al_ExportTableNumbers{2}:=Table(->[Catalogue])
					EW_al_ExportTableNumbers{1}:=Table:C252(->[PRODUCTS:9])
					
				: (Self:C308->{Self:C308->}="Customers")
					ARRAY TEXT:C222(EW_at_ExportTableNames; 1)
					ARRAY LONGINT:C221(EW_al_ExportTableNumbers; 1)
					//{1}:="Select a Table"
					EW_at_ExportTableNames{1}:="Contacts"
					//  EW_al_ExportTableNumbers{1}:=0
					EW_al_ExportTableNumbers{1}:=Table:C252(->[CONTACTS:1])
			End case 
			QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=EW_l_SelectedMapNumber)
			If (Records in selection:C76([EW_BK_FieldMap:121])=0)
				EW_BKfieldMapCreate(EW_al_ExportTableNumbers{1}; EW_l_SelectedMapNumber)
			End if 
			EW_BKFieldMapArrays(EW_l_SelectedMapNumber; ""; "DB")
			
			Case of 
				: (Self:C308->>1)
					EW_BKFieldMapArrays(0; Self:C308->{Self:C308->}; "BK")
					EW_at_ExportTableNames:=1
					Case of 
						: (Self:C308->{Self:C308->}="items")
							EW_l_SelectedTableNumber:=Table:C252(->[PRODUCTS:9])
						Else 
							EW_l_SelectedTableNumber:=1  // Contacts
					End case 
					//   EW_BKFieldMapArrays (EW_l_SelectedTableNumber;"";"DB")
					//  EW_BKFieldMapArrays (EW_l_SelectedMapNumber;"";"DB")
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Pop-up/Drop-down List1"; $_t_oldMethodName)
