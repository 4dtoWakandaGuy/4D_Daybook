//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CookieSet
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
	C_BOOLEAN:C305($3; $bEncrypt)
	C_LONGINT:C283($4; $iMaxAge; $iParameters)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $sCookieName; $tCookieValue)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CookieSet")
//IME_CookieSet
//Rollo 12/21/99


$iParameters:=Count parameters:C259

If ($iParameters>1)
	
	$sCookieName:=$1
	
	If ($iParameters>2)
		$bEncrypt:=$3
	Else 
		$bEncrypt:=True:C214
	End if 
	
	If ($bEncrypt)
		$tCookieValue:=IME_EncryptSimple($2)
	Else 
		$tCookieValue:=$2
	End if 
	
	//Rollo 9/28/2000 -temporarily never expire the cookies due to a Resin
	//problem with setting expires headers & clock differences
	
	If ($iParameters>3)
		$iMaxAge:=$4  //seconds
	Else 
		$iMaxAge:=MAXLONG:K35:2
	End if 
	
	
	//a special rule that allows you to create eg
	//Set-Cookie: namevo2; this="that"
	//If ($tCookieValue=";")
	//$tValues:=$sCookieName
	// Else
	//$tValues:=
	//End if
	
	// If ($iParameters>4)
	//For ($i;4;$iParameters;2)
	
	//If ($iParameters>$i)
	//If (${$i+1}=";")
	// $tValues:=${$i}
	//Else
	// $tValues:=$tValues+"; "+${$i}+"="+${$i+1}
	//End if
	//End if
	
	//End for
	//End if
	
	IWS_AddToResponseHeader("Set-Cookie"; $sCookieName+"="+STR_InQuotes($tCookieValue)+"; Max-Age="+STR_InQuotes(String:C10($iMaxAge)))
	
	//John 9/1/2000 - convert to Max-Age method & remove that nonsense
	//+expires=Wednesday, 09-Nov-11 23:12:40 GMT; path=/; domain="+IME_t_Host)
	
End if 
ERR_MethodTrackerReturn("IME_CookieSet"; $_t_oldMethodName)