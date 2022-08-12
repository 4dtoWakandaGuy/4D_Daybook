//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_StartBack2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/03/2011 07:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_FieldNumber; 0)
	ARRAY INTEGER:C220($_ai_FieldOrder; 0)
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	C_BOOLEAN:C305($2)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $4)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_StartBack2")

//NG 19/7/2006 this method is a replacement for ALStartBack2
//NG 2011-this is now not used
$_t_oldMethodName:=ERR_MethodTracker("LBi_StartBack2"+$1)
//ALStartBack2  - loads in the interProcess_Arrays
//See also ALInclFields
ARRAY INTEGER:C220($_ai_FieldNumber; 0)
ARRAY INTEGER:C220($_ai_FieldOrder; 0)
ARRAY LONGINT:C221($_al_TableNumber; 0)
While (Semaphore:C143("$Inserting"+"ALREFS"))
	DelayTicks
End while 

CLEAR SEMAPHORE:C144("$Inserting"+"ALREFS")
ERR_MethodTrackerReturn("LBi_StartBack2"; $_t_oldMethodName)