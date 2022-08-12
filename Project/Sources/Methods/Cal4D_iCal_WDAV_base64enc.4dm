//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_base64enc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_iCal_WDAV_base64enc
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_base64enc")

// Method: WDAV_base64enc
//---------------------------------------------------
// Description:  Private
// function called by WDAV_EncodeB64
//
//---------------------------------------------------
// By: Julien Feasson - 4D, Inc.
//---------------------------------------------------


If (($1>=0) & ($1<=25))
	$0:=$1+Character code:C91("A")
Else 
	If (($1>=26) & ($1<=51))
		$0:=$1-26+Character code:C91("a")
	Else 
		If (($1>=52) & ($1<=61))
			$0:=$1-52+Character code:C91("0")
		Else 
			If ($1=62)
				$0:=Character code:C91("+")
			Else 
				If ($1=63)
					$0:=Character code:C91("/")
				Else 
					$0:=Character code:C91("=")
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_base64enc"; $_t_oldMethodName)