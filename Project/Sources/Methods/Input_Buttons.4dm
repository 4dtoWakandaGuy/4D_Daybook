//%attributes = {}
If (False:C215)
	//Project Method Name:      Input_Buttons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(PAL_at_PopUpMenu5;0)
	C_BOOLEAN:C305(<>PER_bo_CurrentNoButtGrey; <>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; DB_bo_RecordModified; PAL_bo_POPUPInited; QV_bo_BlockPalette)
	C_LONGINT:C283(<>BUTTPROC; <>SCPT_l_PaletteWIndow; $_l_CountRecords; $_l_Index; $_l_Offset; $_l_RecordID; $_l_SelectedRecordNumber; $_l_TableNumber; $_l_UniqueFIeld; DB_l_ButtonClickedFunction; MOD_l_CurrentModuleAccess)
	C_LONGINT:C283(vAdd; vProc; vStPos)
	C_OBJECT:C1216($_obj_Data; $_obj_Fields)
	C_POINTER:C301($_ptr_ButtonTable; $1; $2; BUT_p_ButtonStringPointer)
	C_TEXT:C284(<>ButtDis; $_t_ButtonDisable; $_t_Nul; $_t_oldMethodName; $_t_TableNumber; CON_t_DisplayType; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

//
$_t_oldMethodName:=ERR_MethodTracker("Input_Buttons")
//Input_Buttons
If (Count parameters:C259>=1)
	$_ptr_ButtonTable:=$1
	If (Count parameters:C259>=2)
		
		$_t_ButtonDisable:=$2->
	Else 
		$_t_Nul:=""
		$_t_ButtonDisable:=$_t_Nul
		
	End if 
	$_l_TableNumber:=Table:C252($_ptr_ButtonTable)
	Load_Fields
	$_obj_Data:=New object:C1471
	$_obj_Fields:=New object:C1471("loadTable"; $_l_TableNumber; "tableNames"; New collection:C1472; "primeKeys"; New collection:C1472; "tableNumbers"; New collection:C1472; "fieldNames"; New collection:C1472; "fieldNumbers"; New collection:C1472)
	Load_Fields($_obj_Fields)
	//field names will be collection-
	If ($_obj_Fields.fieldNames.length>0)
		$_obj_Data.fieldNames:=$_obj_Fields.fieldNames[0]
		$_obj_Data.fieldNumbers:=$_obj_Fields.fieldNumbers[0]
		//TRACE
		$_l_Offset:=$_obj_Data.fieldNames[$_obj_Fields.tableNames[0]].indexOf($_obj_Fields.primeKeys[0])
		If ($_l_Offset>0)
			$_l_UniqueFIeld:=$_obj_Data.fieldNumbers[$_obj_Fields.tableNames[0]][$_l_Offset]
		End if 
	End if 
	
	Case of 
		: (vAdd=1)
			$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"D"+Substring:C12($_t_ButtonDisable; 4; 5)+"FSS"+Substring:C12($_t_ButtonDisable; 12; 1)+"R"+Substring:C12($_t_ButtonDisable; 14; 1)+"A"+Substring:C12($_t_ButtonDisable; 16; 99)
			If (Substring:C12($_t_ButtonDisable; 16; 1)="D")
				If ($_t_ButtonDisable="I@")
					If ($_l_UniqueFIeld#0)
						$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 15)+" "+Substring:C12($_t_ButtonDisable; 17; 99)
					End if 
				End if 
			End if 
		: ((DB_t_CurrentFormUsage="Print") | (DB_t_CurrentFormUsage="Select"))
			$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"DPMO"+Substring:C12($_t_ButtonDisable; 7; 3)+"SS"+Substring:C12($_t_ButtonDisable; 12; 1)+"R"+Substring:C12($_t_ButtonDisable; 14; 1)+"AX"+Substring:C12($_t_ButtonDisable; 17; 99)
		: (MOD_l_CurrentModuleAccess>2)
			$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"D"+Substring:C12($_t_ButtonDisable; 4; 6)+"SS"+Substring:C12($_t_ButtonDisable; 12; 1)+"R"+Substring:C12($_t_ButtonDisable; 14; 1)+"A"+Substring:C12($_t_ButtonDisable; 16; 99)
			If (Substring:C12($_t_ButtonDisable; 16; 1)="D")
				If ($_t_ButtonDisable="I@")
					If ($_l_UniqueFIeld#0)
						$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 15)+" "+Substring:C12($_t_ButtonDisable; 17; 99)
					End if 
				End if 
			End if 
		Else 
			$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 9)+"SS"+Substring:C12($_t_ButtonDisable; 12; 1)+"R"+Substring:C12($_t_ButtonDisable; 14; 1)+"A"+Substring:C12($_t_ButtonDisable; 16; 99)
			If (Substring:C12($_t_ButtonDisable; 16; 1)="D")
				If ($_t_ButtonDisable="I@")
					If ($_l_UniqueFIeld#0)
						$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 15)+" "+Substring:C12($_t_ButtonDisable; 17; 99)
					End if 
				End if 
			End if 
	End case 
	
	If (Substring:C12($_t_ButtonDisable; 7; 1)#"S")
		$_l_CountRecords:=Records in selection:C76($_ptr_ButtonTable->)
		If ($_l_CountRecords<2)
			$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 6)+"NP"+Substring:C12($_t_ButtonDisable; 9; 99)
		Else 
			$_l_SelectedRecordNumber:=Selected record number:C246($_ptr_ButtonTable->)
			Case of 
				: ($_l_SelectedRecordNumber=1)
					$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 6)+" P"+Substring:C12($_t_ButtonDisable; 9; 99)
				: ($_l_SelectedRecordNumber=$_l_CountRecords)
					$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 6)+"N "+Substring:C12($_t_ButtonDisable; 9; 99)
				Else 
					$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 6)+"  "+Substring:C12($_t_ButtonDisable; 9; 99)
			End case 
		End if 
	Else 
		$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 6)+"NP"+Substring:C12($_t_ButtonDisable; 9; 99)
	End if 
	
	If (vStPos>0)
		If (Size of array:C274(<>SYS_al_RecStateRestriction{$_l_TableNumber})#0)
			If (Size of array:C274(<>SYS_al_RecStateRestriction{$_l_TableNumber})>=vStPos)
				If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{vStPos}\2)%2)=1)  //Grey Delete, Plus & Minus if RO
					$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"DPMO"+Substring:C12($_t_ButtonDisable; 7; 99)
				Else 
					If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{vStPos}\4)%2)=1)  //Grey Delete if No Dels
						$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"D"+Substring:C12($_t_ButtonDisable; 4; 99)
					Else 
						If (Type:C295(ST_ai_StatusUsage)=LongInt array:K8:19)  //bsw 8/4/4
							If (Find in array:C230(ST_ai_StatusUsage; 10)>0)
								$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"D"+Substring:C12($_t_ButtonDisable; 4; 99)
							End if 
						End if 
					End if 
				End if 
			Else 
				$_t_ButtonDisable:=Substring:C12($_t_ButtonDisable; 1; 2)+"D"+Substring:C12($_t_ButtonDisable; 4; 99)
			End if 
			
		End if 
	End if 
	
	//If (◊ButtDis#$_t_ButtonDisable)
	If (False:C215)
		If (vProc=Frontmost process:C327(*))
			<>ButtDis:=$_t_ButtonDisable
			If (<>PER_bo_CurrentNoButtGrey=False:C215) | (True:C214)
				If (<>ButtProc>0)
					ARRAY TEXT:C222(PAL_at_PopUpMenu5; 0)
					PAL_bo_POPUPInited:=True:C214
					If (Count parameters:C259>=3)
						
						For ($_l_Index; 3; Count parameters:C259)
							APPEND TO ARRAY:C911(PAL_at_PopUpMenu5; ${$_l_Index})
						End for 
						VARIABLE TO VARIABLE:C635(<>ButtProc; PAL_at_PopUpMenu5; PAL_at_PopUpMenu5)
						
					End if 
					VARIABLE TO VARIABLE:C635(<>ButtProc; PAL_at_PopUpMenu5; PAL_at_PopUpMenu5)
					POST OUTSIDE CALL:C329(<>ButtProc)
				End if 
			End if 
		End if 
	Else 
		BUT_p_ButtonStringPointer:=$2
		
	End if 
	//End if
	If (Not:C34(<>SYS_bo_ScriptonSave))
		If (DB_GetModuleSettingByNUM(Module_Macros)>0)
			<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
		End if 
	End if 
	If (<>SYS_bo_ScriptonSave)  //must be before Macro_FileUpd to prevent conflict
		If (vAdd=1)
			If ($_l_TableNumber#80)
				Macro_AccType("Enter "+String:C10($_l_TableNumber))
			End if 
		Else 
			If ($_l_TableNumber#80)
				Macro_AccType("View "+String:C10($_l_TableNumber))
			End if 
		End if 
	End if 
	
	$2->:=$_t_ButtonDisable
	DB_t_CallOnCloseorSave:="File"
	DB_bo_RecordModified:=False:C215
	DB_l_ButtonClickedFunction:=0
	In_SetManager
	
	
	
	
	
	
	$_l_TableNumber:=Table:C252($_ptr_ButtonTable)
	
	$_l_RecordID:=0
	If (Not:C34(QV_bo_BlockPalette))
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))  //companies
				$_l_RecordID:=[COMPANIES:2]x_ID:63
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))  //contacts
				If ([CONTACTS:1]x_ID:33=0)
					[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
				End if 
				
				$_l_RecordID:=[CONTACTS:1]x_ID:33
				
				
				
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))  //products
				$_l_RecordID:=[PRODUCTS:9]X_ID:43
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))  //orders
				$_l_RecordID:=[ORDERS:24]x_ID:58
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))  //orders
				$_l_RecordID:=[ORDER_ITEMS:25]x_ID:58
			Else 
				$_l_RecordID:=0
		End case 
	Else 
		$_l_RecordID:=0
	End if 
	
	If ($_l_RecordID>0)
		QV_UpdateQualsPallette(1; $_l_TableNumber; $_l_RecordID)
	Else 
		QV_HideQualities
	End if 
End if 
ERR_MethodTrackerReturn("Input_Buttons"; $_t_oldMethodName)
