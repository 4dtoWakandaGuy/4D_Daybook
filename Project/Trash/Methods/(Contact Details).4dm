//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contact Details
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; vContName; vDept; vExtn; vJobTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contact Details")
vContName:=[CONTACTS:1]Contact_Name:31
vJobTitle:=[CONTACTS:1]Job_Title:6
vDept:=[CONTACTS:1]Dept:8
vExtn:=[CONTACTS:1]Extn:9
If (Count parameters:C259>=1)
	$1->:=[CONTACTS:1]Email_Address:35
	If (Count parameters:C259>=2)
		$2->:=[CONTACTS:1]Mobile:12
	End if 
End if 
ERR_MethodTrackerReturn("Contact Details"; $_t_oldMethodName)