//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote Packet
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
	C_LONGINT:C283($_l_CharPosition; $_l_CharPosition2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; vFld; vRec; vText; vTitle2)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote Packet")
If ((Length:C16(vText)<500) & (vTitle2#""))
	RECEIVE PACKET:C104(vDoc; vTitle2; 32000)
	vText:=vText+vTitle2
End if 
$_l_CharPosition:=Position:C15($1; vText)
If (($_l_CharPosition<1) & (vTitle2#""))
	RECEIVE PACKET:C104(vDoc; vTitle2; 32500-Length:C16(vText))
	vText:=vText+vTitle2
	$_l_CharPosition:=Position:C15($1; vText)
End if 
If ($_l_CharPosition>0)
	$0:=Substring:C12(vText; 1; $_l_CharPosition-1)
	If ($1=vFld)
		$_l_CharPosition2:=Position:C15(vRec; $0)
		If ($_l_CharPosition2>0)
			$0:=Substring:C12($0; 1; $_l_CharPosition2-1)
			vText:=Substring:C12(vText; $_l_CharPosition2; 32500)
		Else 
			vText:=Substring:C12(vText; $_l_CharPosition+1; 32500)
		End if 
	Else 
		vText:=Substring:C12(vText; $_l_CharPosition+1; 32500)
	End if 
Else 
	$0:=vText
End if 
ERR_MethodTrackerReturn("Remote Packet"; $_t_oldMethodName)
