//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_ViewR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; $_bo_Changed; $_bo_Continue)
	C_LONGINT:C283(<>AutoProc; $_l_FIeldNumberColumn; $_l_FieldType; $_l_TableNumber2; $_l_TableNumberRow; vNo)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_TablePointer; $_ptr_TablePointer2; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_ViewR")
//StatsView_ViewR - view the related data
If (DB_at_TableName>1)
	If (vSVCF#"")
		Load_Fields
		
		
		$_ptr_TablePointer:=vFilePtr
		CREATE SET:C116(vFilePtr->; "SVSet")
		$_bo_Continue:=True:C214
		$_bo_Changed:=False:C215
		
		If (aSV1{1}#"All selected records")
			If (aSV1=0)
				Gen_Confirm("You have not selected a line to View"; "Try again"; "View all")
				$_bo_Continue:=(OK=0)
				StatsView_Cal1D
			End if 
			If (($_bo_Continue) & (aSV1#0))
				If (SV_at_FieldName1{SV_at_FieldName1}="FF:@")
					StatsView_ViewF(aSV1)
				Else 
					$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; SV_al_TableNumber{1})
					$_l_FIeldNumberColumn:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumberRow}; SV_at_FieldName1{SV_at_FieldName1})  //Find the Field No from the interProcess_Arrays
					If ($_l_FIeldNumberColumn>0)
						$_ptr_FieldPointer:=Field:C253(SV_al_TableNumber{1}; $_l_FIeldNumberColumn)  //get a pointer to the field in column 1
						GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
						StatsView_UpdS(aSV1; $_ptr_FieldPointer; $_l_FieldType)  //Search for the relevant records
					End if 
				End if 
				StatsView_Cal1C(aSV1)
			End if 
		Else 
			StatsView_Cal1D
		End if 
		If ($_bo_Continue)
			$_l_TableNumber2:=SV_al_TableNumber{DB_at_TableName}
			$_ptr_TablePointer2:=Table:C252($_l_TableNumber2)
			<>AutoFind:=True:C214
			<>AutoProc:=987654321
			<>DB_bo_AutoOut:=True:C214
			CUT NAMED SELECTION:C334($_ptr_TablePointer2->; "◊IA")
			Gen_ZbyNo($_l_TableNumber2)
			
		End if 
		vFilePtr:=$_ptr_TablePointer
		USE SET:C118("SVSet")
		CLEAR SET:C117("SVSet")
		vNo:=Records in selection:C76(vFilePtr->)
		
	End if 
Else 
	Gen_Alert("You have not chosen a Related File to View"; "Cancel")
End if 
ERR_MethodTrackerReturn("StatsView_ViewR"; $_t_oldMethodName)