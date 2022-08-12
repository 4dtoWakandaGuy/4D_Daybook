//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_ADDSubtableData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SubIDS; 0)
	ARRAY TEXT:C222($_at_SubNames; 0)
	C_BOOLEAN:C305($_bo_SendInvisible; $_bo_SendRelatedMany; $_bo_SendRelatedOne; $4; $5; $6)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $2; $3)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_ParentName; $_t_SubName)
	C_TIME:C306($_ti_DocumentRef; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EXP_ADDSubtableData")

//THis method handles the nasty subtables `these are treated as related records
If (Count parameters:C259>=6)
	$_ti_DocumentRef:=$1
	$_l_TableNumber:=$2
	$_l_FieldNumber:=$3
	$_bo_SendRelatedOne:=$4
	$_bo_SendRelatedMany:=$5
	$_bo_SendInvisible:=$6
	$_ptr_Field:=Field:C253($2; $3)
	
	ARRAY TEXT:C222($_at_SubNames; 0)
	ARRAY LONGINT:C221($_al_SubIDS; 0)
	If (Is table number valid:C999($2))
		$_t_ParentName:=Table name:C256($2)
		
		$_t_SubName:=Field name:C257($2; $3)
		GET FIELD TITLES:C804($_ptr_Field->; $_at_SubNames; $_al_SubIDS)
	Else 
		$_t_ParentName:="UNKNOWN"
		$_t_SubName:="UNKNOWN"
		
	End if 
	
Else 
	$_t_ParentName:="UNKNOWN"
	$_t_SubName:="UNKNOWN"
	
End if 
ERR_MethodTrackerReturn("EXP_ADDSubtableData"; $_t_oldMethodName)