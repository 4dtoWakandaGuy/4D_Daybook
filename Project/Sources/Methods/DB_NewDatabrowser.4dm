//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_NewDatabrowser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/05/2010 12:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_NewDatabrowser")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
Start_Process
DB_l_CurrentDisplayedForm:=Num:C11($_t_MenuItemParameter)

Open window:C153(32; 60; 32; 60; Plain window:K34:13; ""; "DB_WindowCallBack")
//Open window(32;60;490+32;350+60;Plain window;"";"DB_WindowCallBack")

DIALOG:C40("DB_OutputForm")
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("DB_NewDatabrowser"; $_t_oldMethodName)