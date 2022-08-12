//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Personnel Mod
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
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0;0)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283($_l_LastTableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel Mod")
//Personnel Mod
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([PERSONNEL:11]; "PersonFound")
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	If (Records in selection:C76([PERSONNEL:11])>0)
		CREATE SET:C116([PERSONNEL:11]; "PersonFound")
	End if 
	$_t_SetName:="PersonFound"
End if 

Minor_Mod(->[PERSONNEL:11]; "Personnel"; ""; ""; $_t_SetName; $_bo_AutoFind)

$_l_LastTableNumber:=Get last table number:C254
ARRAY TEXT:C222(<>FUR_at_CustomFieldNames; $_l_LastTableNumber; 0)
ARRAY TEXT:C222(<>FUR_at_2dCustomFieldFormat; $_l_LastTableNumber; 0)  //NG November 2004
ARRAY TEXT:C222(<>FUR_at_CustomFieldTypes; $_l_LastTableNumber; 0)
ERR_MethodTrackerReturn("Personnel Mod"; $_t_oldMethodName)
