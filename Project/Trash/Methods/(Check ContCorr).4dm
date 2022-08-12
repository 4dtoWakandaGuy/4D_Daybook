//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_ContCorr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 16:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	C_BOOLEAN:C305(<>MultiCo; <>SYS_bo_ContactDuplicateCheck; $0)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Search)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ContCorr")
$0:=False:C215
If ($1->#"")
	If ((<>SYS_bo_ContactDuplicateCheck) & (([CONTACTS:1]Duplicate_State:26="") | ([CONTACTS:1]Duplicate_State:26="U@") | ([CONTACTS:1]Duplicate_State:26="D@")))
		$0:=True:C214
	Else 
		If (<>MultiCo)
			$_t_Search:=$1->
			If (<>MultiCo)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
				If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
					$0:=True:C214
				End if 
			Else 
				If ([CONTACTS:1]Company_Code:1=$_t_Search)
					$0:=True:C214
				End if 
			End if 
			
		Else 
			If ([CONTACTS:1]Company_Code:1#$1->)
				$0:=True:C214
			End if 
		End if 
	End if 
End if 
If ($0)
	$2->:=""
	RELATE ONE:C42($2->)
End if 
ERR_MethodTrackerReturn("Check_ContCorr"; $_t_oldMethodName)
