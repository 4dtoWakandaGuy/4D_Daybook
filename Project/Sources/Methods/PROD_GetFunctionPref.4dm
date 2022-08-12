//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_GetFunctionPref
	//------------------ Method Notes ------------------
	//zThis method will return the preference to use for product entry. This is to allow a different product entry screen to be used. I have written it in such a way that
	//More than one function could be using a different window..initially though the function is only for using from the product entry on sales orders
	//(either from the little pop up of products when you are adding an order item or from the menu item that has been added under the function menu)
	//access to the function is control by the user preferences as it would be under the product menu...it does not do anything different...
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PROD_at_ProductEntryForm;0)
	//ARRAY TEXT(PROD_at_ProductEntryFunction;0)
	C_BOOLEAN:C305($_bo_Save; $1; PROD_bo_EntryPrefsLoaded)
	C_LONGINT:C283($_l_FunctionRow; $_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_FormName; $_t_FunctionName; $_t_oldMethodName; $0; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_GetFunctionPref")


$0:=""
If (Not:C34(PROD_bo_EntryPrefsLoaded))
	While (Semaphore:C143("ProductEntryPrefs"))
		DelayTicks(10)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Product Entry Preferences")
	ARRAY TEXT:C222(PROD_at_ProductEntryFunction; 0)
	ARRAY TEXT:C222(PROD_at_ProductEntryForm; 0)
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(PROD_at_ProductEntryFunction; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PROD_at_ProductEntryForm; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PROD_at_ProductEntryFunction; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PROD_at_ProductEntryForm; $_l_offset)
	End if 
	CLEAR SEMAPHORE:C144("ProductEntryPrefs")
	PROD_bo_EntryPrefsLoaded:=True:C214
End if 
If (Count parameters:C259>=1)  //to get a specific setting OR to save settings
	$_bo_Save:=$1
	$_t_FunctionName:=""
	If (Count parameters:C259>=2)
		$_t_FunctionName:=$2
		$_t_FormName:=""
		If (Count parameters:C259>=3)
			$_t_FormName:=$3
		End if 
	End if 
	If ($_bo_Save)
		While (Semaphore:C143("ProductEntryPrefs"))
			DelayTicks(10)
		End while 
		If ($_t_FunctionName#"")
			$_l_FunctionRow:=Find in array:C230(PROD_at_ProductEntryFunction; $_t_FunctionName)
			If ($_l_FunctionRow<0)
				APPEND TO ARRAY:C911(PROD_at_ProductEntryFunction; $_t_FunctionName)
				APPEND TO ARRAY:C911(PROD_at_ProductEntryForm; $_t_FormName)
			Else 
				PROD_at_ProductEntryForm{$_l_FunctionRow}:=$_t_FormName
			End if 
			$_l_ItemID:=PREF_GetPreferenceID("Product Entry Preferences")
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PROD_at_ProductEntryFunction; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PROD_at_ProductEntryForm; $_l_offset)
			DB_SaveRecord(->[PREFERENCES:116])
		Else 
			//Array has been already updated...
			$_l_ItemID:=PREF_GetPreferenceID("Product Entry Preferences")
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			$_l_offset:=0
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			$_l_offset:=0
			VARIABLE TO BLOB:C532(PROD_at_ProductEntryFunction; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PROD_at_ProductEntryForm; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			
		End if 
		CLEAR SEMAPHORE:C144("ProductEntryPrefs")
	Else 
		$0:=""
		If ($_t_FunctionName#"")
			$_l_FunctionRow:=Find in array:C230(PROD_at_ProductEntryFunction; $_t_FunctionName)
			If ($_l_FunctionRow>0)
				$0:=PROD_at_ProductEntryForm{$_l_FunctionRow}
			End if 
		Else 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PROD_GetFunctionPref"; $_t_oldMethodName)
