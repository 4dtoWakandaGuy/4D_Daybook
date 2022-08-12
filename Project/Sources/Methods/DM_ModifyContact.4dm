//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ModifyContact
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Update)
	C_LONGINT:C283($_l_DataRow; $_l_DataType; $_l_Index; $7; DM_l_ValidityCheck; vAdd)
	C_POINTER:C301($_ptr_DataArray; $_ptr_DetailFields; $_ptr_Field)
	C_REAL:C285($3; $4)
	C_TEXT:C284($_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $1; $2; $5; $6; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DM_t_CallingCompanyCode)
	C_TEXT:C284(DM_t_CallingCompanyName; DM_t_CallingCompanyPostCode; SYS_t_AccessType)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ModifyContact")
//this method will simulate updating a contact record.
//this will NOT change clear values in fields
//it will add data that is not there
//and change data
$_l_DataRow:=$7
$_t_HeaderString:=$5
$_t_DetailString:=$6
If (Count parameters:C259>=6)
	If ($3=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		DM_ModifyCompany($1; $3; $4; $5)
		StartTransaction
		Start_Process
		vAdd:=1
		SYS_t_AccessType:=""
		DB_t_CurrentFormUsage:="None"
		READ WRITE:C146([CONTACTS:1])
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$2)
		//note that this generates CONTACTS NOT THE COMPANY
		Contacts_InLPB(False:C215)
		$_ptr_DetailFields:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Fields")
		For ($_l_Index; 1; Size of array:C274($_ptr_DetailFields->))
			$_ptr_Field:=Field:C253(Table:C252(->[CONTACTS:1]); $_ptr_DetailFields->{$_l_Index})
			$_l_DataType:=Type:C295($_ptr_Field->)
			$_bo_Update:=False:C215
			Case of 
				: ($_l_DataType=Is alpha field:K8:1)
					$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					If ($_ptr_DataArray->{$_l_DataRow}{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
					
				: ($_l_DataType=Is text:K8:3)
					$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Text")
					If ($_ptr_DataArray->{$_l_DataRow}{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is real:K8:4)
					$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailString+"_Real")
					If ($_ptr_DataArray->{$_l_DataRow}{$_l_Index}#0)
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is longint:K8:6)
					$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Longint")
					If ($_ptr_DataArray->{$_l_DataRow}{$_l_Index}#0)
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is integer:K8:5)
					$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailString+"_Integer")
					If ($_ptr_DataArray->{$_l_DataRow}{$_l_Index}#0)
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is date:K8:7)
					$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_DetailString+"_Date")
					If ($_ptr_DataArray->{$_l_DataRow}{$_l_Index}#!00-00-00!)
						$_bo_Update:=True:C214
					End if 
				: ($_l_DataType=Is time:K8:8)
					$_ptr_DataArray:=Get pointer:C304("CUS_ati_"+$_t_DetailString+"_Time")
				: ($_l_DataType=Is boolean:K8:9)
					$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailString+"_Boolean")
					$_bo_Update:=True:C214
					
			End case 
			If ($_l_DataType=Is time:K8:8) & (False:C215)
				$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArray->{$_l_DataRow}{$_l_Index}))
				If ($_ti_Time#?00:00:00?)
					$_ptr_Field->:=$_ti_Time
				End if 
			Else 
				If ($_bo_Update)
					$_ptr_Field->:=$_ptr_DataArray->{$_l_DataRow}{$_l_Index}
				End if 
			End if 
			Contacts_InLPD
		End for 
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		Transact_End
		Process_End
	End if 
End if 
ERR_MethodTrackerReturn("DM_ModifyContact"; $_t_oldMethodName)