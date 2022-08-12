//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_CACHETEST
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/07/2014 14:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Array1; 0)
	ARRAY LONGINT:C221($_al_Array2; 0)
	ARRAY LONGINT:C221($_al_KeyTable; 0)
	ARRAY LONGINT:C221($_al_SessionTimeStamps; 0)
	ARRAY TEXT:C222($_at_Array1; 0)
	ARRAY TEXT:C222($_at_CacheUUID; 0)
	ARRAY TEXT:C222($_at_DataModelTextObject; 0)
	ARRAY TEXT:C222($_at_DataTextObject; 0)
	ARRAY TEXT:C222($_at_RecordID; 0)
	ARRAY TEXT:C222($_at_SessionID; 0)
	C_BOOLEAN:C305($_abo_Kaboom)
	C_LONGINT:C283($_l_MemoryElement; $physicalMemory; $totalMemory; $_l_FreeMemory2; $_l_MemoryElement)
	C_REAL:C285($_r_FreeStack; $_r_OriginalFree; $_r_AveragePerLine; $_r_FreeMemory; $_r_FreeStack; $_r_OriginalFree)
	C_TEXT:C284($_t_Text; $_t_UUID; $_t_oldMethodName; $_t_Text; $_t_UUID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_CACHETEST")
$_abo_Kaboom:=False:C215
ARRAY TEXT:C222($_at_CacheUUID; 0)
ARRAY TEXT:C222($_at_SessionID; 0)
ARRAY LONGINT:C221($_al_SessionTimeStamps; 0)
ARRAY LONGINT:C221($_al_KeyTable; 0)
ARRAY TEXT:C222($_at_RecordID; 0)
ARRAY TEXT:C222($_at_DataModelTextObject; 0)
ARRAY TEXT:C222($_at_DataTextObject; 0)
//AP AVAILABLE MEMORY ($totalMemory;$physicalMemory;$_r_FreeMemory;$_r_FreeStack)
GET MEMORY STATISTICS:C1118(1; $_at_Array1; $_al_Array1; $_al_Array2)
//$physicalMemory:=$_al_Array1{3}
$_r_FreeMemory:=10000000000
$_r_FreeStack:=100000000000
$_l_MemoryElement:=Find in array:C230($_at_Array1; "Free Memory")
If ($_l_MemoryElement>0)
	$_r_FreeMemory:=$_al_Array1{$_l_MemoryElement}
End if 
$_t_Text:="A"*32000
$_r_OriginalFree:=$_r_FreeMemory
Repeat 
	ARRAY TEXT:C222($_at_Array1; 0)
	ARRAY LONGINT:C221($_al_Array1; 0)
	ARRAY LONGINT:C221($_al_Array2; 0)
	
	
	$_t_UUID:=Generate UUID:C1066
	APPEND TO ARRAY:C911($_at_CacheUUID; $_t_UUID)
	APPEND TO ARRAY:C911($_at_SessionID; "1234567890")
	APPEND TO ARRAY:C911($_al_SessionTimeStamps; (Current time:C178*1))
	APPEND TO ARRAY:C911($_al_KeyTable; 24)
	APPEND TO ARRAY:C911($_at_RecordID; "1234567890")
	
	APPEND TO ARRAY:C911($_at_DataModelTextObject; $_t_Text)
	APPEND TO ARRAY:C911($_at_DataTextObject; $_t_Text)
	ARRAY TEXT:C222($_at_Array1; 0)
	ARRAY LONGINT:C221($_al_Array1; 0)
	ARRAY LONGINT:C221($_al_Array2; 0)
	
	GET MEMORY STATISTICS:C1118(1; $_at_Array1; $_al_Array1; $_al_Array2)
	$_l_MemoryElement:=Find in array:C230($_at_Array1; "Free Memory")
	If ($_l_MemoryElement>0)
		$_l_FreeMemory2:=$_al_Array1{$_l_MemoryElement}
	End if 
	$_r_AveragePerLine:=$_r_OriginalFree/(Size of array:C274($_at_DataTextObject))/1024
	MESSAGE:C88("SIZE OF CACHE="+String:C10(Size of array:C274($_at_DataTextObject))+" "+"AVERAGE MEMORY USED PER LINE"+String:C10($_r_AveragePerLine))
	$_r_FreeMemory:=$_l_FreeMemory2
Until ($_abo_Kaboom)
ERR_MethodTrackerReturn("AA_CACHETEST"; $_t_oldMethodName)
