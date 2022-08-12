//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Fonts
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
	C_LONGINT:C283(<>DataSize; <>TextSize; <>TitleSize)
	C_TEXT:C284(<>FormFont; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Fonts")
If ([USER:15]Printing Font:102="")
	<>FormFont:="Times"
Else 
	<>FormFont:=[USER:15]Printing Font:102
End if 
If ([USER:15]Title Size:103=0)
	<>TitleSize:=24
Else 
	<>TitleSize:=[USER:15]Title Size:103
End if 
If ([USER:15]Text Size:104=0)
	<>TextSize:=10
Else 
	<>TextSize:=[USER:15]Text Size:104
End if 
If ([USER:15]Data Size:105=0)
	<>DataSize:=12
Else 
	<>DataSize:=[USER:15]Data Size:105
End if 
ERR_MethodTrackerReturn("User Fonts"; $_t_oldMethodName)