//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Quit Name
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Quit Name")
//Quit Name
//NG Feb 2004 Changes for update method

Case of 
	: (Is macOS:C1572)
		$0:="Quit"
		
	Else 
		$0:="Exit"
End case 
ERR_MethodTrackerReturn("Quit Name"; $_t_oldMethodName)