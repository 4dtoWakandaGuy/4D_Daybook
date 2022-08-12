//%attributes = {}

If (False:C215)
	//Database Method Name:      Get_Bit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($1; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Get_Bit")
$0:=($1 ?? $2)
ERR_MethodTrackerReturn("Get_Bit"; $_t_oldMethodName)