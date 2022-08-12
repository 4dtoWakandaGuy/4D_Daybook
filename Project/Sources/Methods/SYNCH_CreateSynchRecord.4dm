//%attributes = {}
If (False:C215)
	//Project Method Name:      SYNCH_CreateSynchRecord
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
	C_LONGINT:C283($_l_Reference; $_l_SourceTable; $_l_Type; $1; $2)
	C_POINTER:C301($3)
	C_TEXT:C284(<>iRefPrefix; $_t_oldMethodName; $_t_Reference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYNCH_CreateSynchRecord")

//Modification
//record one in the Modifications table

//$_l_SourceTable:=Table($2)
//$sType:=$1
$_l_Type:=Type:C295($3->)
//$3 must either point to a longint or a string(alpha)
//this flexibility is added so record IDs can be used-note that where longint ids are used the
//id itself may change in this system..so use alpha were poss! and make sure it the ref is used
Case of 
	: ($_l_Type=Is longint:K8:6)
		$_t_Reference:=""
		$_l_Reference:=$3->
	Else 
		$_t_Reference:=$3->
		$_l_Reference:=0
End case 

If (($_l_SourceTable#0) & ($_l_Type#0) & ($_t_Reference#""))
	CREATE RECORD:C68([xSynch:139])
	[xSynch:139]x_SynchID:1:=AA_GetNextID(->[xSynch:139]x_SynchID:1)
	[xSynch:139]X_RecordSourceID:2:=$_l_SourceTable
	[xSynch:139]xSynchRef:6:=<>iRefPrefix+String:C10([xSynch:139]x_SynchID:1)
	[xSynch:139]xModDate:7:=Current date:C33
	[xSynch:139]xModTime:8:=Current time:C178
	[xSynch:139]sSynchRecordCode:4:=$_t_Reference
	[xSynch:139]xSynchRecordID:3:=$_l_Reference
	[xSynch:139]xSynchClass:5:=$1
	SAVE RECORD:C53([xSynch:139])
End if 
ERR_MethodTrackerReturn("SYNCH_CreateSynchRecord"; $_t_oldMethodName)
