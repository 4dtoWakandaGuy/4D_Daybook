//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_SaveProdViewWidths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 23:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY LONGINT(CAT_al_UserWidths;0;0)
	//ARRAY TEXT(CAT_at_UserID;0)
	C_LONGINT:C283($_l_ArraySize; $_l_BlobSIze; $_l_ColumnIndex; $_l_ColumnWIdth; $_l_ItemID; $_l_offset; $_l_Retries; $_l_UserIndex; $_l_UserRow)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; CheckCATFormSetting)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_SaveProdViewWidths")
$_l_Retries:=0
While (Semaphore:C143("CheckCATFormSetting"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Catalogue Form Settings")
ARRAY TEXT:C222(CAT_at_UserID; 0)
ARRAY LONGINT:C221(CAT_al_UserWidths; 0; 0)

READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	SAVE RECORD:C53([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
End if 
$_l_BlobSIze:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
If ($_l_BlobSIze>0)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CAT_at_UserID; $_l_offset)
	If ($_l_BlobSIze>$_l_offset)
		$_l_ArraySize:=Size of array:C274(CAT_at_UserID)
		ARRAY LONGINT:C221(CAT_al_UserWidths; $_l_ArraySize; 0)
		For ($_l_ColumnIndex; 1; $_l_ArraySize)
			If ($_l_BlobSIze>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CAT_al_UserWidths{$_l_ColumnIndex}; $_l_offset)
			End if 
		End for 
	Else 
		$_l_ArraySize:=Size of array:C274(CAT_at_UserID)
		ARRAY LONGINT:C221(CAT_al_UserWidths; $_l_ArraySize; 0)
	End if 
	$_l_UserRow:=Find in array:C230(CAT_at_UserID; <>PER_t_CurrentUserInitials)
	If ($_l_UserRow>0)
		//Get the custom settings
		
	Else 
		INSERT IN ARRAY:C227(CAT_at_UserID; Size of array:C274(CAT_at_UserID)+1; 1)
		CAT_at_UserID{Size of array:C274(CAT_at_UserID)}:=<>PER_t_CurrentUserInitials
		ARRAY LONGINT:C221(CAT_al_UserWidths; Size of array:C274(CAT_at_UserID); 7)
		$_l_UserRow:=Size of array:C274(CAT_at_UserID)
	End if 
Else 
	INSERT IN ARRAY:C227(CAT_at_UserID; Size of array:C274(CAT_at_UserID)+1; 1)
	CAT_at_UserID{Size of array:C274(CAT_at_UserID)}:=<>PER_t_CurrentUserInitials
	ARRAY LONGINT:C221(CAT_al_UserWidths; Size of array:C274(CAT_at_UserID); 7)
	$_l_UserRow:=Size of array:C274(CAT_at_UserID)
End if 
//AL_GetWidths (CAT_PowerviewPRODS;1;7;(CAT_al_UserWidths{$_l_UserRow}{1});(CAT_al_UserWidths{$_l_UserRow}{2});CAT_al_UserWidths{$_l_UserRow}{3};CAT_al_UserWidths{$_l_UserRow}{4};CAT_al_UserWidths{$_l_UserRow}{5};CAT_al_UserWidths{$_l_UserRow}{6};CAT_al_UserWidths{$_l_UserRow}{7})
$_l_ColumnWIdth:=0
For ($_l_ColumnIndex; 1; 7)
	LB_GetWidths(->CAT_lb_Products; $_l_ColumnIndex; ->$_l_ColumnWIdth)
	CAT_al_UserWidths{$_l_UserRow}{$_l_ColumnIndex}:=$_l_ColumnWIdth
End for 

SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
VARIABLE TO BLOB:C532(CAT_at_UserID; [PREFERENCES:116]DataBlob:2; *)
For ($_l_UserIndex; 1; Size of array:C274(CAT_at_UserID))
	VARIABLE TO BLOB:C532(CAT_al_UserWidths{$_l_UserIndex}; [PREFERENCES:116]DataBlob:2; *)
End for 
SAVE RECORD:C53([PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
CLEAR SEMAPHORE:C144(CheckCATFormSetting)
ERR_MethodTrackerReturn("CAT_SaveProdViewWidths"; $_t_oldMethodName)