//%attributes = {}
If (False:C215)
	//Project Method Name:      Contact_Dets
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
	C_BOOLEAN:C305(<>NoJT)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contact_Dets")
//Contact_Dets
$0:=""
If ([CONTACTS:1]Surname:5#"")
	$0:=$0+[CONTACTS:1]Contact_Name:31+Char:C90(13)
End if 
If (([CONTACTS:1]Job_Title:6#"") & (<>NoJT=False:C215))
	$0:=$0+[CONTACTS:1]Job_Title:6+Char:C90(13)
End if 
If ([CONTACTS:1]Dept:8#"")
	$0:=$0+[CONTACTS:1]Dept:8+Char:C90(13)
End if 
ERR_MethodTrackerReturn("Contact_Dets"; $_t_oldMethodName)