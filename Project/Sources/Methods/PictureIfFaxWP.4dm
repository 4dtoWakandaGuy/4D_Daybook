//%attributes = {}
If (False:C215)
	//Project Method Name:      PictureIfFaxWP
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
	C_BOOLEAN:C305(<>Faxing)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PictureIfFaxWP")
//C_PICTURE($0)
If (<>Faxing)
	QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$1)
	// $0:=[PICTURES]Picture
	// UNLOAD RECORD([PICTURES])
Else 
	REDUCE SELECTION:C351([PICTURES:85]; 0)
	// $0:=[PICTURES]Picture
End if 
$0:=""
ERR_MethodTrackerReturn("PictureIfFaxWP"; $_t_oldMethodName)
