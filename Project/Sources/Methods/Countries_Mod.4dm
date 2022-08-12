//%attributes = {}
If (False:C215)
	//Project Method Name:      Countries_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Countries_Mod")
READ ONLY:C145([ADDRESS_FORMATS:74])
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([COUNTRIES:73]; "CountryFound")
	QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$1)
	If (Records in selection:C76([COUNTRIES:73])>0)
		CREATE SET:C116([COUNTRIES:73]; "CountryFound")
	End if 
	$_t_SetName:="CountryFound"
End if 

Minor_Mod(->[COUNTRIES:73]; "Countries"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Countries_Mod"; $_t_oldMethodName)