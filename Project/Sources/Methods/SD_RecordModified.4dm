//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_RecordModified
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2009 10:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Boolean; $_bo_BooleanOLD; $0; SD_bo_AddingDiaryRecord; SD_bo_RecordModified)
	C_DATE:C307($_d_Date; $_d_DateOLD)
	C_LONGINT:C283($_l_FieldsIndex; $_l_Int; $_l_IntOLD; $_l_Long; $_l_LongOLD; $_l_TableNumber; SD_l_RecNeedssaving)
	C_POINTER:C301($_ptr_Field; $1)
	C_REAL:C285($_r_Real; $_r_RealOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_String; $_t_StringOLD)
	C_TIME:C306($_ti_Time; $_ti_TimeOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_RecordModified")

$_l_TableNumber:=Table:C252(->[DIARY:12])
If (SD_bo_RecordModified=False:C215)
	
	For ($_l_FieldsIndex; 1; Get last field number:C255($_l_TableNumber))
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
		If ((Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)#Is picture:K8:10) & (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)#Is text:K8:3) & (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)#Is subtable:K8:11) & (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)#Is BLOB:K8:12))
			
			Case of 
				: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
					$_t_StringOLD:=Old:C35($_ptr_Field->)
					$_t_String:=$_ptr_Field->
					If ($_t_StringOLD#$_t_String)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is text:K8:3)
					$_t_StringOLD:=Old:C35($_ptr_Field->)
					$_t_String:=$_ptr_Field->
					If ($_t_StringOLD#$_t_String)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is longint:K8:6)
					$_l_LongOLD:=Old:C35($_ptr_Field->)
					$_l_Long:=$_ptr_Field->
					If ($_l_LongOLD#$_l_Long)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is integer:K8:5)
					$_l_IntOLD:=Old:C35($_ptr_Field->)
					$_l_Int:=$_ptr_Field->
					If ($_l_IntOLD#$_l_Int)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is real:K8:4)
					$_r_RealOLD:=Old:C35($_ptr_Field->)
					$_r_Real:=$_ptr_Field->
					If ($_r_RealOLD#$_r_Real)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is date:K8:7)
					$_d_DateOLD:=Old:C35($_ptr_Field->)
					$_d_Date:=$_ptr_Field->
					If ($_d_DateOLD#$_d_Date)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is time:K8:8)
					$_ti_TimeOLD:=Old:C35($_ptr_Field->)
					$_ti_Time:=$_ptr_Field->
					If ($_ti_TimeOLD#$_ti_Time)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
				: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
					$_bo_BooleanOLD:=Old:C35($_ptr_Field->)
					$_bo_Boolean:=$_ptr_Field->
					If ($_ti_TimeOLD#$_ti_Time)
						If (Field name:C257($_l_TableNumber; $_l_FieldsIndex)#"Diary Code") & (Not:C34(SD_bo_AddingDiaryRecord))
							SD_bo_RecordModified:=True:C214
						End if 
						
					End if 
			End case 
		End if 
		
	End for 
End if 
If (SD_bo_RecordModified)
	SD_l_RecNeedssaving:=1
End if 

$0:=SD_bo_RecordModified
ERR_MethodTrackerReturn("SD_RecordModified"; $_t_oldMethodName)
