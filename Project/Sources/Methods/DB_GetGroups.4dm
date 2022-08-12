//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/01/2011 15:06 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_GroupCodes; 0)
	ARRAY TEXT:C222($_at_GroupNames; 0)
	//ARRAY TEXT(DB_at_GroupCodes;0)
	//ARRAY TEXT(DB_at_GroupNames;0)
	C_BOOLEAN:C305(DB_bo_GroupsReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetGroups")

If (Count parameters:C259>=1)
	READ ONLY:C145([PRODUCT_GROUPS:10])
	ALL RECORDS:C47([PRODUCT_GROUPS:10])
	SELECTION TO ARRAY:C260([PRODUCT_GROUPS:10]Group_Code:1; $_at_GroupCodes; [PRODUCT_GROUPS:10]Group_Name:2; $_at_GroupNames)
	$_l_BlankRow:=Find in array:C230($_at_GroupCodes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_GroupCodes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_GroupNames; $_l_BlankRow)
	End if 
	VARIABLE TO VARIABLE:C635($1; DB_at_GroupNames; $_at_GroupNames; DB_at_GroupCodes; $_at_GroupCodes)
	SET PROCESS VARIABLE:C370($1; DB_bo_GroupsReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetGroups"; $_t_oldMethodName)