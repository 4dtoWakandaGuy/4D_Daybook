//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen SelbyForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen SelbyForm")
$0:=((Records in selection:C76($1->)/Records in table:C83($1->))<0.01)
ERR_MethodTrackerReturn("Gen SelbyForm"; $_t_oldMethodName)