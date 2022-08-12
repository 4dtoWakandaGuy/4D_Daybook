//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_Find2
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
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	ARRAY TEXT:C222($_at_UniqueCodeFinal; 0)
	C_DATE:C307($_d_DateFrom; $_d_DateTo)
	C_LONGINT:C283($_l_ArrayIndex; $_l_ArraySize; $_l_CustomFieldRow; $_l_TableNumber; $_l_TableNumberRow; $0; $5; cNAA)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_OutputTable; $_ptr_TablePointer)
	C_REAL:C285($_r_NumberFrom; $_r_NumberTo)
	C_TEXT:C284($_t_CustomFieldType; $_t_ErrorMessageText; $_t_FromValueRange; $_t_oldMethodName; $_t_TableName; $_t_toValueRange; $1; $2; $3; $4; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Find2")
//FurthFld_Find2 - Finds main records from FF selection
//see also StatsView_FFS3

$0:=-1
Load_Fields

$_t_TableName:=$1

$_l_TableNumberRow:=DB_GetTableNumFromNameString($_t_TableName)

If ($_l_TableNumberRow>0)
	$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumberRow}
	$_ptr_TablePointer:=Table:C252(<>DB_al_TableNums{$_l_TableNumberRow})
	If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
		If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})=0)
			FurthFld_Arr($_l_TableNumber)
		End if 
		$_l_CustomFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableNumberRow}; $2)
		If ($_l_CustomFieldRow>0)
			$_ptr_FieldPointer:=Field:C253(<>DB_al_TableNums{$_l_TableNumberRow}; <>SYS_al_TableUniqueField{$_l_TableNumber})
			cNAA:=1
			$_t_FromValueRange:=Sel_AtOp($3; "=")
			$_t_toValueRange:=Sel_AtOp($4; "=")
			
			QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=<>FUR_at_CustomFieldNames{$_l_TableNumberRow}{$_l_CustomFieldRow}; *)
			
			$_t_CustomFieldType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_CustomFieldRow}; 1; 1)
			Case of 
				: ($_t_CustomFieldType="@A")
					Case of 
						: ($_t_FromValueRange=$_t_toValueRange)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4; vRec; $_t_FromValueRange)
						: ($_t_toValueRange="")
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4>=$_t_FromValueRange)
						: ($_t_FromValueRange="")
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4<=$_t_toValueRange)
						Else 
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4>=$_t_FromValueRange; *)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4<=$_t_toValueRange)
					End case 
					
				: ($_t_CustomFieldType="@T")
					QUERY:C277([CUSTOM_FIELDS:98])
					Case of 
						: ($_t_FromValueRange=$_t_toValueRange)
							QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6; vRec; $_t_FromValueRange)
						: ($_t_toValueRange="")
							QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6>=$_t_FromValueRange)
						: ($_t_FromValueRange="")
							QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6<=$_t_toValueRange)
						Else 
							QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6>=$_t_FromValueRange; *)
							QUERY SELECTION:C341([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Text_Field:6<=$_t_toValueRange)
					End case 
					
				: ($_t_CustomFieldType="@N")
					$_r_NumberFrom:=Num:C11($_t_FromValueRange)
					$_r_NumberTo:=Num:C11($_t_toValueRange)
					Case of 
						: ($_r_NumberFrom=$_r_NumberTo)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5; vRec; $_r_NumberFrom)
						: ($_r_NumberTo=0)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5>=$_r_NumberFrom)
						: ($_r_NumberFrom=0)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5<=$_r_NumberTo)
						Else 
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5>=$_r_NumberFrom; *)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5<=$_r_NumberTo)
					End case 
					
				: ($_t_CustomFieldType="@D")
					$_d_DateFrom:=Date:C102($_t_FromValueRange)
					$_d_DateTo:=Date:C102($_t_toValueRange)
					Case of 
						: ($_d_DateFrom=$_d_DateTo)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7; vRec; $_d_DateFrom)
						: ($_d_DateTo=!00-00-00!)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7>=$_d_DateFrom)
						: ($_d_DateFrom=!00-00-00!)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7<=$_d_DateTo)
						Else 
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7>=$_d_DateFrom; *)
							QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7<=$_d_DateTo)
					End case 
					
			End case 
			
			//find the actual records
			ARRAY TEXT:C222($_at_UniqueCodeFinal; 0)
			SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UniqueCodeFinal)
			$_l_ArraySize:=Size of array:C274($_at_UniqueCodeFinal)
			$_ptr_OutputTable:=Table:C252($_l_TableNumber)
			Case of 
				: ($_l_ArraySize=0)
					If ($5#2)
						REDUCE SELECTION:C351($_ptr_OutputTable->; 0)
					End if 
				: ($_l_ArraySize=1)
					Case of 
						: ($5=0)
							QUERY:C277($_ptr_OutputTable->; $_ptr_FieldPointer->=Substring:C12($_at_UniqueCodeFinal{1}; 4))
						: ($5=1)
							QUERY SELECTION:C341($_ptr_OutputTable->; $_ptr_FieldPointer->=Substring:C12($_at_UniqueCodeFinal{1}; 4))
						: ($5=2)
							CREATE SET:C116($_ptr_OutputTable->; "FF2")
							QUERY:C277($_ptr_OutputTable->; $_ptr_FieldPointer->=Substring:C12($_at_UniqueCodeFinal{1}; 4))
							CREATE SET:C116($_ptr_OutputTable->; "Extra")
							UNION:C120("FF2"; "Extra"; "FF2")
							USE SET:C118("FF2")
							CLEAR SET:C117("FF2")
							CLEAR SET:C117("Extra")
					End case 
				Else 
					
					//$ss:=($5=1)
					
					//$j:=0
					//$sets:=0
					ARRAY TEXT:C222($_at_UniqueCode; $_l_ArraySize)
					For ($_l_ArrayIndex; 1; $_l_ArraySize)
						$_at_UniqueCode{$_l_ArrayIndex}:=Substring:C12($_at_UniqueCodeFinal{$_l_ArrayIndex}; 4)
					End for 
					QUERY WITH ARRAY:C644($_ptr_FieldPointer->; $_at_UniqueCode)
					CREATE SET:C116($_ptr_OutputTable->; "FF")
					USE SET:C118("FF")
					CLEAR SET:C117("FF")
					
					
					If ($5=2)
						
					Else 
						CLEAR SET:C117("Extra")
					End if 
					
			End case 
			$0:=Records in selection:C76($_ptr_OutputTable->)
			$_t_ErrorMessageText:=""
			
		Else 
			$_t_ErrorMessageText:="FurthFld Value Error - Field Name not found or not available for use"
		End if 
	Else 
		$_t_ErrorMessageText:="FurthFld Value Error - This table cannot have Further Fields"
	End if 
Else 
	$_t_ErrorMessageText:="FurthFld Value Error - invalid table Name"
End if 
If ($_t_ErrorMessageText#"")
	Error_MessGen($_t_ErrorMessageText)
End if 
ERR_MethodTrackerReturn("FurthFld_Find2"; $_t_oldMethodName)