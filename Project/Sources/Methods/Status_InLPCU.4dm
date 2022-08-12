//%attributes = {}
If (False:C215)
	//Project Method Name:      Status_InLPCU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/03/2010 12:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CodeNumbers; 0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Status_InLPCU")
ARRAY LONGINT:C221($_al_CodeNumbers; 3)
$_al_CodeNumbers{1}:=1
$_al_CodeNumbers{2}:=2
$_al_CodeNumbers{3}:=5
Gen_CULPB(->[STATUS:4]Status_Code:1; 5; ->$_al_CodeNumbers; "Contacts"; "Companies"; "Diary")
ERR_MethodTrackerReturn("Status_InLPCU"; $_t_oldMethodName)