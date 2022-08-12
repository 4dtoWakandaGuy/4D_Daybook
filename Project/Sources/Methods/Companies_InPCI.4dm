//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InPCI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_LoqateAddressing; $0)
	C_LONGINT:C283(<>PCC; $_l_PostcodeChecks; i)
	C_TEXT:C284($_t_oldMethodName; Vsubgroup1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InPCI")
$0:=True:C214
If ([COMPANIES:2]Invoice_Country:23="")
	$_l_PostcodeChecks:=<>PCC
Else 
	RELATE ONE:C42([COMPANIES:2]Invoice_Country:23)
	RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
	$_l_PostcodeChecks:=Num:C11([ADDRESS_FORMATS:74]Check_PostalCode:14)+Num:C11(([ADDRESS_FORMATS:74]Check_PostalCode:14) & ([ADDRESS_FORMATS:74]Enforce_PostalCode:15))
End if 
If ($_l_PostcodeChecks>0)
	If ((<>SYS_bo_LoqateAddressing) & (DB_GetModuleSettingByNUM(35)>1))  //Use the QA Method
		If (QA_Lookup("I"))
			
		Else 
			If ($_l_PostcodeChecks=1)
				Vsubgroup1:=""
				PLUGCALL_QuickAddress("err"; i; ->Vsubgroup1)
				Gen_Confirm("QuickAddress Lookup error: "+Vsubgroup1+" ("+String:C10(i)+")"; "Try again"; "Allow")
				If (OK=1)
					GOTO OBJECT:C206([COMPANIES:2]Invoice_Postcode:22)
					REJECT:C38([COMPANIES:2]Invoice_Postcode:22)
					$0:=False:C215
				End if 
			Else 
				PLUGCALL_QuickAddress("err"; i; ->Vsubgroup1)
				Gen_Alert("QuickAddress Lookup error: "+Vsubgroup1+" ("+String:C10(i)+")"; "Try again")
				GOTO OBJECT:C206([COMPANIES:2]Invoice_Postcode:22)
				REJECT:C38([COMPANIES:2]Invoice_Postcode:22)
				$0:=False:C215
			End if 
		End if 
	Else 
		If (Check_Postcode([COMPANIES:2]Invoice_Postcode:22)=False:C215)
			If ($_l_PostcodeChecks=1)
				Gen_Confirm("That Postcode is not correctly formatted"; "Try again"; "Allow")
				If (OK=1)
					GOTO OBJECT:C206([COMPANIES:2]Invoice_Postcode:22)
					REJECT:C38([COMPANIES:2]Invoice_Postcode:22)
					$0:=False:C215
				End if 
			Else 
				Gen_Alert("That Postcode is not correctly formatted"; "Try again")
				GOTO OBJECT:C206([COMPANIES:2]Invoice_Postcode:22)
				REJECT:C38([COMPANIES:2]Invoice_Postcode:22)
				$0:=False:C215
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Companies_InPCI"; $_t_oldMethodName)