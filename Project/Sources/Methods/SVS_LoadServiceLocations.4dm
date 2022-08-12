//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_LoadServiceLocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVS_al_EXTServiceLocations;0)
	//ARRAY LONGINT(SVS_al_IntServiceLocations;0)
	//ARRAY TEXT(SVS_at_EXTServiceLoactions;0)
	//ARRAY TEXT(SVS_at_IntServiceLoactions;0)
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_ListID2; $_l_SublistID; SVS_at_ServiceLocations)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_LoadServiceLocations")

ARRAY TEXT:C222(SVS_at_IntServiceLoactions; 0)
ARRAY LONGINT:C221(SVS_al_IntServiceLocations; 0)
ARRAY TEXT:C222(SVS_at_EXTServiceLoactions; 0)
ARRAY LONGINT:C221(SVS_al_EXTServiceLocations; 0)
$_l_ListID:=AA_LoadListByName("Internal Service Locations"; ->SVS_at_IntServiceLoactions; ->SVS_al_IntServiceLocations)
If (Size of array:C274(SVS_at_IntServiceLoactions)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Service Department")
	$_l_ListID:=AA_LoadListByName("Internal Service Locations"; ->SVS_at_IntServiceLoactions; ->SVS_al_IntServiceLocations)
	
End if 
$_l_ListID2:=AA_LoadListByName("External Service Locations"; ->SVS_at_EXtServiceLoactions; ->SVS_al_ExtServiceLocations)
If (Size of array:C274(SVS_at_ExtServiceLoactions)=0)
	$_l_ListID2:=AA_ListAddItembyID($_l_ListID2; "Client Site")
	$_l_ListID2:=AA_LoadListByName("Internal Service Locations"; ->SVS_at_ExtServiceLoactions; ->SVS_al_ExtServiceLocations)
	
End if 
If (Is a list:C621(SVS_at_ServiceLocations))
	CLEAR LIST:C377(SVS_at_ServiceLocations; *)
End if 
SVS_at_ServiceLocations:=New list:C375
$_l_SublistID:=New list:C375
For ($_l_Index; 1; Size of array:C274(SVS_at_IntServiceLoactions))
	APPEND TO LIST:C376($_l_SublistID; SVS_at_IntServiceLoactions{$_l_Index}; -(SVS_al_IntServiceLocations{$_l_Index}))
End for 
APPEND TO LIST:C376($_l_SublistID; "-"; 0)
APPEND TO LIST:C376($_l_SublistID; "Edit Internal locations"; 999)

APPEND TO LIST:C376(SVS_at_ServiceLocations; "Internal"; $_l_ListID; $_l_SublistID; True:C214)
$_l_SublistID:=New list:C375
For ($_l_Index; 1; Size of array:C274(SVS_at_ExtServiceLoactions))
	APPEND TO LIST:C376($_l_SublistID; SVS_at_ExtServiceLoactions{$_l_Index}; -(SVS_al_ExtServiceLocations{$_l_Index}))
End for 
APPEND TO LIST:C376($_l_SublistID; "-"; 0)
APPEND TO LIST:C376($_l_SublistID; "Edit External  locations"; 998)

APPEND TO LIST:C376(SVS_at_ServiceLocations; "External"; $_l_ListID2; $_l_SublistID; True:C214)
ERR_MethodTrackerReturn("SVS_LoadServiceLocations"; $_t_oldMethodName)
