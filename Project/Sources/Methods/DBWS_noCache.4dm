//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_noCache
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 20:14
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_noCache")


ERR_MethodTrackerReturn("DBWS_noCache"; $_t_oldMethodName)
If (True:C214)
	ARRAY TEXT:C222(DBWS_at_Cache; 0)
	ARRAY TEXT:C222(DBWS_at_CacheValues; 0)
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Proxy-Connection")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "close")
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Cache-Control")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "private, x-gzip-ok=\"\"")  //"no-cache"
	//  "no-store, no-cache, must-revalidate,post-check=0, pre-check=0"
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Expires")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "Mon, 1 Jan 2008 00:00:00 GMT")
	WEB SET HTTP HEADER:C660(DBWS_at_Cache; DBWS_at_CacheValues)
Else 
	ARRAY TEXT:C222(DBWS_at_Cache; 0)
	ARRAY TEXT:C222(DBWS_at_CacheValues; 0)
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Cache-Control")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "public,  max-age=315360000")
	APPEND TO ARRAY:C911(DBWS_at_Cache; "Expires")
	APPEND TO ARRAY:C911(DBWS_at_CacheValues; "Fri, 1 Jan 2010 00:00:00 GMT")
	WEB SET HTTP HEADER:C660(DBWS_at_Cache; DBWS_at_CacheValues)
End if 
ERR_MethodTrackerReturn("DBWS_noCache"; $_t_oldMethodName)