If (False:C215)
	//object Name: [USER]User_In.USR_hl_DataManList
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
	//ARRAY BOOLEAN(EW_lb_ProjectList;0)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_BKTables;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	//ARRAY TEXT(EW_at_ProjectsNames;0)
	//ARRAY TEXT(SD_at_ActionResultTab;0)
	C_BOOLEAN:C305($_bo_Accept; EW_bo_ModifiedSettings)
	C_LONGINT:C283($_l_ItemPosition; $_l_ItemReference; DM_l_ModelSequence; DS_l_ModelSeq; EW_l_SelectedTableNumber; USR_hl_DataManList; WS_GoPage)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; DM_t_ModelSequence; vtitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.USR_hl_DataManList"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)  // A single-click occurred
		$_l_ItemPosition:=Selected list items:C379(USR_hl_DataManList)  // Get the position of the selected item
		If ($_l_ItemPosition#0)  // Just in case, check the position
			GET LIST ITEM:C378(USR_hl_DataManList; $_l_ItemPosition; $_l_ItemReference; $_t_ItemText)
			FORM GOTO PAGE:C247(DB_al_UserTabPage{$_l_ItemPosition})
			WS_GoPage:=DB_al_UserTabPage{DB_at_USERTAB}
			SD_at_ActionResultTab:=1
			
			$_bo_Accept:=True:C214  // 01/09/03 pb
			If (EW_bo_ModifiedSettings)
				CONFIRM:C162("Save the modified field map?"; "Yes"; "No")
				If (OK=1)
					$_bo_Accept:=EW_FieldMapSave(DM_al_BKModelIDS{DM_at_BKModelNames})
					If ($_bo_Accept=False:C215)
						$_l_ItemPosition:=Find in array:C230(DB_at_USERTAB; "ecommerce")
						DB_at_USERTAB:=$_l_ItemPosition
						FORM GOTO PAGE:C247(21)
					End if 
				End if 
				EW_bo_ModifiedSettings:=False:C215
			End if 
			
			Case of   // 29/10/02 pb
				: (DB_at_USERTAB{$_l_ItemPosition}="ecommerce") & ($_bo_Accept)
					READ WRITE:C146([EW_BK_FieldMap:121])
					If (Records in table:C83([EW_BKFields:122])=0)
						EW_BKfieldsCreate  // build the database of BK fields that can be imported
						// These will be mapped to DayBook fields in the EW_BK_FieldMap table
					End if 
					vtitle:="DayBook ecommerce Field Map"
					EW_bo_ModifiedSettings:=False:C215
					ARRAY TEXT:C222(EW_at_BKTables; 3)
					EW_at_BKTables{1}:="Select Table"
					EW_at_BKTables{2}:="Items"
					EW_at_BKTables{3}:="Customers"
					//   EW_TableArrays
					EW_at_ExportTableNames:=1
					EW_BKGetModelPrefs
					
					DS_l_ModelSeq:=0
					DM_t_ModelSequence:="DataModels"
					DM_at_BKModelNames:=1
					If (Size of array:C274(DM_al_BKModelIDS)>0)
						EW_BKAllArrays(DM_al_BKModelIDS{1})
					Else 
						EW_BKAllArrays(0)
					End if 
					
				: (DB_at_USERTAB{$_l_ItemPosition}="data interchange")  // 31/10/02 pb
					EW_ArraysSetup("all")
					ARRAY TEXT:C222(EW_at_ProjectsNames; 0)
					ARRAY LONGINT:C221(EW_al_ProjectNumbers; 0)
					READ WRITE:C146([EW_ExportProjects:117])
					READ WRITE:C146([EW_ExportSteps:118])
					READ WRITE:C146([EW_StepActions:119])
					READ WRITE:C146([EW_ExportTables:120])
					ALL RECORDS:C47([EW_ExportProjects:117])
					SELECTION TO ARRAY:C260([EW_ExportProjects:117]ProjectName:1; EW_at_ProjectsNames; [EW_ExportProjects:117]RecordNumber:2; EW_al_ProjectNumbers)
					SORT ARRAY:C229(EW_at_ProjectsNames; EW_al_ProjectNumbers)
					EW_LBI_Setup(->EW_lb_ProjectList; "EWPrefs"; 1; ->EW_at_ProjectsNames; ->EW_al_ProjectNumbers)
			End case 
			
			Case of   //Rollo 27/8/2004 - change the colours of the background
				: (DB_at_USERTAB{$_l_ItemPosition}="stock control")
					INT_SetInput(Table:C252(->[STOCK_MOVEMENTS:40]); "")
				: ((DB_at_USERTAB{$_l_ItemPosition}="sales") | (DB_at_USERTAB{$_l_ItemPosition}="job costing"))
					INT_SetInput(Table:C252(->[INVOICES:39]); "")
				: (DB_at_USERTAB{$_l_ItemPosition}="purchases")
					INT_SetInput(Table:C252(->[PURCHASE_INVOICES:37]); "")
				: (DB_at_USERTAB{$_l_ItemPosition}="accounts")
					INT_SetInput(Table:C252(->[TRANSACTIONS:29]); "")
				: (DB_at_USERTAB{$_l_ItemPosition}="call centre")
					INT_SetInput(Table:C252(->[SERVICE_CALLS:20]); "")
					
				Else 
					INT_SetInput(Table:C252(->[USER:15]); "")
			End case 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.USR_hl_DataManList"; $_t_oldMethodName)
