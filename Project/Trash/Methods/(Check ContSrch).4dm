//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_ContSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ContSrch")
If (<>SelOr)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$1->; *)
	QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Forename:4=$1->; *)
	QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Contact_Code:2=$1->; *)
Else 
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$1->; *)
End if 

QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
ERR_MethodTrackerReturn("Check_ContSrch"; $_t_oldMethodName)