//%attributes = {}
If (False:C215)
	//Project Method Name:      Address_ContactName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_UseEsquire; $_l_UseQualifications; $7; $8; ADR_l_useEsquire; ADR_l_UseQualifications)
	C_POINTER:C301($_ptr_ContactForenames; $_ptr_ContactName; $_ptr_ContactsEquire; $_ptr_ContactsQualifications; $_ptr_ContactSurnames; $_ptr_ContactTitle; $1; $2; $3; $4; $5)
	C_POINTER:C301($6)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Address_ContactName")

$0:=""
$_ptr_ContactName:=->[CONTACTS:1]Contact_Name:31
$_ptr_ContactTitle:=->[CONTACTS:1]Title:3
$_ptr_ContactForenames:=->[CONTACTS:1]Forename:4
$_ptr_ContactSurnames:=->[CONTACTS:1]Surname:5
$_ptr_ContactsEquire:=->[CONTACTS:1]Esquire:27
$_ptr_ContactsQualifications:=->[CONTACTS:1]Qualifications:13
$_l_UseEsquire:=ADR_l_useEsquire
$_l_UseQualifications:=ADR_l_UseQualifications
If (Count parameters:C259>=1)
	$_ptr_ContactName:=$1
	If (Count parameters:C259>=1)
		$_ptr_ContactTitle:=$2
		If (Count parameters:C259>=1)
			$_ptr_ContactForenames:=$3
			If (Count parameters:C259>=1)
				$_ptr_ContactSurnames:=$4
				If (Count parameters:C259>=1)
					$_ptr_ContactsEquire:=$5
					If (Count parameters:C259>=1)
						$_ptr_ContactsQualifications:=$6
						If (Count parameters:C259>=1)
							$_l_UseEsquire:=$7
							If (Count parameters:C259>=1)
								$_l_UseQualifications:=$8
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 




If ($_ptr_ContactName->="")
	If ($_ptr_ContactTitle->#"")
		If ((($_l_UseEsquire=0) | ($_ptr_ContactTitle->#"Mr")) & ($_ptr_ContactsEquire->=False:C215))
			$0:=$_ptr_ContactTitle->+" "
		End if 
	End if 
	If ($_ptr_ContactForenames->#"")
		$0:=$0+$_ptr_ContactForenames->+" "
	End if 
	If ($_ptr_ContactSurnames->#"")
		$0:=$0+$_ptr_ContactSurnames->
	End if 
Else 
	$0:=$_ptr_ContactName->
End if 

If ((($_l_UseEsquire=1) & ($_ptr_ContactTitle->="Mr") & (($_l_UseQualifications=0) | ([CONTACTS:1]Qualifications:13=""))) | ([CONTACTS:1]Esquire:27))
	$0:=$0+" Esq"
End if 
If (($_l_UseQualifications=1) & ($_ptr_ContactsQualifications->#""))
	$0:=$0+", "+$_ptr_ContactsQualifications->
End if 
ERR_MethodTrackerReturn("Address_ContactName"; $_t_oldMethodName)
