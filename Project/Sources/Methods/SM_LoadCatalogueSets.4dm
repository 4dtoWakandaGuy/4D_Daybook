//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_LoadCatalogueSets
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SM_LoadCatalogueSets
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_SetContextItemsID;0)
	//ARRAY LONGINT(SM_al_SetClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(CAT_at_SetContextitemOwnerID;0)
	//ARRAY TEXT(CAT_at_SetContextItems;0)
	//ARRAY TEXT(SM_at_SetClass;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_LONGINT:C283($_l_ItemID; $_l_Offset)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_LoadCatalogueSets")

//NG March 2008. This method loads a groups of sets which are not belonging to any specific user. This is a sets of Products.
//These are dynamic CATALOGUES.
//Note that the preference record for these sets contains less elements.
//this is because thet are all the same context and all the same classs
ARRAY LONGINT:C221(CAT_al_SetContextItemsID; 0)
ARRAY TEXT:C222(CAT_at_SetContextItems; 0)
ARRAY TEXT:C222(CAT_at_SetContextitemOwnerID; 0)

ARRAY TEXT:C222(SM_at_SetClass; 4)
ARRAY LONGINT:C221(SM_al_SetClassID; 4)
SM_at_SetClass{1}:="Fixed List"
SM_at_SetClass{2}:="Dynamic List"
SM_at_SetClass{3}:="Fixed List with Dynamic Query"
SM_at_SetClass{4}:="Group"
SM_al_SetClassID{1}:=853
SM_al_SetClassID{2}:=854
SM_al_SetClassID{3}:=852
SM_al_SetClassID{4}:=855

While (Semaphore:C143("Loading"+<>PER_t_CurrentUserInitials+"Sets"))
	DelayTicks
End while 
$_l_ItemID:=PREF_GetPreferenceID("__"+"Sets"; False:C215)
If ($_l_ItemID>0)
	$_l_Offset:=0
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetItemsName; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetitemsID; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetContextitemOwnerIDs; $_l_Offset)
End if 
ERR_MethodTrackerReturn("SM_LoadCatalogueSets"; $_t_oldMethodName)
