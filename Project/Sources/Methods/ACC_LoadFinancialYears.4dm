//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LoadFinancialYears
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	//ARRAY LONGINT(ACC_Al_FinancialYearID;0)
	C_BOOLEAN:C305($_bo_OK; $1; ACC_bo_FinancialYearsLoaded)
	C_LONGINT:C283($_l_Delay; $_l_Index; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_Retries; $_l_SizeofArray; ACC_l_YearID)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LoadFinancialYears")
//NG August 2004 New method to load/Save financial years

$_l_Retries:=0
If (Count parameters:C259=0)
	ACC_bo_FinancialYearsLoaded:=False:C215
End if 
If (Not:C34(ACC_bo_FinancialYearsLoaded))
	While (Semaphore:C143("LoadingFinancialYears"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks($_l_Retries*2)
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("Financial Years")
	
	If ($_l_ItemID>0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
		
		//here use a Check_Locked
		$_bo_OK:=False:C215
		$_l_Repeats:=0
		$_l_Delay:=1
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
			If (Not:C34($_bo_OK))
				If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
					//only increase every 10 tries
					$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
				End if 
				DelayTicks(2*$_l_Delay)
			End if 
		Until ($_bo_OK=True:C214)
		
		If (Records in selection:C76([PREFERENCES:116])=0)
			//add the the preferences list here
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			
			DB_SaveRecord(->[PREFERENCES:116])
		End if   //this will be ONE record
		$_l_offset:=0
		If (Count parameters:C259=1)
			ARRAY DATE:C224(ACC_ad_FinancialYearFrom; 0)
			ARRAY DATE:C224(ACC_AD_FinancialYearTo; 0)
			ARRAY LONGINT:C221(ACC_Al_FinancialYearID; 0)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_ad_FinancialYearFrom; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_AD_FinancialYearTo; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_Al_FinancialYearID; $_l_offset)
						
					End if 
				End if 
			End if 
			$_l_SizeofArray:=Size of array:C274(ACC_AD_FinancialYearFrom)
			ARRAY DATE:C224(ACC_ad_FinancialYearFrom; $_l_SizeofArray)
			ARRAY DATE:C224(ACC_AD_FinancialYearTo; $_l_SizeofArray)
			ARRAY LONGINT:C221(ACC_Al_FinancialYearID; $_l_SizeofArray)
			ACC_l_YearID:=0
			For ($_l_Index; 1; Size of array:C274(ACC_Al_FinancialYearID))
				If (ACC_Al_FinancialYearID{$_l_Index}=0)
					ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
					ACC_Al_FinancialYearID{$_l_Index}:=ACC_l_YearID
				End if 
			End for 
			SORT ARRAY:C229(ACC_ad_FinancialYearFrom; ACC_AD_FinancialYearTo; ACC_Al_FinancialYearID)
			ACC_bo_FinancialYearsLoaded:=True:C214
			$_l_offset:=0
		Else 
			//Update
			READ WRITE:C146([PREFERENCES:116])
			LOAD RECORD:C52([PREFERENCES:116])
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(ACC_ad_FinancialYearFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(ACC_AD_FinancialYearTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(ACC_Al_FinancialYearID; [PREFERENCES:116]DataBlob:2; *)
			AA_CheckUUID(Table:C252(->[ACC_Bank_Statements:198]))
			<>SYS_t_LastSavedTableName:="PREFERENCES"
			SAVE RECORD:C53([PREFERENCES:116])
			DB_SaveRecord(->[PREFERENCES:116])
			
			
		End if 
	Else 
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	CLEAR SEMAPHORE:C144("LoadingFinancialYears")
End if 
ERR_MethodTrackerReturn("ACC_LoadFinancialYears"; $_t_oldMethodName)
