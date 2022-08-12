//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_SetupFomPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PREF_al_TabObjectsDefault;0)
	//ARRAY LONGINT(PREF_al_TabObjectsIncludes;0)
	//ARRAY LONGINT(Prod_al_TabPages;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PREF_at_TabObjects;0)
	//ARRAY TEXT(Prod_at_TabNames;0)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Index; $_l_ItemID; $_l_offset; $_l_TabRow; PREF_l_GroupID; PREF_l_PersonelID; Pref_l_Save; Prod_l_PagePref; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SetupFomPrefs")

//this method will let a user set up the form tab prefs
ARRAY TEXT:C222(PRD_at_ProductsTab; 5)
OBJECT SET FONT:C164(PRD_at_ProductsTab; "arial")
OBJECT SET FONT STYLE:C166(PRD_at_ProductsTab; 1)
OBJECT SET FONT SIZE:C165(PRD_at_ProductsTab; 12)
ARRAY TEXT:C222(PREF_at_TabObjects; 0)
ARRAY LONGINT:C221(PREF_al_TabObjectsIncludes; 0)
ARRAY LONGINT:C221(PREF_al_TabObjectsDefault; 0)
ARRAY TEXT:C222(PREF_at_TabObjects; 5)
ARRAY LONGINT:C221(PREF_al_TabObjectsIncludes; 5)
ARRAY LONGINT:C221(PREF_al_TabObjectsDefault; 5)

PREF_at_TabObjects{1}:="Pricing"
PREF_at_TabObjects{2}:="Stock"
PREF_at_TabObjects{3}:="Suppliers"
PREF_at_TabObjects{4}:="Enclosures"
PREF_at_TabObjects{5}:="Components"


While (Semaphore:C143("LoadingPrefsProd"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Product Form Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsProd")



For ($_l_Index; 1; Size of array:C274(Prod_at_TabNames))
	$_l_TabRow:=Find in array:C230(PREF_at_TabObjects; Prod_at_TabNames{$_l_Index})
	If ($_l_TabRow>0)
		PREF_al_TabObjectsIncludes{$_l_TabRow}:=1
	End if 
End for 
$_l_TabRow:=Find in array:C230(Prod_al_TabPages; Prod_l_PagePref)
If ($_l_TabRow>0)
	$_l_TabRow:=Find in array:C230(PREF_at_TabObjects; Prod_at_TabNames{$_l_TabRow})
	If ($_l_TabRow>0)
		PREF_al_TabObjectsDefault{$_l_TabRow}:=1
	End if 
End if 

$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
DIALOG:C40([USER:15]; "PREF_SetUpTabPrefs")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (Pref_l_Save>0)
	//Save this into the blob
	READ WRITE:C146([PREFERENCES:116])
	If (PREF_l_PersonelID>0)
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL:11]); *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=PREF_l_PersonelID)
	Else 
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL_GROUPS:92]); *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=PREF_l_GroupID)
	End if 
	ARRAY TEXT:C222(Prod_at_TabNames; 5)
	ARRAY LONGINT:C221(Prod_al_TabPages; 5)
	$_l_CurrentRow:=0
	For ($_l_Index; 1; Size of array:C274(PREF_at_TabObjects))
		If (PREF_al_TabObjectsIncludes{$_l_Index}=1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			Prod_at_TabNames{$_l_CurrentRow}:=PREF_at_TabObjects{$_l_Index}
			Prod_al_TabPages{$_l_CurrentRow}:=$_l_Index
		End if 
	End for 
	ARRAY TEXT:C222(Prod_at_TabNames; $_l_CurrentRow)
	ARRAY LONGINT:C221(Prod_al_TabPages; $_l_CurrentRow)
	$_l_TabRow:=Find in array:C230(PREF_al_TabObjectsDefault; 1)
	If ($_l_TabRow>0)
		Prod_l_PagePref:=$_l_TabRow
	End if 
	
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		If (PREF_l_PersonelID>0)
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[PERSONNEL:11])
			[PREFERENCES:116]Pref_OwnerID:4:=PREF_l_PersonelID
		Else 
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[PERSONNEL_GROUPS:92])
			[PREFERENCES:116]Pref_OwnerID:4:=PREF_l_GroupID
		End if 
	End if 
	$_l_offset:=0
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(Prod_at_TabNames; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prod_al_TabPages; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prod_l_PagePref; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
End if 
PROD_LoadFormPrefs
ERR_MethodTrackerReturn("Prod_SetupFomPrefs"; $_t_oldMethodName)
