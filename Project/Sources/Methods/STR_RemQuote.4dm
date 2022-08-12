//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_RemQuote
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
	C_BOOLEAN:C305($bFirst; $bLast)
	C_LONGINT:C283($iLength)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $_t_Text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_RemQuote")
//******************************************************************************
//
//Method: STR_RemQuote
//
//Written by  Rollo on 12/14/98 - actually, optimized on this date
//
//Purpose: Removes first & last quotes
//
//******************************************************************************

If (Count parameters:C259>=1)
	
	$_t_Text:=$1
	$iLength:=Length:C16($_t_Text)
	
	If ($iLength>1)
		$bFirst:=(Character code:C91($_t_Text[[1]])=Double quote:K15:41)
		$bLast:=(Character code:C91($_t_Text[[$iLength]])=Double quote:K15:41)
		Case of 
			: ($bFirst & $bLast)
				If ($iLength>2)
					$_t_Text:=Substring:C12($_t_Text; 2; $iLength-2)
				Else 
					$_t_Text:=""
				End if 
			: ($bFirst)
				$_t_Text:=Substring:C12($_t_Text; 2)
			: ($bLast)
				$_t_Text:=Substring:C12($_t_Text; 1; $iLength-1)
		End case 
	End if 
End if 
$0:=$_t_Text
ERR_MethodTrackerReturn("STR_RemQuote"; $_t_oldMethodName)