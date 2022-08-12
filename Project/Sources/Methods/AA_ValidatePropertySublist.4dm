//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ValidatePropertySublist
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DeleteListItemIDS; 0)
	ARRAY TEXT:C222($_at_AddTableNames; 0)
	ARRAY TEXT:C222($_at_DeleteTableNames; 0)
	ARRAY TEXT:C222($_at_TableNames; 0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_ValidatePropertySublist")
Case of 
	: ($2="Table Restriction")
		ARRAY TEXT:C222($_at_TableNames; 0)
		
		For ($_l_Index; 1; Get last table number:C254)
			If (Is table number valid:C999($_l_Index))
				APPEND TO ARRAY:C911($_at_TableNames; Table name:C256($_l_Index))
			End if 
		End for 
		ARRAY TEXT:C222($_at_DeleteTableNames; 0)
		ARRAY LONGINT:C221($_al_DeleteListItemIDS; 0)
		ARRAY TEXT:C222($_at_AddTableNames; 0)
		If (Count parameters:C259>=3)
			For ($_l_Index; 1; Size of array:C274(AA_at_PropertyValues))
				If (Find in array:C230($_at_TableNames; $3->{$_l_Index})<0)
					APPEND TO ARRAY:C911($_at_DeleteTableNames; $_at_TableNames{$_l_Index})
					APPEND TO ARRAY:C911($_al_DeleteListItemIDS; $3->{$_l_Index})
					
				End if 
			End for 
			For ($_l_Index; 1; Size of array:C274($_at_TableNames))
				If (Find in array:C230($3->; $_at_TableNames{$_l_Index})<0)
					APPEND TO ARRAY:C911($_at_AddTableNames; $_at_TableNames{$_l_Index})
				End if 
			End for 
			If (Size of array:C274($_at_AddTableNames)>0) | (Size of array:C274($_at_DeleteTableNames)>0)
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_al_DeleteListItemIDS{$_l_Index})
				For ($_l_Index; 1; Size of array:C274($_al_DeleteListItemIDS))
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_al_DeleteListItemIDS{$_l_Index})
					DELETE RECORD:C58([LIST_ITEMS:95])
				End for 
				For ($_l_Index; 1; Size of array:C274($_at_AddTableNames))
					
				End for 
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("AA_ValidatePropertySublist"; $_t_oldMethodName)