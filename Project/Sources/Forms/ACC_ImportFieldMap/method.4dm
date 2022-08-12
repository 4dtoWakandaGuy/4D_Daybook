
If (False:C215)
	//Database Method Name:      ACC_ImportFieldMap
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/07/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_Lb_StatementMap;0)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_FieldNames;0)
	//ARRAY TEXT(ACC_at_QIFDBFields;0)
	//ARRAY TEXT(ACC_at_QIFFields;0)
	//ARRAY TEXT(ACC_at_StatementFields;0)
	//ARRAY TEXT(ACC_at_SwapView;0)
	C_BOOLEAN:C305(ACC_bo_AddQIFFormat; ACC_bo_AllowAdditions; ACC_bo_CSVhasHeader; ACC_bo_NotresetArrays; DB_bo_NoLoad)
	C_DATE:C307(ACC_D_OpeningBalanceDate)
	C_LONGINT:C283($_l_FormEvent; $_l_offset; ABC_l_BUT1; ABC_l_But2; ABC_l_BUT3; ABC_l_BUT4; ABC_l_BUT5; ABC_l_BUT6; ABC_l_BUT7; ABC_l_BUT8; ABC_l_BUT9)
	C_LONGINT:C283(ACC_but_addField; ACC_l_LoadPreferencesID)
	C_REAL:C285(ACC_r_OpeningBalance)
	C_TEXT:C284($_t_oldMethodName; ABC_t_COL1; ABC_t_COL2; ABC_t_COL3; ABC_t_COL4; ABC_t_COL5; ABC_t_COL6; ABC_t_COL7; ABC_t_COL8; ABC_t_COL9; ABC_t_HED1)
	C_TEXT:C284(ABC_t_HED2; ABC_t_HED3; ABC_t_HED4; ABC_t_HED5; ABC_t_HED6; ABC_t_HED7; ABC_t_HED8; ABC_t_HED9; ACC_t_editType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM ACC_ImportFieldMap"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ARRAY TEXT:C222(ACC_at_FieldNames; 0)
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Account Code")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Bank Transaction Reference")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Date")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Type")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Description")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Amount")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Debit Amount")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Credit Amount")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Debit Amount Identifier")
		APPEND TO ARRAY:C911(ACC_at_FieldNames; "Account Balance")
		If (Not:C34(ACC_bo_NotresetArrays))
			ARRAY TEXT:C222(ACC_at_StatementFields; 0)
			ARRAY TEXT:C222(ACC_at_DaybookFields; 0)
			ARRAY TEXT:C222(ACC_at_QIFDBFields; 0)
			ARRAY TEXT:C222(ACC_at_QIFFields; 0)
			
		End if 
		
		If (ACC_l_LoadPreferencesID>0)
			ACC_bo_CSVhasHeader:=False:C215
			ACC_r_OpeningBalance:=0
			ACC_D_OpeningBalanceDate:=!00-00-00!
			
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
			$_l_offset:=0
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_D_OpeningBalanceDate; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_r_OpeningBalance; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_StatementFields; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_DaybookFields; $_l_offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_bo_CSVhasHeader; $_l_offset)  // QIF Format Fields
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFFields; $_l_offset)  // QIF Format Fields
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFDBFields; $_l_offset)  // QIF map to 4D
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		Else 
			If (ACC_t_editType="CSV")
				ARRAY TEXT:C222(ACC_at_QIFFields; 0)
				ARRAY TEXT:C222(ACC_at_DaybookFields; Size of array:C274(ACC_at_StatementFields))
			Else 
				ARRAY TEXT:C222(ACC_at_StatementFields; 0)
				ARRAY TEXT:C222(ACC_at_QIFDBFields; Size of array:C274(ACC_at_QIFFields))
				
			End if 
			
		End if 
		ARRAY TEXT:C222(ACC_at_SwapView; 0)
		OBJECT SET VISIBLE:C603(ACC_t_editType; False:C215)
		If (Size of array:C274(ACC_at_QIFDBFields)>0) & (Size of array:C274(ACC_at_DaybookFields)>0)
			ARRAY TEXT:C222(ACC_at_SwapView; 2)
			OBJECT SET VISIBLE:C603(ACC_at_SwapView; True:C214)
			ACC_at_SwapView{1}:="CSV import Format"
			ACC_at_SwapView{2}:="QIF import Format"
			ACC_at_SwapView:=1
			ACC_t_editType:="CSV"
			OBJECT SET VISIBLE:C603(ACC_bo_AddQIFFormat; False:C215)
		Else 
			
			OBJECT SET VISIBLE:C603(*; "oFormatTypeLabel"; False:C215)
			// SET VISIBLE(ACC_butAddFormat;False)
			OBJECT SET VISIBLE:C603(ACC_bo_AddQIFFormat; True:C214)
			OBJECT SET VISIBLE:C603(ACC_t_editType; True:C214)
		End if 
		
		
		
		Case of 
			: (ACC_t_editType="CSV")
				OBJECT SET VISIBLE:C603(ACC_bo_CSVhasHeader; True:C214)
				LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_StatementFields; ->ACC_at_DaybookFields)
				LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
				LB_SetChoiceList("ABC_FBFields"; ->ACC_at_FieldNames; ->ACC_at_DaybookFields)
			: (ACC_t_editType="QIF")
				OBJECT SET VISIBLE:C603(ACC_bo_CSVhasHeader; False:C215)
				LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_QIFFields; ->ACC_at_QIFDBFields)
				LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
				LB_SetChoiceList("ABC_FBFields"; ->ACC_at_FieldNames; ->ACC_at_QIFDBFields)
			Else 
				OBJECT SET VISIBLE:C603(ACC_bo_CSVhasHeader; True:C214)
				LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_StatementFields; ->ACC_at_DaybookFields)
				LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
				LB_SetChoiceList("ABC_FBFields"; ->ACC_at_FieldNames; ->ACC_at_DaybookFields)
				
		End case 
		LB_SetColumnWidths(->ACC_Lb_StatementMap; "ABC_t"; 1; 150; 40)
		LB_SetEnterable(->ACC_Lb_StatementMap; False:C215; 0)
		LB_SetEnterable(->ACC_Lb_StatementMap; True:C214; 1)
		LB_SetEnterable(->ACC_Lb_StatementMap; True:C214; 2)
		LB_SetChoiceList("ABC_FBFields"; ->ACC_at_FieldNames; ->ACC_at_QIFDBFields)
		
		LB_SetScroll(->ACC_Lb_StatementMap; -3; -2)
		LB_StyleSettings(->ACC_Lb_StatementMap; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
		
		If (Not:C34(ACC_bo_AllowAdditions))
			OBJECT SET VISIBLE:C603(ACC_but_addField; False:C215)
			OBJECT SET VISIBLE:C603(ACC_at_SwapView; False:C215)
			// SET VISIBLE(ACC_butAddFormat;False)
			OBJECT SET VISIBLE:C603(ACC_bo_AddQIFFormat; False:C215)
			OBJECT SET VISIBLE:C603(ACC_t_editType; True:C214)
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM ACC_ImportFieldMap"; $_t_oldMethodName)
