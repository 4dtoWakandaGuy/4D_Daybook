//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_URLEncoder
	//------------------ Method Notes ------------------
	// Method: WDAV_URLEncoder
	//---------------------------------------------------
	// Description:
	//
	//     Translate an iso string to a URL encoded string
	//
	//---------------------------------------------------
	// Parameters:
	//     Passed: $1: string to be encoded to URL format
	//     Returned: $0 : Encoded string
	//---------------------------------------------------
	// By: Julien Feasson - 4D, Inc.
	//---------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:28`Method: Cal4D_iCal_WDAV_URLEncoder
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WSPCharCode; $_l_WSPIndex)
	C_TEXT:C284($_t_oldMethodName; $_t_WSPChar; $_t_WSPString; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_URLEncoder")


$0:=""

$_t_WSPString:=$1

// If the charset is different than Latin-1 please add your translation below

// Parse the string and translate the special characters
For ($_l_WSPIndex; 1; Length:C16($_t_WSPString))
	$_t_WSPChar:=Substring:C12($_t_WSPString; $_l_WSPIndex; 1)
	If ((($_t_WSPChar>="a'") & ($_t_WSPChar<="z'")) | (($_t_WSPChar>="A") & ($_t_WSPChar<="Z")) | (($_t_WSPChar>="0") & ($_t_WSPChar<="9")) | ($_t_WSPChar="*") | ($_t_WSPChar="-") | ($_t_WSPChar=".") | ($_t_WSPChar="_") | ($_t_WSPChar="/"))
		$0:=$0+$_t_WSPChar
	Else 
		$0:=$0+"%"
		$_l_WSPCharCode:=Character code:C91($_t_WSPChar)\16
		If ($_l_WSPCharCode<10)
			$0:=$0+String:C10($_l_WSPCharCode)
		Else 
			$0:=$0+Char:C90(Character code:C91("A")+$_l_WSPCharCode-10)
		End if 
		$_l_WSPCharCode:=Character code:C91($_t_WSPChar)%16
		If ($_l_WSPCharCode<10)
			$0:=$0+String:C10($_l_WSPCharCode)
		Else 
			$0:=$0+Char:C90(Character code:C91("A")+$_l_WSPCharCode-10)
		End if 
	End if 
End for 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_URLEncoder"; $_t_oldMethodName)