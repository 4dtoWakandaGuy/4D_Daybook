//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TablesPalette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2014 18:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; DB_l_CallBackProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TablesPalette")
If (Count parameters:C259>=1)
	DB_l_CallBackProcess:=$1
	Open window:C153(20; 60; 238+20; 277+60; -(Palette window:K34:3)+3)
	
	DIALOG:C40("TABLESPALLETE")
	CLOSE WINDOW:C154
End if 
ERR_MethodTrackerReturn("DB_TablesPalette"; $_t_oldMethodName)