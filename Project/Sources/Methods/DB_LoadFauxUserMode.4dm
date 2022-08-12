//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadFauxUserMode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2014 08:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; ORD_bo_IsRevision)
	C_LONGINT:C283($_l_WindowID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadFauxUserMode")

Start_Process

$_l_WindowID:=Open window:C153(32; 60; 32; 60; Plain window:K34:13; ""; "DB_WindowCallBack")


DIALOG:C40("DB_USERMODE")
$_bo_Continue:=(OK=1)
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("DB_LoadFauxUserMode"; $_t_oldMethodName)