//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_MODIFYDIARY
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
	C_BOOLEAN:C305($_bo_Update; vFromIn)
	C_LONGINT:C283($_l_DataType; $_l_Index; DM_l_ValidityCheck; vAdd)
	C_POINTER:C301($_ptr_DataArray; $_ptr_Field; $_ptr_HeaderFields)
	C_REAL:C285($1)
	C_TEXT:C284($_t_HeaderString; $_t_oldMethodName; $2; $3; $4; $DetailStr; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; headerStr; SYS_t_AccessType)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_MODIFYDIARY")

If (Count parameters:C259>=2)
	If ($1=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		//VALID CALL
		$_t_HeaderString:=$3
		$DetailStr:=$4
		$_ptr_HeaderFields:=Get pointer:C304("DIA_al"+$3+"_Fields")
		
		StartTransaction
		Start_Process
		vAdd:=1
		SYS_t_AccessType:=""
		DB_t_CurrentFormUsage:="None"
		vFromIn:=False:C215
		REDUCE SELECTION:C351([DIARY:12]; 0)
		READ WRITE:C146([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$1)
		
		Diary_InB
		$_ptr_HeaderFields:=Get pointer:C304("DIA_al"+$_t_HeaderString+"_Fields")
		For ($_l_Index; 1; Size of array:C274($_ptr_HeaderFields->))
			$_ptr_Field:=Field:C253(Table:C252(->[DIARY:12]); $_ptr_HeaderFields->{$_l_Index})
			$_l_DataType:=Type:C295($_ptr_Field->)
			$_bo_Update:=False:C215
			Case of 
				: ($_l_DataType=Is alpha field:K8:1)
					$_ptr_DataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is text:K8:3)
					$_ptr_DataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Text")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is real:K8:4)
					$_ptr_DataArray:=Get pointer:C304("DIA_ar_"+$_t_HeaderString+"_Real")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is longint:K8:6)
					$_ptr_DataArray:=Get pointer:C304("DIA_al"+$_t_HeaderString+"_Longint")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is integer:K8:5)
					$_ptr_DataArray:=Get pointer:C304("DIA_ai_"+$_t_HeaderString+"_Integer")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is date:K8:7)
					$_ptr_DataArray:=Get pointer:C304("DIA_ad_"+$_t_HeaderString+"_Date")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is time:K8:8)
					$_ptr_DataArray:=Get pointer:C304("DIA_ati"+$_t_HeaderString+"_Time")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is boolean:K8:9)
					$_ptr_DataArray:=Get pointer:C304("DIA_abo"+$_t_HeaderString+"_Boolean")
					$_bo_Update:=True:C214
			End case 
			If ($_l_DataType=Is time:K8:8) & (False:C215)
				$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArray->{$_l_Index}))
				$_ptr_Field->:=$_ti_Time
			Else 
				If ($_bo_Update)
					$_ptr_Field->:=$_ptr_DataArray->{$_l_Index}
				End if 
			End if 
			Diary_InD
			
			
			
		End for 
		
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		Transact_End
	End if 
End if 
ERR_MethodTrackerReturn("DM_MODIFYDIARY"; $_t_oldMethodName)