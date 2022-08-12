//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME AccessUpdate
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
	C_TEXT:C284($_t_oldMethodName; $1; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME AccessUpdate")
//IME AccessUpdate

READ WRITE:C146([WEB_ACCESS:130])

QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=vWebRef)
If (Records in selection:C76([WEB_ACCESS:130])=0)
	If (Count parameters:C259>0)
		IME_AccessCreate($1)
	Else 
		IME_AccessCreate
	End if 
Else 
	[WEB_ACCESS:130]Hits:8:=[WEB_ACCESS:130]Hits:8+1
	SAVE RECORD:C53([WEB_ACCESS:130])
	UNLOAD RECORD:C212([WEB_ACCESS:130])
End if 
ERR_MethodTrackerReturn("IME AccessUpdate"; $_t_oldMethodName)