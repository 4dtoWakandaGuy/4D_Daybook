//%attributes = {}
If (False:C215)
	//Project Method Name:      DF_LoadOrderEntryOption
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/07/2010 13:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_ItemID; $_l_offset; $_l_Retries; DF_l_ContactCentric; DF_l_DefaultPriceSetting; DF_l_ListedOnly; DF_l_SupplierOption)
	C_TEXT:C284($_t_oldMethodName; DF_t_SupplierOption)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DF_LoadOrderEntryOption")



READ ONLY:C145([PREFERENCES:116])
$_l_Retries:=0
While (Semaphore:C143("LoadingContactOrderCode"))
	$_l_Retries:=0
	DelayTicks($_l_Retries*2)
End while 

$_l_ItemID:=PREF_GetPreferenceID("Orders Contact Centeric")




QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	DF_l_DefaultPriceSetting:=0
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(DF_l_ContactCentric; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	If (Count parameters:C259=0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DF_l_ContactCentric; $_l_offset)
		
		
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
			VARIABLE TO BLOB:C532(DF_l_ContactCentric; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
	End if 
	
End if 
CLEAR SEMAPHORE:C144("LoadingContactOrderCode")
ERR_MethodTrackerReturn("DF_LoadOrderEntryOption"; $_t_oldMethodName)