//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel PictFind
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
	C_TEXT:C284(<>TelPCPath; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel PictFind")

If (<>TelServer)
	If (([PICTURES:85]Picture_Code:1#$1) & ([PICTURES:85]Picture_Name:2#$1))
		QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Name:2=$1)
		If (Records in selection:C76([PICTURES:85])=0)
			QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$1)
		End if 
	End if 
	If (Records in selection:C76([PICTURES:85])>0)
		$0:=<>TelPCPath+Tel_PictCode11([PICTURES:85]Picture_Code:1)
	Else 
		BEEP:C151
		$0:=<>TelPCPath+Tel_PictCode11($1)  //Will change to "" if all the SNDs are mirrored on the Mac
	End if 
End if 
ERR_MethodTrackerReturn("Tel PictFind"; $_t_oldMethodName)