//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_FaxSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_Error; $0)
	C_POINTER:C301($_Ptr_CurrentTable; $2)
	C_TEXT:C284($_t_CompanyFAX; $_t_ContactFAX; $_t_ContactName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_FaxSetup")
$_Ptr_CurrentTable:=$2
$_t_CompanyFAX:=Str_TelPrefStri(Str_TelStrip([COMPANIES:2]Fax:10))
$_t_ContactFAX:=Str_TelPrefStri(Str_TelStrip([CONTACTS:1]Fax:19))
If ($_t_ContactFAX#"")
	If ($_t_CompanyFAX="")
		$_t_CompanyFAX:=$_t_ContactFAX
	Else 
		If (Records in selection:C76([CONTACTS:1])=1)
			If ($_t_CompanyFAX#$_t_ContactFAX)
				Gen_Confirm("The Company Fax No is "+$_t_CompanyFAX+Char:C90(13)+"The Contact Fax No is "+$_t_ContactFAX+Char:C90(13)+"Which do you want?"; "Contact"; "Company")
				If (OK=1)
					$_t_CompanyFAX:=$_t_ContactFAX
				Else 
					OK:=1
				End if 
			End if 
		Else 
			If ($1=False:C215)
				$_t_CompanyFAX:=$_t_ContactFAX
			End if 
		End if 
	End if 
End if 
$_t_ContactName:=[CONTACTS:1]Contact_Name:31
If ($_t_CompanyFAX#"")
	$_l_Error:=Fax_StartM2([COMPANIES:2]Company_Name:2; $_t_ContactName; $_t_CompanyFAX)
	$0:=$_l_Error
	If ($_l_Error=0)
		If (Records in selection:C76($_Ptr_CurrentTable->)>1)
			MESSAGE:C88("   "+$_t_ContactName+(", "*(Num:C11($_t_ContactName#"")))+[COMPANIES:2]Company_Name:2+" on "+$_t_CompanyFAX+Char:C90(13))
		End if 
	Else 
		If (Records in selection:C76($_Ptr_CurrentTable->)>1)
			MESSAGE:C88("   "+$_t_ContactName+(", "*(Num:C11($_t_ContactName#"")))+[COMPANIES:2]Company_Name:2+"    Fax Error"+Char:C90(13))
		Else 
			Gen_Alert("An error occurred in connection to your Fax server")
		End if 
	End if 
Else 
	If (Records in selection:C76($_Ptr_CurrentTable->)>1)
		MESSAGE:C88("   "+$_t_ContactName+(", "*(Num:C11($_t_ContactName#"")))+[COMPANIES:2]Company_Name:2+"    No Fax No"+Char:C90(13))
	Else 
		Gen_Alert("No suitable Fax No was found")
	End if 
	$0:=1
End if 
ERR_MethodTrackerReturn("Letter_FaxSetup"; $_t_oldMethodName)