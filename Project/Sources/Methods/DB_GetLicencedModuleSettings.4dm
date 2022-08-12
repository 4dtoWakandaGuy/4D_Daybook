//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLicencedModuleSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2012 09:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	C_BOOLEAN:C305(<>SYS_bo_DuringInit)
	C_DATE:C307($_d_LicenceDateTo)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_IMUsers; $_l_ModuleIndex; $_l_offset; $_l_Users; $_l_WPUsers; DB_l_CurrentOwnerRequest)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_LicenceNumericFULL; $_t_LicenceString; $_t_ModuleDecodeString; $_t_oldMethodName; $_t_OrganisationNUMSTR)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLicencedModuleSettings")
If (Not:C34(<>SYS_bo_DuringInit))
	
	If (Application type:C494=4D Server:K5:6)
		
		If (DB_l_CurrentOwnerRequest>0)
			QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=DB_l_CurrentOwnerRequest)
		Else 
			QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=<>PER_l_CurLoggedinDataOwnerID)
		End if 
	Else 
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=<>PER_l_CurLoggedinDataOwnerID)
	End if 
	QUERY SELECTION:C341([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Is_Licence_Active:11=True:C214)
	//This should always be just one record...
	If (Records in selection:C76([LICENCE_UPDATES:97])=0)  //at any point this is called this should have already been run-remember the server now does not have the licence it has many licences so this is always going to be on a client.
		DB_LoadLicenceDetails  //Makes sure there is a record including handling renewal
	Else 
		CREATE SET:C116([LICENCE_UPDATES:97]; "$ThisClient")
		
		
		
		ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2; <)
		FIRST RECORD:C50([LICENCE_UPDATES:97])
		$_d_LicenceDateTo:=[LICENCE_UPDATES:97]Update_Date:2
		USE SET:C118("$ThisClient")
		
		
		QUERY SELECTION:C341([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2=$_d_LicenceDateTo)
		
		ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Created_Time:8; <)
	End if 
	
	$_l_offset:=0
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceString; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceNumericFULL; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_OrganisationNUMSTR; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_WPUsers; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_IMUsers; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_l_Users; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_ModuleDecodeString; $_l_offset)
	BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_al_ModuleAccess; $_l_offset)
	For ($_l_ModuleIndex; 1; Size of array:C274($_al_ModuleAccess))
		If (Size of array:C274($1->)>=$_l_ModuleIndex)
			$1->{$_l_ModuleIndex}:=$_al_ModuleAccess{$_l_ModuleIndex}
		Else 
			APPEND TO ARRAY:C911($1->; $_al_ModuleAccess{$_l_ModuleIndex})
		End if 
	End for 
	If (Size of array:C274($1->)>1)
		$1->{1}:=0
	End if 
	If (Size of array:C274($1->)>1)
		$1->{30}:=0
	End if 
	If (Size of array:C274($1->)>1)
		$1->{37}:=1
	End if 
	If (Size of array:C274($1->)>1)
		$1->{38}:=1
	End if 
	If (Size of array:C274($1->)>1)
		$1->{39}:=1
	End if 
	If (Size of array:C274($1->)>=Module_DiaryManager)
		$1->{Module_DiaryManager}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_SalesLedger)
		$1->{Module_SalesLedger}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_PurchaseLedger)
		$1->{Module_PurchaseLedger}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_NominalLedger)
		$1->{Module_NominalLedger}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_DataManager)
		$1->{Module_DataManager}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_Companies)
		$1->{Module_Companies}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_Products)
		$1->{Module_Products}:=1
		
		
	End if 
	
	
Else 
	// <>SYS_bo_DuringInit is a special status to use when creating a new data file-there is no user or privilige so we will enable all modules temporarily
	For ($_l_ModuleIndex; 1; Size of array:C274($1->))
		If (Size of array:C274($1->)>=$_l_ModuleIndex)
			$1->{$_l_ModuleIndex}:=1
		Else 
			APPEND TO ARRAY:C911($1->; 1)
		End if 
	End for 
	If (Size of array:C274($1->)>1)
		$1->{1}:=0
	End if 
	If (Size of array:C274($1->)>1)
		$1->{30}:=0
	End if 
	If (Size of array:C274($1->)>1)
		$1->{37}:=1
	End if 
	If (Size of array:C274($1->)>1)
		$1->{38}:=1
	End if 
	If (Size of array:C274($1->)>1)
		$1->{39}:=1
	End if 
	If (Size of array:C274($1->)>=Module_DiaryManager)
		$1->{Module_DiaryManager}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_SalesLedger)
		$1->{Module_SalesLedger}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_PurchaseLedger)
		$1->{Module_PurchaseLedger}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_NominalLedger)
		$1->{Module_NominalLedger}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_DataManager)
		$1->{Module_DataManager}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_Companies)
		$1->{Module_Companies}:=1
		
		
	End if 
	If (Size of array:C274($1->)>=Module_Products)
		$1->{Module_Products}:=1
		
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DB_GetLicencedModuleSettings"; $_t_oldMethodName)