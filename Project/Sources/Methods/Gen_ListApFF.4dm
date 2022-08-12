//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ListApFF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/08/2012 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateData; 0)
	ARRAY DATE:C224($_ad_Datex; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_CL; 0)
	ARRAY REAL:C219($_ar_NumberData; 0)
	ARRAY REAL:C219($_ar_Realex; 0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_AlphaData; 0)
	ARRAY TEXT:C222($_at_CS; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_StringEX; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	ARRAY TEXT:C222($_at_Textex; 0)
	ARRAY TEXT:C222($_at_UCEx; 0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	C_DATE:C307($_d_Date; $_d_Datex)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CustomFieldRow; $_l_Index; $_l_Process; $_l_Progress; $_l_RecordRow; $_l_RecordsCount; $_l_TableNumber; $_l_TableNumberRow; $1; r0)
	C_LONGINT:C283(r1; r2; r3)
	C_POINTER:C301($_ptr_Field; $2)
	C_REAL:C285($_r_Number; $ValueNEx)
	C_TEXT:C284($_t_AlphaValue; $_t_ChangeDataType; $_t_CustomFieldName; $_t_DataType; $_t_IncomingText; $_t_oldMethodName; $_t_ProgressMessage; $_t_StringEX; $_t_TableNumberString; $_t_Textex; $3)
	C_TEXT:C284($4; $5; Vname; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ListApFF")
//Gen_ListApFF - Further Fields

$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; $1)
$_l_TableNumber:=$1
If (Count parameters:C259>=3)
	$_t_CustomFieldName:=$3
Else 
	$_t_CustomFieldName:=Vname
End if 
If (Count parameters:C259>=5)
	$_t_IncomingText:=$5
Else 
	$_t_IncomingText:=vText
End if 
If (Count parameters:C259>=4)
	$_t_ChangeDataType:=$4
Else 
	$_t_ChangeDataType:=""
End if 
If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
	If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})=0)
		FurthFld_Arr($_l_TableNumber)
	End if 
	$_t_CustomFieldName:=Substring:C12($_t_CustomFieldName; 4; 99)
	$_l_CustomFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableNumberRow}; $_t_CustomFieldName)
	If ($_l_CustomFieldRow>0)
		If (Length:C16(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_CustomFieldRow})=1)
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_l_RecordsCount:=Records in selection:C76($2->)
			If ($_l_RecordRow>9)
				$_t_ProgressMessage:="Applying to "+String:C10($_l_RecordsCount)+" records ..."
				$_l_Progress:=Progress2_Start($_t_ProgressMessage)
			Else 
				$_t_ProgressMessage:=""
				$_l_Progress:=0
			End if 
			If ($_l_Progress=0)
				$_l_Process:=Current process:C322
			Else 
				$_l_Process:=$_l_Progress
			End if 
			<>SYS_l_CancelProcess:=0
			
			//create an array of Unique Codes to apply
			ARRAY TEXT:C222($_at_UniqueCode; $_l_RecordsCount)
			If (Type:C295($_ptr_Field->)=9)
				ARRAY LONGINT:C221($_al_CL; $_l_RecordsCount)
				SELECTION TO ARRAY:C260($_ptr_Field->; $_al_CL)
				For ($_l_Index; 1; $_l_RecordsCount)
					$_at_UniqueCode{$_l_Index}:=$_t_TableNumberString+String:C10($_al_CL{$_l_Index})
				End for 
				ARRAY LONGINT:C221($_al_CL; 0)
			Else 
				ARRAY TEXT:C222($_at_CS; $_l_RecordsCount)
				SELECTION TO ARRAY:C260($_ptr_Field->; $_at_CS)
				For ($_l_Index; 1; $_l_RecordsCount)
					$_at_UniqueCode{$_l_Index}:=$_t_TableNumberString+$_at_CS{$_l_Index}
				End for 
				ARRAY TEXT:C222($_at_CS; 0)
			End if 
			
			Progress2_Call($_l_Progress; $_t_ProgressMessage; 2; 10)
			
			//Find the existing Further Field records
			
			$_l_RecordRow:=0
			
			
			QUERY WITH ARRAY:C644([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UniqueCode)
			
			QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_CustomFieldName)
			
			Progress2_Call($_l_Progress; $_t_ProgressMessage; 3; 10)
			
			//create an array of the field name
			ARRAY TEXT:C222($_at_FieldNames; $_l_RecordsCount)
			For ($_l_Index; 1; $_l_RecordsCount)
				$_at_FieldNames{$_l_Index}:=$_t_CustomFieldName
			End for 
			
			READ WRITE:C146([CUSTOM_FIELDS:98])
			$_t_DataType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_CustomFieldRow}; 1; 1)
			
			Case of 
				: ($_t_DataType="A")
					$_t_AlphaValue:=Substring:C12($_t_IncomingText; 1; 79)
					ARRAY TEXT:C222($_at_AlphaData; $_l_RecordsCount)
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Change to")
						For ($_l_Index; 1; $_l_RecordsCount)
							$_at_AlphaData{$_l_Index}:=$_t_AlphaValue
						End for 
					Else 
						ARRAY TEXT:C222($_at_UCEx; 0)  //existing
						ARRAY TEXT:C222($_at_StringEX; 0)  //NG november 2004
						SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UCEx; [CUSTOM_FIELDS:98]String_31:4; $_at_StringEX)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_l_RecordRow:=Find in array:C230($_at_UCEx; $_at_UniqueCode{$_l_Index})
							If ($_l_RecordRow>0)
								$_t_StringEX:=$_at_StringEX{$_l_RecordRow}
							Else 
								$_t_StringEX:=""
							End if 
							Case of 
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Add to@")
									$_at_AlphaData{$_l_Index}:=Substring:C12($_t_StringEX+$_t_AlphaValue; 1; 79)
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Subtract from")
									$_at_AlphaData{$_l_Index}:=Substring:C12($_t_AlphaValue+$_t_StringEX; 1; 79)
							End case 
						End for 
					End if 
					Progress2_Call($_l_Progress; $_t_ProgressMessage; 6; 10)
					If (<>SYS_l_CancelProcess#$_l_Process)
						ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_at_AlphaData; [CUSTOM_FIELDS:98]String_31:4)
						Progress2_Call($_l_Progress; $_t_ProgressMessage; 9; 10)
					End if 
					
				: ($_t_DataType="T")
					ARRAY TEXT:C222($_at_TextData; $_l_RecordsCount)
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Change to")
						For ($_l_Index; 1; $_l_RecordsCount)
							$_at_TextData{$_l_Index}:=vText
						End for 
					Else 
						ARRAY TEXT:C222($_at_UCEx; 0)  //existing
						ARRAY TEXT:C222($_at_Textex; 0)
						SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UCEx; [CUSTOM_FIELDS:98]Text_Field:6; $_at_Textex)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_l_RecordRow:=Find in array:C230($_at_UCEx; $_at_UniqueCode{$_l_Index})
							If ($_l_RecordRow>0)
								$_t_Textex:=$_at_Textex{$_l_RecordRow}
							Else 
								$_t_Textex:=""
							End if 
							Case of 
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Add to@")
									$_at_TextData{$_l_Index}:=$_t_Textex+vText
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Subtract from@")
									$_at_TextData{$_l_Index}:=vText+$_t_Textex
							End case 
						End for 
					End if 
					Progress2_Call($_l_Progress; $_t_ProgressMessage; 6; 10)
					If (<>SYS_l_CancelProcess#$_l_Process)
						ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_at_TextData; [CUSTOM_FIELDS:98]Text_Field:6)
						Progress2_Call($_l_Progress; $_t_ProgressMessage; 9; 10)
					End if 
					
				: ($_t_DataType="N")
					$_r_Number:=Num:C11(vText)
					ARRAY REAL:C219($_ar_NumberData; $_l_RecordsCount)
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Change to")
						For ($_l_Index; 1; $_l_RecordsCount)
							$_ar_NumberData{$_l_Index}:=$_r_Number
						End for 
					Else 
						ARRAY TEXT:C222($_at_UCEx; 0)  //existing
						ARRAY REAL:C219($_ar_Realex; 0)
						SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UCEx; [CUSTOM_FIELDS:98]Real_or_Integer:5; $_ar_Realex)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_l_RecordRow:=Find in array:C230($_at_UCEx; $_at_UniqueCode{$_l_Index})
							If ($_l_RecordRow>0)
								$ValueNEx:=$_ar_Realex{$_l_RecordRow}
							Else 
								$ValueNEx:=0
							End if 
							Case of 
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Add to@")
									$_ar_NumberData{$_l_Index}:=Round:C94(($ValueNEx+$_r_Number); 2)
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Subtract from£")
									$_ar_NumberData{$_l_Index}:=Round:C94(($ValueNEx-$_r_Number); 2)
								: ((r3=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="%@")
									$_ar_NumberData{$_l_Index}:=Round:C94(($ValueNEx*($_r_Number/100)); 2)
							End case 
						End for 
					End if 
					Progress2_Call($_l_Progress; $_t_ProgressMessage; 6; 10)
					If (<>SYS_l_CancelProcess#$_l_Process)
						ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_ar_NumberData; [CUSTOM_FIELDS:98]Real_or_Integer:5)
						Progress2_Call($_l_Progress; $_t_ProgressMessage; 9; 10)
					End if 
					
				: ($_t_DataType="D")
					$_d_Date:=Date:C102(vText)
					$_r_Number:=Num:C11(vText)
					ARRAY DATE:C224($_ad_DateData; $_l_RecordsCount)
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Change to")
						For ($_l_Index; 1; $_l_RecordsCount)
							$_ad_DateData{$_l_Index}:=$_d_Date
						End for 
					Else 
						ARRAY TEXT:C222($_at_UCEx; 0)  //existing
						ARRAY DATE:C224($_ad_Datex; 0)
						SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UCEx; [CUSTOM_FIELDS:98]Date_Field:7; $_ad_Datex)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_l_RecordRow:=Find in array:C230($_at_UCEx; $_at_UniqueCode{$_l_Index})
							If ($_l_RecordRow>0)
								$_d_Datex:=$_ad_Datex{$_l_RecordRow}
							Else 
								$_d_Datex:=!00-00-00!
							End if 
							Case of 
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Add to")
									$_ad_DateData{$_l_Index}:=$_d_Datex+$_r_Number
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeDataType="Subtract from")
									$_ad_DateData{$_l_Index}:=$_d_Datex-$_r_Number
							End case 
						End for 
					End if 
					Progress2_Call($_l_Progress; $_t_ProgressMessage; 6; 10)
					If (<>SYS_l_CancelProcess#$_l_Process)
						ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_ad_DateData; [CUSTOM_FIELDS:98]Date_Field:7)
						Progress2_Call($_l_Progress; $_t_ProgressMessage; 9; 10)
					End if 
					
			End case 
			
			READ ONLY:C145([CUSTOM_FIELDS:98])
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
			Progress2_Call($_l_Progress; "")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ListApFF"; $_t_oldMethodName)