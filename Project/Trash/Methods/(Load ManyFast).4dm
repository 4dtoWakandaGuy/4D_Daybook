//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Load_ManyFast
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
	C_LONGINT:C283(vAny)
	C_POINTER:C301($_ptr_masterRelatedField; $_ptr_MasterSetTable; $_Ptr_SourceKeyField; $_ptr_SourceTable; $1; $2; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load_ManyFast")
//Load_ManyFast
$_ptr_SourceTable:=$1
$_Ptr_SourceKeyField:=$2
$_t_SetName:=$3
$_ptr_masterRelatedField:=$4
$_ptr_MasterSetTable:=$5

Sel_LinkMess($_ptr_SourceTable)
If (OK=1)
	Project_SelFast($_ptr_SourceTable; $_Ptr_SourceKeyField; $_ptr_MasterSetTable; $_ptr_MasterRelatedField)
	CREATE SET:C116($_ptr_MasterSetTable->; "Master")
	//If (Records in set($_t_SetName)>0)
	INTERSECTION:C121("Master"; $_t_SetName; "Master")
	//End if
	
	USE SET:C118("Master")
Else 
	USE SET:C118($_t_SetName)
	CREATE SET:C116($_ptr_MasterSetTable->; "Master")
End if 
CLEAR SET:C117($_t_SetName)
vAny:=1
ERR_MethodTrackerReturn("Load_ManyFast"; $_t_oldMethodName)