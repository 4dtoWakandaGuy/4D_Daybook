//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_RetrieveOrderHeader
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; 0; 0)
	ARRAY DATE:C224($_ad_DataArrayDates; 0; 0)
	ARRAY INTEGER:C220($_ai_DataArrayIntegers; 0; 0)
	ARRAY LONGINT:C221($_al_DataArrayLongints; 0; 0)
	ARRAY REAL:C219($_ar_DataArrayReals; 0; 0)
	ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
	ARRAY TEXT:C222($_at_DataArrayTexts; 0; 0)
	ARRAY TIME:C1223($_ati_DataArrayTimes; 0; 0)
	C_BLOB:C604(<>ORD_BL_ordDataBlob)
	C_BOOLEAN:C305($_bo_Ask; $_bo_Continue; $_bo_isModified; $_bo_isPopulated; ORD_bo_DataValue)
	C_DATE:C307(ORD_D_DataPointer)
	C_LONGINT:C283($_l_FieldsCount; $_l_Index; $_l_offset; $_l_RecordsCount; ORD_l_DataPointer; Xnext)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285(ORD_R_DataPointer)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_Str1; $_t_Str2; ORD_T_DataPointer; ORD_t_DataTransfer)
	C_TIME:C306(ORD_ti_DataPointer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_RetrieveOrderHeader")
//dragged records selection
While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	DelayTicks
End while 
ARRAY TIME:C1223($_ati_DataArrayTimes; 0; 0)
ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
ARRAY TEXT:C222($_at_DataArrayTexts; 0; 0)
ARRAY REAL:C219($_ar_DataArrayReals; 0; 0)
ARRAY LONGINT:C221($_al_DataArrayLongints; 0; 0)
ARRAY INTEGER:C220($_ai_DataArrayIntegers; 0; 0)
ARRAY DATE:C224($_ad_DataArrayDates; 0; 0)
ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; 0; 0)
//```
$_l_FieldsCount:=Get last field number:C255(->[ORDER_ITEMS:25])
ARRAY TIME:C1223($_ati_DataArrayTimes; $_l_FieldsCount; 0)
ARRAY TEXT:C222($_at_AlphaFieldData; $_l_FieldsCount; 0)
ARRAY TEXT:C222($_at_DataArrayTexts; $_l_FieldsCount; 0)
ARRAY REAL:C219($_ar_DataArrayReals; $_l_FieldsCount; 0)
ARRAY LONGINT:C221($_al_DataArrayLongints; $_l_FieldsCount; 0)
ARRAY INTEGER:C220($_ai_DataArrayIntegers; $_l_FieldsCount; 0)
ARRAY DATE:C224($_ad_DataArrayDates; $_l_FieldsCount; 0)
ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; $_l_FieldsCount; 0)
$_l_offset:=0
$_l_RecordsCount:=0
$_bo_isPopulated:=False:C215
For ($_l_Index; 1; Get last field number:C255(->[ORDERS:24]))
	If ($_l_Index=Field:C253(->[ORDERS:24]Order_Code:3)) | ($_l_Index=Field:C253(->[ORDERS:24]State:15)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_TAX:7)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Total:8)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandMPC:37)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandM:36)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandC:39)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandA:38)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Margin:12)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Margin_PC:13)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Cost:11)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Amount:6)) | ($_l_Index=Field:C253(->[ORDERS:24]x_ID:58))
		
	Else 
		$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_l_Index)
		//``
		Case of 
			: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
				If ($_ptr_Field->#"")
					$_bo_isPopulated:=True:C214
				End if 
			: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
				
				
			: (Type:C295($_ptr_Field->)=Is date:K8:7)
				If ($_ptr_Field->#!00-00-00!)
					$_bo_isPopulated:=True:C214
				End if 
			: (Type:C295($_ptr_Field->)=Is integer:K8:5)
				If ($_ptr_Field->#0)
					$_bo_isPopulated:=True:C214
				End if 
			: (Type:C295($_ptr_Field->)=Is longint:K8:6)
				If ($_ptr_Field->#0)
					$_bo_isPopulated:=True:C214
				End if 
				
			: (Type:C295($_ptr_Field->)=Is real:K8:4)
				If ($_ptr_Field->#0)
					$_bo_isPopulated:=True:C214
				End if 
				
			: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
			: (Type:C295($_ptr_Field->)=Is text:K8:3)
				If ($_ptr_Field->#"")
					$_bo_isPopulated:=True:C214
				End if 
			: (Type:C295($_ptr_Field->)=Is time:K8:8)
				If ($_ptr_Field->#?00:00:00?)
					$_bo_isPopulated:=True:C214
				End if 
			Else 
		End case 
		
	End if 
End for 
$_bo_Ask:=False:C215
If ($_bo_isPopulated=True:C214)
	
	Gen_Confirm3("Overwrite Existing Data"; "Yes"; "No"; "Ask")
	If (OK=1)
		$_bo_Continue:=True:C214
		If (Xnext=1)
			$_bo_Ask:=True:C214
		End if 
	Else 
		$_bo_Continue:=False:C215
	End if 
End if 
If ($_bo_Continue)
	If (BLOB size:C605(<>ORD_BL_ordDataBlob)>$_l_offset)
		$_l_RecordsCount:=1
		
		For ($_l_Index; 1; Get last field number:C255(->[ORDERS:24]))
			If (BLOB size:C605(<>ORD_BL_ordDataBlob)>$_l_offset)
				$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_l_Index)
				$_bo_isModified:=False:C215  //``
				Case of 
					: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
						ORD_t_DataTransfer:=""
						$_l_offset:=DB_Blob_to_Data(->ORD_t_DataTransfer; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_l_Index=Field:C253(->[ORDERS:24]Order_Code:3)) | ($_l_Index=Field:C253(->[ORDERS:24]State:15)) | ($_l_Index=Field:C253(->[ORDERS:24]Export:24))
							//do not do these ones
						Else 
							If ($_bo_Ask)
								If ($_ptr_Field->#"") & ($_ptr_Field->#ORD_t_DataTransfer)
									$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
									Gen_Confirm("Change "+$_t_FieldName+" From "+$_ptr_Field->+" to "+ORD_t_DataTransfer; "Yes"; "No")
									If (Ok=1)
										$_ptr_Field->:=ORD_t_DataTransfer
										$_bo_isModified:=True:C214
									End if 
								Else 
									If ($_ptr_Field->#ORD_t_DataTransfer)
										$_ptr_Field->:=ORD_t_DataTransfer
										$_bo_isModified:=True:C214
									End if 
								End if 
							Else 
								If ($_ptr_Field->#ORD_t_DataTransfer)
									
									$_bo_isModified:=True:C214
								End if 
								$_ptr_Field->:=ORD_t_DataTransfer
							End if 
						End if 
					: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
						ORD_bo_DataValue:=False:C215
						$_l_offset:=DB_Blob_to_Data(->ORD_bo_DataValue; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_bo_Ask)
							If (ORD_bo_DataValue#$_ptr_Field->)
								If ($_ptr_Field->=True:C214)
									$_t_Str1:="True"
									$_t_Str2:="False"
								Else 
									$_t_Str1:="False"
									$_t_Str2:="True"
								End if 
								$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
								Gen_Confirm("Change "+$_t_FieldName+" From "+$_t_Str1+" to "+$_t_Str2; "Yes"; "No")
								If (OK=1)
									$_bo_isModified:=True:C214
									$_ptr_Field->:=ORD_bo_DataValue
								End if 
							Else 
								$_ptr_Field->:=ORD_bo_DataValue
							End if 
						Else 
							If (ORD_bo_DataValue#$_ptr_Field->)
								
								$_bo_isModified:=True:C214
							End if 
							$_ptr_Field->:=ORD_bo_DataValue
						End if 
						
						
					: (Type:C295($_ptr_Field->)=Is date:K8:7)
						ORD_D_DataPointer:=!00-00-00!
						$_l_offset:=DB_Blob_to_Data(->ORD_D_DataPointer; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_bo_Ask)
							If ($_ptr_Field->#!00-00-00!) & ($_ptr_Field->#ORD_D_DataPointer)
								$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
								Gen_Confirm("Change "+$_t_FieldName+" From "+String:C10($_ptr_Field->)+" to "+String:C10(ORD_D_DataPointer); "Yes"; "No")
								If (Ok=1)
									$_ptr_Field->:=ORD_D_DataPointer
									$_bo_isModified:=True:C214
								End if 
							Else 
								If ($_ptr_Field->#ORD_D_DataPointer)
									$_ptr_Field->:=ORD_D_DataPointer
									$_bo_isModified:=True:C214
								End if 
							End if 
						Else 
							If ($_ptr_Field->#ORD_D_DataPointer)
								
								$_bo_isModified:=True:C214
							End if 
							$_ptr_Field->:=ORD_D_DataPointer
						End if 
						
						
					: (Type:C295($_ptr_Field->)=Is integer:K8:5)
						
						$_l_offset:=DB_Blob_to_Data(->ORD_l_DATAPOINTER; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214; Is longint:K8:6)
						
						If ($_bo_Ask)
							If ($_ptr_Field->#0) & ($_ptr_Field->#ORD_l_DATAPOINTER)
								$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
								Gen_Confirm("Change "+$_t_FieldName+" From "+String:C10($_ptr_Field->)+" to "+String:C10(ORD_l_DATAPOINTER); "Yes"; "No")
								If (Ok=1)
									$_ptr_Field->:=ORD_l_DATAPOINTER
									$_bo_isModified:=True:C214
								End if 
							Else 
								If ($_ptr_Field->#ORD_l_DATAPOINTER)
									$_ptr_Field->:=ORD_l_DATAPOINTER
									$_bo_isModified:=True:C214
								End if 
							End if 
						Else 
							If ($_ptr_Field->#ORD_l_DATAPOINTER)
								$_ptr_Field->:=ORD_l_DATAPOINTER
								$_bo_isModified:=True:C214
							End if 
						End if 
						
						
					: (Type:C295($_ptr_Field->)=Is longint:K8:6)
						ORD_l_DataPointer:=0
						$_l_offset:=DB_Blob_to_Data(->ORD_l_DataPointer; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_l_Index=Field:C253(->[ORDERS:24]Total_TAX:7)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Total:8)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandMPC:37)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandM:36)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandC:39)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandA:38)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Margin_PC:13)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Margin:12)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Cost:11)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Amount:6))
							//do not copy these
						Else 
							If ($_bo_Ask)
								If ($_ptr_Field->#0) & ($_ptr_Field->#ORD_l_DataPointer)
									$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
									Gen_Confirm("Change "+$_t_FieldName+" From "+String:C10($_ptr_Field->)+" to "+String:C10(ORD_l_DataPointer); "Yes"; "No")
									If (Ok=1)
										$_ptr_Field->:=ORD_l_DataPointer
										$_bo_isModified:=True:C214
									End if 
								Else 
									If ($_ptr_Field->#ORD_l_DataPointer)
										$_ptr_Field->:=ORD_l_DataPointer
										$_bo_isModified:=True:C214
									End if 
								End if 
							Else 
								If ($_ptr_Field->#ORD_l_DataPointer)
									$_ptr_Field->:=ORD_l_DataPointer
									$_bo_isModified:=True:C214
								End if 
								
							End if 
							
						End if 
					: (Type:C295($_ptr_Field->)=Is picture:K8:10)
					: (Type:C295($_ptr_Field->)=Is real:K8:4)
						ORD_R_DataPointer:=0
						$_l_offset:=DB_Blob_to_Data(->ORD_R_DataPointer; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_l_Index=Field:C253(->[ORDERS:24]Total_TAX:7)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Total:8)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandMPC:37)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandM:36)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandC:39)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_StandA:38)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Margin_PC:13)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Margin:12)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Cost:11)) | ($_l_Index=Field:C253(->[ORDERS:24]Total_Amount:6))
							//do not copy these
						Else 
							If ($_bo_Ask)
								If ($_ptr_Field->#0) & ($_ptr_Field->#ORD_R_DataPointer)
									$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
									Gen_Confirm("Change "+$_t_FieldName+" From "+String:C10($_ptr_Field->)+" to "+String:C10(ORD_R_DataPointer); "Yes"; "No")
									If (Ok=1)
										$_ptr_Field->:=ORD_R_DataPointer
										$_bo_isModified:=True:C214
									End if 
								Else 
									If ($_ptr_Field->#ORD_R_DataPointer)
										$_ptr_Field->:=ORD_R_DataPointer
										$_bo_isModified:=True:C214
									End if 
								End if 
							Else 
								If ($_ptr_Field->#ORD_R_DataPointer)
									$_ptr_Field->:=ORD_R_DataPointer
									$_bo_isModified:=True:C214
								End if 
							End if 
						End if 
						
					: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
					: (Type:C295($_ptr_Field->)=Is text:K8:3)
						ORD_T_DataPointer:=""
						$_l_offset:=DB_Blob_to_Data(->ORD_T_DataPointer; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_bo_Ask)
							If ($_ptr_Field->#"") & ($_ptr_Field->#ORD_T_DataPointer)
								$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
								Gen_Confirm("Change "+$_t_FieldName+" From "+Substring:C12($_ptr_Field->; 1; 10)+"..."+" to "+Substring:C12(ORD_T_DataPointer; 1; 10)+"..."; "Yes"; "No")
								If (Ok=1)
									$_ptr_Field->:=ORD_T_DataPointer
									$_bo_isModified:=True:C214
								End if 
							Else 
								If ($_ptr_Field->#ORD_T_DataPointer)
									$_ptr_Field->:=ORD_T_DataPointer
									$_bo_isModified:=True:C214
								End if 
							End if 
						Else 
							If ($_ptr_Field->#ORD_T_DataPointer)
								$_ptr_Field->:=ORD_T_DataPointer
								$_bo_isModified:=True:C214
							End if 
						End if 
						
					: (Type:C295($_ptr_Field->)=Is time:K8:8)
						ORD_ti_DataPointer:=?00:00:00?
						$_l_offset:=DB_Blob_to_Data(->ORD_ti_DataPointer; -><>ORD_BL_ordDataBlob; $_l_offset; True:C214)
						If ($_bo_Ask)
							If ($_ptr_Field->#?00:00:00?) & ($_ptr_Field->#ORD_ti_DataPointer)
								$_t_FieldName:=Field name:C257(Table:C252(->[ORDERS:24]); $_l_Index)
								Gen_Confirm("Change "+$_t_FieldName+" From "+Time string:C180($_ptr_Field->*1)+" to "+Time string:C180(ORD_ti_DataPointer*1); "Yes"; "No")
								If (Ok=1)
									$_ptr_Field->:=ORD_ti_DataPointer
									$_bo_isModified:=True:C214
								End if 
							Else 
								If ($_ptr_Field->#ORD_ti_DataPointer)
									$_bo_isModified:=True:C214
									$_ptr_Field->:=ORD_ti_DataPointer
								End if 
							End if 
						Else 
							If ($_ptr_Field->#ORD_ti_DataPointer)
								$_bo_isModified:=True:C214
								$_ptr_Field->:=ORD_ti_DataPointer
							End if 
							
						End if 
						
					Else 
				End case 
				If ($_bo_isModified)
					Orders_InLPD($_ptr_Field)
				End if 
				
			End if 
		End for 
	End if 
End if 
// Delayticks(6)


CLEAR SEMAPHORE:C144("$DataBlobinUse")
ERR_MethodTrackerReturn("ORD_RetrieveOrderHeader"; $_t_oldMethodName)