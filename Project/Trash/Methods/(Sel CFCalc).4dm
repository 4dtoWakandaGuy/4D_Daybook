//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel CFCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vMod2; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_ArrayRow; $_l_FieldCount; $_l_FIeldIndex; $_l_FieldType; $_l_WindowReferenceRow; cEnvelopes; cExport; cLabels; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_FieldPointer; vFilePtr)
	C_REAL:C285(vT1; vT2; vT3; vT4; vT5; vT6; vT7; vT8; vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; vTitle10; vTitle11)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel CFCalc")
Menu_Record("Sel CFCalc"; "Calculations ...")
If ((DB_GetModuleSettingByNUM(1))#5)
	If (DB_bo_RecordModified)
		vT1:=0
		vT2:=0
		vT3:=0
		vT4:=0
		vT5:=0
		vT6:=0
		vT7:=0
		vT8:=0
		vTot:=0
		vTot2:=0
		vTitle10:="FIELD: unspecified"
		vTitle11:=""
		
		cLabels:=0
		cEnvelopes:=0
		cExport:=0
		
		$_l_FieldCount:=Get last field number:C255(vFilePtr)
		$_l_ArrayRow:=1
		$_l_FIeldIndex:=1
		Array_LCx($_l_FieldCount)
		
		While ($_l_FIeldIndex<=$_l_FieldCount)
			$_ptr_FieldPointer:=Field:C253(Table:C252(vFilePtr); $_l_FIeldIndex)
			GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
			If (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9))
				GEN_at_Identity{$_l_ArrayRow}:=Field name:C257($_ptr_FieldPointer)
				GEN_at_RecordCode{$_l_ArrayRow}:=String:C10($_l_FIeldIndex)
				$_l_ArrayRow:=$_l_ArrayRow+1
			End if 
			$_l_FIeldIndex:=$_l_FIeldIndex+1
		End while 
		While ($_l_ArrayRow<=$_l_FieldCount)
			IDLE:C311  // 7/04/03 pb
			GEN_at_Identity{$_l_ArrayRow}:=""
			$_l_ArrayRow:=$_l_ArrayRow+1
		End while 
		
		Open_AnyTypeWindow(275; 455; 5; "Find Calculation Options")
		DIALOG:C40([COMPANIES:2]; "dAsk CFCalc")
		CLOSE WINDOW:C154
		vMod2:=((OK=1) & (((vTot#0) | (vTot2#0) | (cLabels#0) | ((vTitle10#"Field: unspecified") & ((vT1#0) | (vT2#0) | (vT3#0) | (vT4#0) | (vT5#0) | (vT6#0) | (vT7#0) | (vT8#0) | (cEnvelopes#0) | (cExport#0))))))
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If (vMod2)
			If (((cLabels=0) & (cEnvelopes=0) & (cExport=0)) | ((cLabels=0) & (vTitle11="")))
				cEnvelopes:=0
			Else 
				Case of 
					: (cLabels#0)
						cEnvelopes:=1
					: (cEnvelopes#0)
						cLabels:=cEnvelopes
						cEnvelopes:=2
					: (cExport#0)
						cLabels:=cExport
						cEnvelopes:=3
				End case 
			End if 
		End if 
	Else 
		Gen_Alert("Calculations can only be used when using 'cross-file' Finds"+" from a One to a Many File (eg Companies to Orders)"; "Cancel")
	End if 
Else 
	Gen_Alert("The Calculations options are not available in Daybook Silver"; "Cancel")
End if 
ERR_MethodTrackerReturn("Sel CFCalc"; $_t_oldMethodName)