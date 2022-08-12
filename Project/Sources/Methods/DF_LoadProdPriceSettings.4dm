//%attributes = {}

If (False:C215)
	//Project Method Name:      DF_LoadProdPriceSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DF_at_SupplierOption;0)
	C_BOOLEAN:C305($_bo_Set; $1)
	C_LONGINT:C283($_l_Index; $_l_ItemID; $_l_offset; DF_l_DefaultPriceSetting; DF_l_ListedOnly; DF_l_SupplierOption)
	C_TEXT:C284($_t_oldMethodName; DF_t_SupplierOption)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DF_LoadProdPriceSettings")

ARRAY TEXT:C222(DF_at_SupplierOption; 3)
DF_at_SupplierOption{1}:="Auto add suppliers to list"
DF_at_SupplierOption{2}:="Ask to add suppliers to list"
DF_at_SupplierOption{3}:="Do not add suppliers to list"

$_t_oldMethodName:=ERR_MethodTracker("DF_LoadProdPriceSettings")
READ ONLY:C145([PREFERENCES:116])

While (Semaphore:C143("LoadingPrefsSupCode"))
	DelayTicks
End while 

$_l_ItemID:=PREF_GetPreferenceID("Product Supplier Preferences")




QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	DF_l_DefaultPriceSetting:=0
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(DF_l_DefaultPriceSetting; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DF_l_SupplierOption; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DF_l_ListedOnly; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	If (Count parameters:C259=0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DF_l_DefaultPriceSetting; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DF_l_SupplierOption; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DF_l_ListedOnly; $_l_offset)
			End if 
		End if 
		UNLOAD RECORD:C212([PREFERENCES:116])
		For ($_l_Index; 1; Size of array:C274(DF_at_SupplierOption))
			$_bo_Set:=DF_l_SupplierOption ?? $_l_Index
			If ($_bo_Set)
				DF_t_SupplierOption:=DF_at_SupplierOption{$_l_Index}
				$_l_Index:=Size of array:C274(DF_at_SupplierOption)
			End if 
		End for 
		
	Else 
		If ($1)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			If (Records in selection:C76([PREFERENCES:116])=0)
				
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			End if 
			$_l_offset:=0
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DF_l_DefaultPriceSetting; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DF_l_SupplierOption; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DF_l_ListedOnly; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
	End if 
	
End if 
CLEAR SEMAPHORE:C144("LoadingPrefsSupCode")
ERR_MethodTrackerReturn("DF_LoadProdPriceSettings"; $_t_oldMethodName)