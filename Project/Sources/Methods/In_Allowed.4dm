//%attributes = {}
If (False:C215)
	//Project Method Name:      In_Allowed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 06:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StartProc; $_bo_Return; $0)
	C_LONGINT:C283($_l_Limit; $_l_ModuleAccess; $3; MOD_l_CurrentModuleAccess)
	C_POINTER:C301($_Ptr_CurrentTable; $2)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_Text; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In_Allowed")
<>StartProc:=False:C215

If (Count parameters:C259>=3)
	$_l_ModuleAccess:=$3
Else 
	$_l_ModuleAccess:=MOD_l_CurrentModuleAccess
End if 
If (Count parameters:C259>=2)
	$_bo_Return:=False:C215
	$_t_ContextName:=$1
	$_Ptr_CurrentTable:=$2
	
	If (($_l_ModuleAccess<2) | ($_l_ModuleAccess=3))
		Gen_Alert("You do not have access rights to "+$_t_ContextName; "Cancel")
		$_bo_Return:=False:C215
	Else 
		If ((DB_GetModuleSettingByNUM(34))>0)
			If ((Records in table:C83($_Ptr_CurrentTable->)>199) | (Current user:C182="Demo@"))
				Gen_Alert("You have reached the Daybook Demonstration limit of 200 "+"records in this file"+Char:C90(13)+Char:C90(13)+"You will need to Delete some existing records, or to consider "+"purchasing the software"; "Cancel")
				$_bo_Return:=False:C215
			Else 
				$_bo_Return:=True:C214
			End if 
		Else 
			If ((DB_GetModuleSettingByNUM(24)>0) | (DB_GetModuleSettingByNUM(1)=5))
				If (($_t_ContextName=Get localized string:C991("MenuItem_EnterCompanies")) | ($_t_ContextName=Get localized string:C991("MenuItem_EnterContacts")) | ($_t_ContextName=Get localized string:C991("MenuItem_EnterProducts")) | ($_t_ContextName=Get localized string:C991("MenuItem_EnterCompany")) | ($_t_ContextName=Get localized string:C991("MenuItem_EnterContact")) | ($_t_ContextName=Get localized string:C991("MenuItem_EnterProduct")))
					If ((DB_GetModuleSettingByNUM(1))=5)
						$_l_Limit:=25000
						$_t_Text:="Silver"
					Else 
						$_l_Limit:=999
						$_t_Text:="Lite"
					End if 
					If (Records in table:C83($_Ptr_CurrentTable->)>$_l_Limit)
						Gen_Alert("You have reached the Daybook "+$_t_Text+" upper limit of "+String:C10($_l_Limit+1)+" records in this file"+Char:C90(13)+Char:C90(13)+"You will need to Delete some existing records, or to consider "+"an upgrade to Daybook Gold"; "Cancel")
						$_bo_Return:=False:C215
					Else 
						$_bo_Return:=True:C214
					End if 
				Else 
					If ($_t_ContextName="Add records")
						If ((DB_GetModuleSettingByNUM(1))=5)
							If (Records in table:C83($_Ptr_CurrentTable->)>999)
								Gen_Alert("You have reached the Daybook Silver upper limit of "+"1000 records in this file"+Char:C90(13)+Char:C90(13)+"You will need to Delete some existing records, or to consider "+"an upgrade to Daybook Gold"; "Cancel")
								$_bo_Return:=False:C215
							Else 
								$_bo_Return:=True:C214
							End if 
						Else 
							If (Records in table:C83($_Ptr_CurrentTable->)>499)
								Gen_Alert("You have reached the Daybook Silver and Lite upper limit of "+"500 records in this file"+Char:C90(13)+Char:C90(13)+"You will need to Delete some existing records, or to consider "+"an upgrade to Daybook Gold"; "Cancel")
								$_bo_Return:=False:C215
							Else 
								$_bo_Return:=True:C214
							End if 
						End if 
					Else 
						$_bo_Return:=True:C214
					End if 
				End if 
			Else 
				$_bo_Return:=True:C214
			End if 
		End if 
	End if 
Else 
	Gen_Alert("This method (InAllowed) required 2 parameters")
End if 
$0:=$_bo_Return

ERR_MethodTrackerReturn("In_Allowed"; $_t_oldMethodName)
