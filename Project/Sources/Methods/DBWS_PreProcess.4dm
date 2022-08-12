//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_PreProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 16:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_HeaderFields; 0)
	ARRAY TEXT:C222($_at_HeaderValues; 0)
	//ARRAY TEXT(DB_at_Formvalues;0)
	//ARRAY TEXT(DB_at_Formvariables;0)
	C_BOOLEAN:C305(DBWS_bo_isget; DBWS_bo_ispost)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CookieRow; $_l_Index; $_l_SessionPosition; $_l_XmethodRow)
	C_TEXT:C284($_t_headerValue; $_t_oldMethodName; DBWS_t_Incomimingurl; DBWS_T_incomingaction; DBWS_T_incomingParam; DSWS_t_Currentcookie)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_PreProcess")
ARRAY TEXT:C222($_at_HeaderFields; 0)
ARRAY TEXT:C222($_at_HeaderValues; 0)
ON ERR CALL:C155("w_onError")
WEB GET HTTP HEADER:C697($_at_HeaderFields; $_at_HeaderValues)
DSWS_t_Currentcookie:=""
$_l_CookieRow:=Find in array:C230($_at_HeaderFields; "cookie")
If ($_l_CookieRow#-1)
	$_t_headerValue:=$_at_HeaderValues{$_l_XmethodRow}
	$_l_SessionPosition:=Position:C15("session="; $_t_headerValue)
	If ($_l_SessionPosition>0)
		$_t_headerValue:=Substring:C12($_t_headerValue; $_l_SessionPosition+8)
		$_l_SessionPosition:=Position:C15(";"; $_t_headerValue)
		If ($_l_SessionPosition>0)
			DSWS_t_Currentcookie:=Substring:C12($_t_headerValue; 1; $_l_SessionPosition-1)
		Else 
			DSWS_t_Currentcookie:=$_t_headerValue
		End if 
		If (Position:C15("@"; DSWS_t_Currentcookie)#0)
			DSWS_t_Currentcookie:=""
		End if 
	End if 
End if 
ARRAY TEXT:C222(DB_at_Formvariables; 0)
ARRAY TEXT:C222(DB_at_Formvalues; 0)
//TRACE
$_l_XmethodRow:=Find in array:C230($_at_HeaderFields; "X-METHOD")
//Post(C), get(R), put(U) , delete(D) (CRUD)
If ($_l_XmethodRow#-1)
	Case of 
		: ($_at_HeaderValues{$_l_XmethodRow}="POST")
			
			DBWS_bo_ispost:=True:C214
			DBWS_bo_isget:=False:C215
			WEB GET VARIABLES:C683(DB_at_Formvariables; DB_at_Formvalues)
			For ($_l_Index; 1; Size of array:C274(DB_at_Formvariables))
				DB_at_FormValues{$_l_Index}:=Replace string:C233(DB_at_FormValues{$_l_Index}; "<"; "&lt;")
			End for 
			$_l_CharacterPosition:=Position:C15("/"; DBWS_t_Incomimingurl)
			If ($_l_CharacterPosition=1)
				DBWS_t_Incomimingurl:=Substring:C12(DBWS_t_Incomimingurl; 2)
				$_l_CharacterPosition:=Position:C15("/"; DBWS_t_Incomimingurl)
			End if 
			If ($_l_CharacterPosition>0)
				DBWS_T_incomingaction:=Substring:C12(DBWS_t_Incomimingurl; 1; $_l_CharacterPosition-1)
				DBWS_T_incomingParam:=Substring:C12(DBWS_t_Incomimingurl; $_l_CharacterPosition+1)
			Else 
				DBWS_T_incomingaction:=DBWS_t_Incomimingurl
				DBWS_T_incomingParam:=""
			End if 
			
		: ($_at_HeaderValues{$_l_XmethodRow}="GET")
			DBWS_bo_ispost:=False:C215
			DBWS_bo_isget:=True:C214
			WEB GET VARIABLES:C683(DB_at_Formvariables; DB_at_Formvalues)
			For ($_l_Index; 1; Size of array:C274(DB_at_Formvariables))
				//Protection Cross Site Scripting :
				//http://fr.wikipedia.org/wiki/Cross_site_scripting
				DB_at_FormValues{$_l_Index}:=Replace string:C233(DB_at_FormValues{$_l_Index}; "<"; "&lt;")
			End for 
			
			//This may have(as an opening to a record ID
			$_l_CharacterPosition:=Position:C15("?"; DBWS_t_Incomimingurl)
			If ($_l_CharacterPosition>0)
				DBWS_T_incomingaction:=Substring:C12(DBWS_t_Incomimingurl; 1; $_l_CharacterPosition-1)
				DBWS_T_incomingParam:=Substring:C12(DBWS_t_Incomimingurl; $_l_CharacterPosition+1)
			Else 
				DBWS_T_incomingaction:=""
				DBWS_T_incomingParam:=""
				
			End if 
			
		: ($_at_HeaderValues{$_l_XmethodRow}="PUT")
			
		: ($_at_HeaderValues{$_l_XmethodRow}="DELETE")
			
			
	End case 
	
Else 
	DBWS_T_incomingaction:=""
	DBWS_T_incomingParam:=""
End if 
ERR_MethodTrackerReturn("DBWS_PreProcess"; $_t_oldMethodName)