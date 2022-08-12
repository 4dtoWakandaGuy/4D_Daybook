//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_PictCreat
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
	C_BOOLEAN:C305(<>TelServer)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>TelPCPath; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_PictCreat")
//Tel_PictCreat

If (<>TelServer)
	CREATE RECORD:C68([PICTURES:85])
	[PICTURES:85]Picture_Code:1:="M"+String:C10(AA_GetNextIDinMethod(->[PICTURES:85]Picture_Code:1; Sequence number:C244([PICTURES:85])))
	
	[PICTURES:85]Picture_Name:2:="Message "+String:C10(<>DB_d_CurrentDate)
	$0:=<>TelPCPath+Tel_PictCode11([PICTURES:85]Picture_Code:1)
End if 
ERR_MethodTrackerReturn("Tel_PictCreat"; $_t_oldMethodName)