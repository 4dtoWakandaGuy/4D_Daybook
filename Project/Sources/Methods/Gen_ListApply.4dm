//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ListApply
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DU_abo_ClearValues;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(DU_at_ChangedValue;0)
	//ARRAY TEXT(DU_at_FieldChangeTypes;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; VTextIsListItem; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_AccessLevel; <>SYS_l_CancelProcess; $_l_FieldData; $_l_FIeldLength; $_l_FieldRow; $_l_FieldType; $_l_Index; $_l_ModuleAccess; $_l_OK; $_l_Process; $_l_Progress)
	C_LONGINT:C283($_l_SIzeofArray; $_l_SIzeofFIeldArray; $_l_TableNumber; $_l_TableRow; $_l_WindowRow; $1; $3; ch1; ch2; GEN_l_CurrentTable; MOD_l_CurrentModuleAccess)
	C_LONGINT:C283(s1; s2; s3; vNo; VTextID; WIN_l_CurrentWinRef)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table; $2)
	C_REAL:C285($_r_RecordData)
	C_TEXT:C284(<>SYS_t_VersionNumber; $_t_FieldData; $_t_oldMethodName; $_t_TableName; $_t_Version; vName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ListApply")
//Gen_ListApply
If (Count parameters:C259>=3)
	$_l_ModuleAccess:=$3
Else 
	$_l_ModuleAccess:=MOD_l_CurrentModuleAccess
End if 
If (($_l_ModuleAccess=2) & (<>PER_l_AccessLevel<2))
	//NOTE: Further down here the $1 value is put into vNo
	GEN_l_CurrentTable:=$1
	$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $1)
	COPY ARRAY:C226(<>SYS_at_2DFieldNames{$_l_TableRow}; <>SYS_at_CurrentTableFieldNames)
	$_l_SIzeofArray:=Size of array:C274(<>SYS_at_2DFieldNames{$_l_TableRow})
	ARRAY TEXT:C222(SVS_at_PreviewTypeN; $_l_SIzeofArray)
	For ($_l_Index; 1; $_l_SIzeofArray)
		SVS_at_PreviewTypeN{$_l_Index}:=<>SYS_at_2DFieldNames{$_l_TableRow}{$_l_Index}
	End for 
	$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $1)
	
	If ((DB_GetModuleSettingByNUM(1))#5)  //add on the Further Fields
		If (<>SYS_al_TableUniqueField{$1}#0)
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($1)
			End if 
			$_l_SIzeofFIeldArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			For ($_l_Index; 1; $_l_SIzeofFIeldArray)
				If (Length:C16(<>FUR_at_CustomFieldTypes{$_l_TableRow}{$_l_Index})=1)
					$_l_SIzeofArray:=$_l_SIzeofArray+1
					INSERT IN ARRAY:C227(SVS_at_PreviewTypeN; $_l_SIzeofArray; 1)
					SVS_at_PreviewTypeN{$_l_SIzeofArray}:="FF:"+<>FUR_at_CustomFieldNames{$_l_TableRow}{$_l_Index}
				End if 
			End for 
		End if 
	End if 
	VTextIsListItem:=False:C215
	VTextID:=0
	
	vText:=""
	vName:=""
	vNo:=$1
	$_Ptr_Table:=Table:C252($1)
	//C_
	//QVTable:=Table($1)
	<>SYS_bo_CurrentWindowModal:=True:C214
	Open_Any_Window(120; 450; 5)
	DIALOG:C40([COMPANIES:2]; "dAsk_Apply")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	
	If (WIN_bo_TrackerInited)
		$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
		End if 
	End if 
	
	If ($_l_OK=1)
		QV_UpdateQualsPallette(2; $1; 0; 1)
		<>SYS_l_CancelProcess:=0
		CREATE SET:C116($_Ptr_Table->; "Apply")
		READ WRITE:C146($_Ptr_Table->)
		
		Case of 
			: (s1=1)
				For ($_l_Index; 1; Size of array:C274(SVS_at_PreviewTypeN))
					If ((DU_at_ChangedValue{$_l_Index}#"") | (DU_abo_ClearValues{$_l_Index}=True:C214)) & (DU_at_FieldChangeTypes{$_l_Index}#"None")
						
						Gen_ListAp2($1; $_Ptr_Table; SVS_at_PreviewTypeN{$_l_Index}; DU_at_FieldChangeTypes{$_l_Index}; DU_at_ChangedValue{$_l_Index}; DU_abo_ClearValues{$_l_Index})
					End if 
				End for 
			: (s2=1)
				Userset
				vNo:=Records in selection:C76($_Ptr_Table->)
				Gen_Confirm("Please name the file to save the Export "+String:C10(vNo)+" records"; "OK"; "Cancel")
				If (OK=1)
					SET CHANNEL:C77(12; "")
					If (OK=1)
						$_l_Progress:=Progress2_Start("Export ...")
						If ($_l_Progress=0)
							$_l_Process:=Current process:C322
						Else 
							$_l_Process:=$_l_Progress
						End if 
						$_l_TableNumber:=$1
						$_t_TableName:=Uppers2(Lowercase:C14(Table name:C256($_l_TableNumber)))
						$_t_Version:=<>SYS_t_VersionNumber+"/"+String:C10(vNo)  //Add no of records to same variable for compatability
						GET FIELD PROPERTIES:C258($2; $_l_FieldType)
						SEND VARIABLE:C80($_l_TableNumber)
						SEND VARIABLE:C80($_t_Version)
						FIRST RECORD:C50($_Ptr_Table->)
						$_l_Index:=1
						While ((Not:C34(End selection:C36($_Ptr_Table->))) & (<>SYS_l_CancelProcess#$_l_Process))
							Progress2_Call($_l_Progress; "Export "+$_t_TableName+": "+String:C10($_l_Index)+" of "+String:C10(vNo); $_l_Index; vNo)
							If (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
								$_r_RecordData:=$2->
								$_t_FieldData:=String:C10($_r_RecordData)
							Else 
								$_t_FieldData:=$2->
							End if 
							SEND VARIABLE:C80($_t_FieldData)
							SEND RECORD:C78($_Ptr_Table->)
							NEXT RECORD:C51($_Ptr_Table->)
							$_l_Index:=$_l_Index+1
						End while 
						Progress2_Call($_l_Progress; "")
					End if 
					SET CHANNEL:C77(11)
				End if 
				
			: (s3=1)
				Gen_Confirm("This import method will only add data from a file created by Daybook."+"  The file you are importing to must be the same as the one exported,"+" and the Daybook Version should be the same."; "OK"; "Cancel")
				If (OK=1)
					Gen_Confirm("Please show me the file to Import from"; "OK"; "Cancel")
					If (OK=1)
						SET CHANNEL:C77(10; "")
						If (OK=1)
							
							$_l_FieldRow:=Find in array:C230(<>SYS_at_CurrentTableFieldNames; "Export")
							$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $1)
							If ($_l_FieldRow>0)
								If (False:C215)
									$_l_FieldRow:=<>SYS_al_2DFieldNumbers{$_l_TableRow}{$_l_FieldRow}
								End if 
								$_l_FieldRow:=0
							Else 
								$_l_FieldRow:=0
							End if 
							
							If (($_l_FieldRow>0) & (ch1=1))
								$_Ptr_Field:=Field:C253($1; $_l_FieldRow)
							End if 
							GET FIELD PROPERTIES:C258($2; $_l_FieldType; $_l_FIeldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
							
							RECEIVE VARIABLE:C81($_l_TableNumber)
							RECEIVE VARIABLE:C81($_t_Version)
							If ($_l_TableNumber#$1)
								If (($_l_TableNumber=0) | ($_l_TableNumber>Get last table number:C254))
									Gen_Alert("This is not a valid import document"; "Cancel")
								Else 
									Gen_Alert("This data was exported from the file "+Table name:C256($_l_TableNumber)+", not "+Table name:C256($1); "Cancel")
								End if 
								OK:=0
							Else 
								$_t_TableName:=Uppers2(Lowercase:C14(Table name:C256($_l_TableNumber)))
								$_l_Index:=Position:C15("/"; $_t_Version)  //remove the no of records
								If ($_l_Index>0)
									vNo:=Num:C11(Substring:C12($_t_Version; $_l_Index+1; 35))
									$_t_Version:=Substring:C12($_t_Version; 1; $_l_Index-1)
								Else 
									vNo:=0
								End if 
								If ($_t_Version#<>SYS_t_VersionNumber)
									Gen_Confirm("This data was exported from version "+$_t_Version+" of Daybook, whereas you are currently using Version "+<>SYS_t_VersionNumber+".  If the data stored has changed, the results will be unpredictable."; "Cancel"; "Continue")
									If (OK=1)
										OK:=0
									Else 
										OK:=1
									End if 
								End if 
							End if 
							If (vNo>0)
								$_l_Progress:=Progress2_Start("Import ...")
							Else 
								$_l_Progress:=0
							End if 
							If ($_l_Progress=0)
								$_l_Process:=Current process:C322
							Else 
								$_l_Process:=$_l_Progress
							End if 
							$_l_Index:=1
							While ((OK=1) & (<>SYS_l_CancelProcess#$_l_Process))
								IDLE:C311  // 03/04/03 pb
								If (vNo>0)
									Progress2_Call($_l_Progress; "Import "+$_t_TableName+": "+String:C10($_l_Index)+" of "+String:C10(vNo); $_l_Index; vNo)
								End if 
								RECEIVE VARIABLE:C81($_t_FieldData)
								If (OK=1)
									If ((Table:C252($2)#Table:C252($_Ptr_Table)) | (<>SYS_al_TableUniqueField{$1}=0))  //don't do any search cos is non-unique
										REDUCE SELECTION:C351($_Ptr_Table->; 0)
									Else 
										If (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
											$_l_FieldData:=Num:C11($_t_FieldData)
											QUERY:C277($_Ptr_Table->; $2->=$_l_FieldData)
										Else 
											QUERY:C277($_Ptr_Table->; $2->=$_t_FieldData)
										End if 
									End if 
									//TRACE
									
									
									If (Records in selection:C76($_Ptr_Table->)>0)
										If (ch2=1)
											READ WRITE:C146($_Ptr_Table->)
											DELETE SELECTION:C66($_Ptr_Table->)
											CREATE RECORD:C68($_Ptr_Table->)
											RECEIVE RECORD:C79($_Ptr_Table->)
											If (($_l_FieldRow>0) & (ch1=1))
												If ($_l_FIeldLength>0)
												End if 
												$_Ptr_Field->:=Export_Stamp2($_Ptr_Field->)
											End if 
											DB_SaveRecord($_Ptr_Table)
										Else 
											RECEIVE RECORD:C79($_Ptr_Table->)
										End if 
									Else 
										CREATE RECORD:C68($_Ptr_Table->)
										RECEIVE RECORD:C79($_Ptr_Table->)
										If (($_l_FieldRow>0) & (ch1=1))
											$_Ptr_Field->:=Export_Stamp2($_Ptr_Field->)
										End if 
										DB_SaveRecord($_Ptr_Table)
									End if 
									ADD TO SET:C119($_Ptr_Table->; "Apply")
								End if 
								$_l_Index:=$_l_Index+1
							End while 
							If (vNo>0)
								Progress2_Call($_l_Progress; "")
							End if 
						End if 
						SET CHANNEL:C77(11)
					End if 
				End if 
				
		End case 
		USE SET:C118("Apply")
		CLEAR SET:C117("Apply")
	Else 
		QV_UpdateQualsPallette(2; $1; 0; 2)
		
	End if 
	<>SYS_bo_CurrentWindowModal:=False:C215
	vNo:=Records in selection:C76($_Ptr_Table->)
Else 
	Gen_Alert("You do not have access to this function"; "Cancel")
End if 
ERR_MethodTrackerReturn("Gen_ListApply"; $_t_oldMethodName)