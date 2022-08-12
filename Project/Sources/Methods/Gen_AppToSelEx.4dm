//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_AppToSelEx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ExportStamp; 0)
	ARRAY TEXT:C222($_at_Selection; 0)
	C_LONGINT:C283($_l_FieldType; $_l_Index; $_l_SizeofArray)
	C_POINTER:C301($1; $2; $4)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_AppToSelEx")

GET FIELD PROPERTIES:C258($2; $_l_FieldType)
If ($_l_FieldType=0)
	ARRAY TEXT:C222($_at_Selection; Records in selection:C76($1->))
	ARRAY TEXT:C222($_at_ExportStamp; Records in selection:C76($1->))
	SELECTION TO ARRAY:C260($2->; $_at_Selection)
	SELECTION TO ARRAY:C260($4->; $_at_ExportStamp)
	$_l_SizeofArray:=Size of array:C274($_at_Selection)
	For ($_l_Index; 1; $_l_SizeofArray)
		$_at_Selection{$_l_index}:=$3
		$_at_ExportStamp{$_l_index}:=Export_Stamp2($_at_ExportStamp{$_l_index})
	End for 
	ARRAY TO SELECTION:C261($_at_Selection; $2->)
	ARRAY TO SELECTION:C261($_at_ExportStamp; $4->)
Else 
	FIRST RECORD:C50($1->)
	While (Not:C34(End selection:C36($1->)))
		$2->:=$3
		$4->:=Export_Stamp2($4->)
		DB_SaveRecord($1)
		NEXT RECORD:C51($1->)
	End while 
	UNLOAD RECORD:C212($1->)
End if 
ERR_MethodTrackerReturn("Gen_AppToSelEx"; $_t_oldMethodName)