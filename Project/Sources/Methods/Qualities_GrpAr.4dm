//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_GrpAr
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
	//ARRAY TEXT(<>QV_at_QualitiesItemNames;0)
	ARRAY TEXT:C222($_at_ListNames; 0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_GrpAr")
If (False:C215)
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Qual SubGroups")
	$_l_SizeofArray:=Size of array:C274(<>QV_at_QualitiesItemNames)
	ARRAY TEXT:C222($_at_ListNames; $_l_SizeofArray)
	For ($_l_Index; 1; $_l_SizeofArray)
		$_at_ListNames{$_l_Index}:="Qual SubGroups"
	End for 
	READ WRITE:C146([LIST_ITEMS:95])
	If ($_l_SizeofArray<Records in selection:C76([LIST_ITEMS:95]))
		DELETE SELECTION:C66([LIST_ITEMS:95])
	End if 
	ARRAY TO SELECTION:C261($_at_ListNames; [LIST_ITEMS:95]List_Name:1; <>QV_at_QualitiesItemNames; [LIST_ITEMS:95]List_Entry:2)
	READ ONLY:C145([LIST_ITEMS:95])
	UNLOAD RECORD:C212([LIST_ITEMS:95])
Else 
	//ALERT("Please inform our development dept, issue with Qualities groupar")
	Gen_Alert("Please inform our development dept, issue with Qualities groupar")
End if 
ERR_MethodTrackerReturn("Qualities_GrpAr"; $_t_oldMethodName)
