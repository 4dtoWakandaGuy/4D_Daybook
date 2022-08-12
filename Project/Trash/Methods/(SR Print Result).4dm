//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SR Print Result
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR Print Result")
//SR Print Result - see also SR Print
Case of 
	: (Count parameters:C259=2)
		$0:=SR_Print_Res2($1; $2)
	: (Count parameters:C259>=3)
		$0:=SR_Print_Res2($1; $2; $3)
	Else 
		$0:=0
End case 
ERR_MethodTrackerReturn("SR Print Result"; $_t_oldMethodName)