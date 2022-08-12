//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_CookieSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 20:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cache)
	//C_UNKNOWN(no)
	//ARRAY TEXT(DBWS_at_Cache;0)
	//ARRAY TEXT(DBWS_at_CacheValues;0)
	C_TEXT:C284($_t_oldMethodName; $1; DSWS_t_Currentcookie)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_CookieSet")

If ($1="0")
	ARRAY TEXT:C222(DBWS_at_Cache; 0)
	ARRAY TEXT:C222(DBWS_at_CacheValues; 0)
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Proxy-Connection")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "close")
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Cache-Control")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "private, x-gzip-ok=\"\"")  //"no-cache"
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Expires")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "Mon, 1 Jan 2008 00:00:00 GMT")
	APPEND TO ARRAY:C911(DBWS_at_Cache; "SET-COOKIE")
	DSWS_t_Currentcookie:=""
	
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "session="+DSWS_t_Currentcookie+"; path=/; expires=")
	WEB SET HTTP HEADER:C660(DBWS_at_Cache; DBWS_at_CacheValues)
Else 
	
	ARRAY TEXT:C222(DBWS_at_Cache; 0)
	ARRAY TEXT:C222(DBWS_at_CacheValues; 0)
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Proxy-Connection")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "close")
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Cache-Control")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "private, x-gzip-ok=\"\"")  //"no-cache"
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Expires")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "Mon, 1 Jan 2008 00:00:00 GMT")
	APPEND TO ARRAY:C911(DBWS_at_Cache; "SET-COOKIE")
	DSWS_t_Currentcookie:=String:C10(Year of:C25(Current date:C33))+(String:C10(Current time:C178*1))+("0"*(16-Length:C16($1)))+$1
	
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "session="+DSWS_t_Currentcookie+"; path=/; expires=")
	WEB SET HTTP HEADER:C660(DBWS_at_Cache; DBWS_at_CacheValues)
	
End if 
ERR_MethodTrackerReturn("DBWS_CookieSet"; $_t_oldMethodName)