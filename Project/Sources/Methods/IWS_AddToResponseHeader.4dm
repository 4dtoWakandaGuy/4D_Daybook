//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_AddToResponseHeader
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
	C_LONGINT:C283($iInsert; $iLength)
	C_TEXT:C284(<>STR_t_CRLF; $_t_oldMethodName; $1; $2; $MimePairText; $sChar; $tField; $tValue; IWS_t_ResponseHeader)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_AddToResponseHeader")
//******************************************************************************
//
//Method: IWS_AddToResponseHeader

//Written by  John Moore on 1/11/99
//Rewritten Rollo 9/1/2000 - cope with double requests for inserts where invalid

//Purpose: adds a MIME field/value pair to the HTTP response header which is
//to be sent back to the browser.
//E.g., IWS_AddToResponseHeader("Content-type","text/html")

//$1 - text, MIME field
//$2 - text, value

//******************************************************************************


$tField:=$1
$tValue:=$2

If (IWS_t_ResponseHeader="")
	IWS_SetResponseHeader  //just in case
End if 

$iInsert:=0

//Rollo 9/2/2000 - John says he doesn't want this case now!
//If ($tField="Set-Cookie")
//$iInsert:=Position($tField+": ";IWS_t_ResponseHeader)
//End if

If ($iInsert>0)
	$iInsert:=$iInsert+Length:C16($tField)
	$iLength:=Length:C16(IWS_t_ResponseHeader)
	$sChar:=Substring:C12(<>STR_t_CRLF; 1; 1)
	
	While ($iInsert<$iLength)  //find first CR in optimal way
		$iInsert:=$iInsert+1
		If (IWS_t_ResponseHeader[[$iInsert]]=$sChar)
			$iLength:=0
		End if 
	End while 
	
	$MimePairText:=", "+$tValue
Else 
	$iInsert:=Length:C16(IWS_t_ResponseHeader)-1
	$MimePairText:=$tField+" :"+$tValue+<>STR_t_CRLF
End if 

IWS_t_ResponseHeader:=Insert string:C231(IWS_t_ResponseHeader; $MimePairText; $iInsert)

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_AddToResponseHeader"; $_t_oldMethodName)
