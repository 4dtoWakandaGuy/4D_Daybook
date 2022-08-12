//%attributes = {}
If (False:C215)
	//Project Method Name:      Screen
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
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Screen")
//Screen
<>SYS_t_FormSizeName:="13"
//Reimplement if another screen size emerges
//If (◊UserScreen="A")
// Case of
//   : (Screen height<=400)
//Approx height for 12" colour
//   ◊Screen:=""
// : (Screen height<=480)
//     ◊Screen:="13"
//   Else
//    ◊Screen:="13"
// End case
//Else
//  If (◊UserScreen="13")
//    ◊Screen:="13"
//  Else
//   ◊Screen:=""
//  End if
//End if
ERR_MethodTrackerReturn("Screen"; $_t_oldMethodName)