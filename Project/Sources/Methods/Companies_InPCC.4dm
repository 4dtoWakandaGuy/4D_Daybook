//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InPCC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:57
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_InPCC")
$0:=True:C214
If ([COMPANIES:2]Country:8="")
	$_l_PostcodeChecks:=<>PCC
Else 
	RELATE ONE:C42([COMPANIES:2]Country:8)
	RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
	$_l_PostcodeChecks:=Num:C11([ADDRESS_FORMATS:74]Check_PostalCode:14)+Num:C11(([ADDRESS_FORMATS:74]Check_PostalCode:14) & ([ADDRESS_FORMATS:74]Enforce_PostalCode:15))
End if 
If ($_l_PostcodeChecks>0)
	If ((<>SYS_bo_LoqateAddressing) & (DB_GetModuleSettingByNUM(35)>1))  //Use the QA Method
		If (QA_Lookup)
			If (Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49))
			End if 
		Else 
			//If (is windows )
			//If ($>55000)
			//i:=i-65536
			//End if
			//PLUGCALL_QuickAddress ("err";i;->Vsubgroup1)
			
			//Else
			PLUGCALL_QuickAddress("err"; i; ->Vsubgroup1)
			
			//End if
			If ($_l_PostcodeChecks=1)
				Gen_Confirm("QuickAddress Lookup error: "+vSubGroup1+" ("+String:C10(i)+")"; "Try again"; "Allow")
				If (OK=1)
					GOTO OBJECT:C206([COMPANIES:2]Postal_Code:7)
					REJECT:C38([COMPANIES:2]Postal_Code:7)
					$0:=False:C215
				End if 
			Else 
				Gen_Alert("QuickAddress Lookup error: "+vSubGroup1+" ("+String:C10(i)+")"; "Try again")
				GOTO OBJECT:C206([COMPANIES:2]Postal_Code:7)
				REJECT:C38([COMPANIES:2]Postal_Code:7)
				$0:=False:C215
			End if 
		End if 
	Else 
		If ((Check_Postcode([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Mailsort_OFN:50)=False:C215) | (Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49)=False:C215))
			If ($_l_PostcodeChecks=1)
				Gen_Confirm("That Postcode is not correctly formatted"; "Try again"; "Allow")
				If (OK=1)
					GOTO OBJECT:C206([COMPANIES:2]Postal_Code:7)
					REJECT:C38([COMPANIES:2]Postal_Code:7)
					$0:=False:C215
				End if 
			Else 
				Gen_Alert("That Postcode is not correctly formatted"; "Try again")
				GOTO OBJECT:C206([COMPANIES:2]Postal_Code:7)
				REJECT:C38([COMPANIES:2]Postal_Code:7)
				$0:=False:C215
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Companies_InPCC"; $_t_oldMethodName)