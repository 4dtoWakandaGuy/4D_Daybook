//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ModifyCompany
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
	C_LONGINT:C283($_l_Datatype; $_l_Index; $2; $3; DM_l_ValidityCheck; vAdd; vCM)
	C_POINTER:C301($_ptr_DataArray; $_ptr_Field; $_Ptr_HeaderFields)
	C_TEXT:C284($_t_HeaderString; $_t_oldMethodName; $1; $4; $5; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ModifyCompany")

//this method will simulate the process of modifying a company record
//note that at the point this is called
//$1=The company code(already checked)
//$2=Validity check code
//$3=Any data options(such as printing etc)
//$4=Header string

If (Count parameters:C259>=2)
	If ($2=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		//this may be called by the process creating a contact
		//in which case we have looked for the company already
		//but it could equally be called in isolation
		//so first we check if the company exists
		$_t_HeaderString:=$4
		$_Ptr_HeaderFields:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
		
		//here the work begins.
		
		StartTransaction
		Start_Process
		vCM:=0
		vAdd:=1
		DB_t_CurrentFormUsage:="None"
		READ WRITE:C146([COMPANIES:2])
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
		Companies_InLPß("B")
		For ($_l_Index; 1; Size of array:C274($_Ptr_HeaderFields->))
			$_ptr_Field:=Field:C253(Table:C252(->[COMPANIES:2]); $_Ptr_HeaderFields->{$_l_Index})
			$_l_Datatype:=Type:C295($_ptr_Field->)
			$_bo_Update:=False:C215
			Case of 
				: ($_l_Datatype=Is alpha field:K8:1)
					$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_Datatype=Is text:K8:3)
					$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
					If ($_ptr_DataArray->{$_l_Index}#"")
						$_bo_Update:=True:C214
					End if 
				: ($_l_Datatype=Is real:K8:4)
					$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
					If ($_ptr_DataArray->{$_l_Index}#0)
						$_bo_Update:=True:C214
					End if 
				: ($_l_Datatype=Is longint:K8:6)
					$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
					If ($_ptr_DataArray->{$_l_Index}#0)
						$_bo_Update:=True:C214
					End if 
				: ($_l_Datatype=Is integer:K8:5)
					$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
					If ($_ptr_DataArray->{$_l_Index}#0)
						$_bo_Update:=True:C214
					End if 
				: ($_l_Datatype=Is date:K8:7)
					$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
					If ($_ptr_DataArray->{$_l_Index}#!00-00-00!)
						$_bo_Update:=True:C214
					End if 
				: ($_l_Datatype=Is time:K8:8)
					$_ptr_DataArray:=Get pointer:C304("CUS_ati_"+$_t_HeaderString+"_Time")
				: ($_l_Datatype=Is boolean:K8:9)
					$_ptr_DataArray:=Get pointer:C304("CUS_aBo_"+$_t_HeaderString+"_Boolean")
					$_bo_Update:=True:C214
					
			End case 
			If ($_l_Datatype=Is time:K8:8) & (False:C215)
				$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArray->{$_l_Index}))
				If ($_ti_Time#?00:00:00?)
					$_ptr_Field->:=$_ti_Time
				End if 
			Else 
				If ($_bo_Update)
					$_ptr_Field->:=$_ptr_DataArray->{$_l_Index}
				End if 
			End if 
			
			Companies_InLPD
		End for 
		Companies_InBDe
		DB_SaveRecord(->[COMPANIES:2])
		AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		
		Transact_End
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DM_ModifyCompany"; $_t_oldMethodName)