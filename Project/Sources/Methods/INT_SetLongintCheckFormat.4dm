//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_SetLongintCheckFormat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INT_SetLongintCheckFormat")
If (Count parameters:C259>=1)
	
	If (Is macOS:C1572)
		OBJECT SET FORMAT:C236($1->; "Yes;;No")
		//$Format:=Char(0x2713)+";;"+Char(0x2715)
		//$Format:=Char(0x0100)+";;"+Char(0x0101)
		//ALERT($Format)
		//SET FORMAT($1->;$Format)
		
		
		//SET FORMAT($1->;Char(0x0080)+";;"+Char(0x0081)))
	Else 
		OBJECT SET FORMAT:C236($1->; "Yes;;No")
	End if 
End if 
ERR_MethodTrackerReturn("INT_SetLongintCheckFormat"; $_t_oldMethodName)