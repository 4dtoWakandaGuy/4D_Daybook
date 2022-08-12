//%attributes = {}
If (False:C215)
	//Project Method Name:      Types_Mod
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
	C_BOOLEAN:C305($_Bo_TypeAutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Types_Mod")

$_Bo_TypeAutoFind:=False:C215

If (Count parameters:C259>=2)
	$_Bo_TypeAutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([TYPES:5]; "typeFound")
	QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1=$1)
	If (Records in selection:C76([TYPES:5])>0)
		CREATE SET:C116([TYPES:5]; "typeFound")
	End if 
	$_t_SetName:="typeFound"
End if 

Minor_Mod(->[TYPES:5]; "Types"; ""; ""; $_t_SetName; $_Bo_TypeAutoFind)
ERR_MethodTrackerReturn("Types_Mod"; $_t_oldMethodName)