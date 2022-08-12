//%attributes = {}
If (False:C215)
	//Project Method Name:      PictureIfFaxSR
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
	C_PICTURE:C286($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PictureIfFaxSR")
If (<>Faxing)
	QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$1)
	$0:=[PICTURES:85]Picture:3
	UNLOAD RECORD:C212([PICTURES:85])
Else 
	REDUCE SELECTION:C351([PICTURES:85]; 0)
	$0:=[PICTURES:85]Picture:3
End if 
ERR_MethodTrackerReturn("PictureIfFaxSR"; $_t_oldMethodName)