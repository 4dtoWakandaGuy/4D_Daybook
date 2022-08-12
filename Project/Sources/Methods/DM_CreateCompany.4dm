//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_CreateCompany
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
	C_BOOLEAN:C305($_bo_Modified)
	C_LONGINT:C283($_l_DataType; $_l_FieldPosition; $_l_Index; $1; $2; DM_l_ValidityCheck; vAdd; vCM)
	C_POINTER:C301($_Ptr_DataString; $_ptr_Field; $_ptr_HeaderFields; $_ptr_SourceDate; $4)
	C_TEXT:C284($_t_HeaderString; $_t_oldMethodName; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DM_t_CallingCompanyCode; DM_t_CallingCompanyName; DM_t_CallingCompanyPostCode)
	C_TIME:C306($_ti_time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_CreateCompany")
//this method will simulate the process of creating a company record
//IT WILL NOT SIMULATE ADDING ANY CONTACTS TO IT!!
//note that at the point this is called
//$1=Validity check code
//$2=Any data options(such as printing etc)
//$3=Header string
//$4=Pointer to variable in which to put company code

If (Count parameters:C259>=2)
	If ($1=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		//this may be called by the process creating a contact
		//in which case we have looked for the company already
		//but it could equally be called in isolation
		//so first we check if the company exists
		$_t_HeaderString:=$3
		$_ptr_HeaderFields:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
		$_l_FieldPosition:=Find in array:C230($_ptr_HeaderFields->; Field:C253(->[COMPANIES:2]Company_Code:1))
		If ($_l_FieldPosition>0)
			$_ptr_SourceDate:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Strings")
			DM_t_CallingCompanyCode:=$_ptr_SourceDate->{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_HeaderFields->; Field:C253(->[COMPANIES:2]Company_Name:2))
		If ($_l_FieldPosition>0)
			$_ptr_SourceDate:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Strings")
			DM_t_CallingCompanyName:=$_ptr_SourceDate->{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_HeaderFields->; Field:C253(->[COMPANIES:2]Postal_Code:7))
		If ($_l_FieldPosition>0)
			$_ptr_SourceDate:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
			DM_t_CallingCompanyPostCode:=$_ptr_SourceDate->{$_l_FieldPosition}
		End if 
		If (DM_t_CallingCompanyCode="") & (DM_t_CallingCompanyPostCode#"") & (DM_t_CallingCompanyName#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=DM_t_CallingCompanyName; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Postal_Code:7=DM_t_CallingCompanyPostCode)
			If (Records in selection:C76([COMPANIES:2])>=1)
				DM_t_CallingCompanyCode:=[COMPANIES:2]Company_Code:1
			End if 
		End if 
		
		If (DM_t_CallingCompanyCode="")
			//here the work begins.
			
			StartTransaction
			Start_Process
			vCM:=0
			vAdd:=1
			DB_t_CurrentFormUsage:="None"
			READ WRITE:C146([COMPANIES:2])
			CREATE RECORD:C68([COMPANIES:2])
			Companies_InLPß("B")
			For ($_l_Index; 1; Size of array:C274($_ptr_HeaderFields->))
				$_ptr_Field:=Field:C253(Table:C252(->[COMPANIES:2]); $_ptr_HeaderFields->{$_l_Index})
				$_l_DataType:=Type:C295($_ptr_Field->)
				Case of 
					: ($_l_DataType=Is alpha field:K8:1)
						$_Ptr_DataString:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
					: ($_l_DataType=Is text:K8:3)
						$_Ptr_DataString:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
					: ($_l_DataType=Is real:K8:4)
						$_Ptr_DataString:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
					: ($_l_DataType=Is longint:K8:6)
						$_Ptr_DataString:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
					: ($_l_DataType=Is integer:K8:5)
						$_Ptr_DataString:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
					: ($_l_DataType=Is date:K8:7)
						$_Ptr_DataString:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
					: ($_l_DataType=Is time:K8:8)
						$_Ptr_DataString:=Get pointer:C304("CUS_ati_"+$_t_HeaderString+"_Time")
					: ($_l_DataType=Is boolean:K8:9)
						$_Ptr_DataString:=Get pointer:C304("CUS_abo_"+$_t_HeaderString+"_Boolean")
				End case 
				If ($_l_DataType=Is time:K8:8) & (False:C215)
					$_ti_time:=Time:C179(Time string:C180($_Ptr_DataString->{$_l_Index}))
					$_ptr_Field->:=$_ti_time
				Else 
					$_ptr_Field->:=$_Ptr_DataString->{$_l_Index}
				End if 
				Companies_InLPD
			End for 
			//put company code on here if its empty
			If ([COMPANIES:2]Company_Code:1="")
				Company_No
			End if 
			Companies_InBDe
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			$4->:=[COMPANIES:2]Company_Code:1
			Transact_End
		Else 
			$_bo_Modified:=True:C214
		End if 
		If ($_bo_Modified)
			DM_ModifyCompany(DM_t_CallingCompanyCode; $1; $2; $3)
		End if 
		
		
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("DM_CreateCompany"; $_t_oldMethodName)