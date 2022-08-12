//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CookieGet
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
	C_BOOLEAN:C305($_bo_Decrypt; $2)
	C_LONGINT:C283($_l_CharIndex; $_l_CharIndexLength; $_l_CharIndexMS; $_l_CharPosition; $_l_CharPosition2)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_DoubleQuote; $_t_CookieName; $_t_CookieValue; $_t_oldMethodName; $_t_Request; $_t_ThisCharacter; $0; $1; IWS_t_Request)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CookieGet")
//IME_CookieGet
//Rollo 12/21/99


If (Count parameters:C259>0)
	
	$_t_CookieName:=$1
	
	If (Count parameters:C259>1)
		$_bo_Decrypt:=$2
	Else 
		$_bo_Decrypt:=True:C214
	End if 
	
	$_l_CharPosition:=Position:C15("Cookie:"; IWS_t_Request)
	If ($_l_CharPosition>0)
		$_t_Request:=Substring:C12(IWS_t_Request; $_l_CharPosition)
	Else 
		$_t_Request:=IWS_t_Request
	End if 
	
	$_l_CharPosition:=Position:C15($_t_CookieName+"="; $_t_Request)
	$_t_CookieValue:=""
	
	If ($_l_CharPosition>0)
		
		//Rollo 8/31/2000 - an optimized version of the below comments
		
		$_l_CharPosition:=$_l_CharPosition+Length:C16($_t_CookieName)+1
		$_l_CharIndex:=$_l_CharPosition
		$_l_CharIndexLength:=Length:C16($_t_Request)
		
		While ($_l_CharIndex<=$_l_CharIndexLength)
			$_t_ThisCharacter:=$_t_Request[[$_l_CharIndex]]
			If (($_t_ThisCharacter=<>STR_t_CR) | ($_t_ThisCharacter=";"))
				$_l_CharPosition2:=$_l_CharIndex
				$_l_CharIndex:=$_l_CharIndexLength+1
			End if 
			$_l_CharIndex:=$_l_CharIndex+1
		End while 
		
		$_t_CookieValue:=Substring:C12($_t_Request; $_l_CharPosition; $_l_CharPosition2-$_l_CharPosition)
		
		If ($_t_CookieValue=(<>STR_t_DoubleQuote+"@"))  //strip off quotes if there
			If ($_t_CookieValue=("@"+<>STR_t_DoubleQuote))
				$_t_CookieValue:=Substring:C12($_t_CookieValue; 2; Length:C16($_t_CookieValue)-2)
			End if 
		End if 
		
		//$_t_CookieValue:=Substring($_t_Request;$_l_CharPosition+Length($_t_CookieName)+1)
		//$_l_CharPosition:=Position(SQL_ks_CR ;$_t_CookieValue)
		//$_l_CharPosition2:=Position(";";$_t_CookieValue)
		//If (($_l_CharPosition2<$_l_CharPosition) & ($_l_CharPosition2>0))
		//$_l_CharPosition:=$_l_CharPosition2
		//End if
		//If ($_l_CharPosition>0)
		//$_t_CookieValue:=Substring($_t_CookieValue;1;$_l_CharPosition-1)
		//End if
		
	End if 
	
	If (($_bo_Decrypt) & ($_t_CookieValue#""))
		$_t_CookieValue:=IME_DecryptSimple($_t_CookieValue)
	End if 
	
End if 

$0:=$_t_CookieValue
ERR_MethodTrackerReturn("IME_CookieGet"; $_t_oldMethodName)