//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoadNameArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ProffesionaladditionsID; 0)
	ARRAY LONGINT:C221($_al_SNPrefixID; 0)
	//ARRAY LONGINT(AA_al_SalutationIDs;0)
	//ARRAY TEXT(AA_at_Proffesionaladditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_BOOLEAN:C305(AA_bo_NameArraysinited)
	C_LONGINT:C283($_l_addedItemID; $_l_ListID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadNameArrays")

If (False:C215)
	
	READ WRITE:C146([LIST_ITEMS:95])
	
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Titles")
	
	If (Records in selection:C76([LIST_ITEMS:95])=0)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Mr"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Mrs"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Miss"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Mr & Mrs"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Ms"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Dr"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Prof."
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Lord"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="Titles"
		[LIST_ITEMS:95]List_Entry:2:="Lady"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	End if 
	
	
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Titles")
	SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_Salutations)
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="SNpreffix")
	If (Records in selection:C76([LIST_ITEMS:95])=0)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="SNpreffix"
		[LIST_ITEMS:95]List_Entry:2:="Von"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="SNpreffix"
		[LIST_ITEMS:95]List_Entry:2:="Van"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="SNpreffix"
		[LIST_ITEMS:95]List_Entry:2:="Van Der"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	End if 
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="SNpreffix")
	SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_SNprefixes)
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="PrAdditions")
	// SELECTION([LISTS])
	
	If (Records in selection:C76([LIST_ITEMS:95])=0)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="PrAdditions"
		[LIST_ITEMS:95]List_Entry:2:="CBE"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="PrAdditions"
		[LIST_ITEMS:95]List_Entry:2:="MBE"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		CREATE RECORD:C68([LIST_ITEMS:95])
		[LIST_ITEMS:95]List_Name:1:="PrAdditions"
		[LIST_ITEMS:95]List_Entry:2:="OBE"
		DB_SaveRecord(->[LIST_ITEMS:95])
		AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	End if 
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="PrAdditions")
	SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_ProffesionalAdditions)
	UNLOAD RECORD:C212([LIST_ITEMS:95])
	READ ONLY:C145([LIST_ITEMS:95])
	
	
Else 
	//AA_LoadNameArrays
	//loads name arrays
	If (Not:C34(AA_bo_NameArraysinited))
		
		ARRAY LONGINT:C221($_al_SNPrefixID; 0)
		
		ARRAY LONGINT:C221($_al_ProffesionaladditionsID; 0)
		
		ARRAY LONGINT:C221(AA_al_SalutationIDs; 0)
		ARRAY TEXT:C222(AA_at_ProffesionalAdditions; 0)
		ARRAY TEXT:C222(AA_at_Salutations; 0)
		ARRAY TEXT:C222(AA_at_SNprefixes; 0)
		$_l_ListID:=AA_LoadListByName("Titles"; ->AA_at_Salutations; ->AA_al_SalutationIDs; False:C215)
		$_l_ListID:=AA_LoadListByName("SNPreffix"; ->AA_at_SNprefixes; ->$_al_SNPrefixID; False:C215)
		$_l_ListID:=AA_LoadListByName("PrAdditions"; ->AA_at_ProffesionalAdditions; ->$_al_ProffesionaladditionsID; False:C215)
		If (Size of array:C274(AA_at_Salutations)=0)
			$_l_ListID:=AA_GetListID(0; 0; "Titles")
			$_l_addedItemID:=AA_ListAddItembyID(AA_GetListID(0; 0; "Titles"); "Mr"; "Mrs"; "Miss"; "Mz"; "Dr"; "The Rt Hon")
			$_l_ListID:=AA_LoadListByName("Titles"; ->AA_at_Salutations; ->AA_al_SalutationIDs; False:C215)
		End if 
		If (Size of array:C274(AA_at_SNprefixes)=0)
			$_l_addedItemID:=AA_ListAddItembyID(AA_GetListID(0; 0; "SNPreffix"); "La"; "Van"; "Der"; "Van Der")
			$_l_ListID:=AA_LoadListByName("SNPreffix"; ->AA_at_SNprefixes; ->$_al_SNPrefixID; False:C215)
		End if 
		
		If (Size of array:C274(AA_at_ProffesionalAdditions)=0)
			$_l_addedItemID:=AA_ListAddItembyID(AA_GetListID(0; 0; "PrAdditions"); "CBE"; "OBE")
			$_l_ListID:=AA_LoadListByName("PrAdditions"; ->AA_at_ProffesionalAdditions; ->$_al_ProffesionaladditionsID; False:C215)
		End if 
		AA_bo_NameArraysinited:=True:C214
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_LoadNameArrays"; $_t_oldMethodName)
