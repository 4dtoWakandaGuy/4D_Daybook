//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Control
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:17
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Control")
//$caps:=
//GetModifiers ($Caps;$Shift;$Option;$Command;$Control)
Case of 
	: (Is macOS:C1572)
		
		$0:=(Macintosh control down:C544)
	Else 
		$0:=(Windows Ctrl down:C562)
End case 
ERR_MethodTrackerReturn("Gen Control"; $_t_oldMethodName)