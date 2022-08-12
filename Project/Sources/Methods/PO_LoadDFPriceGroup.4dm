//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_LoadDFPriceGroup
	//------------------ Method Notes ------------------
	//This method is called to both get and set the price group. no parameters=get  parameter(boolean) =true save*
	//To test this method we Get the current value set the value to a default test that the value=what we set it to then set it back to the original if there was one
	
	//------------------ Revision Control ----------------
	//Date Created: 07/07/2010 13:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1; DB_bo_FromTest; DB_bo_UNITTEST)
	C_LONGINT:C283($_l_Index; $_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_DefaultPPriceGroup; $_t_DefaultPPriceGroup2; $_t_oldMethodName; USR_t_DefaultPPriceGroup)
	C_TIME:C306(DB_ti_UTDOC)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("PO_LoadDFPriceGroup")

If (DB_bo_UNITTEST) & (Not:C34(DB_bo_FromTest))
	DB_ti_UTDOC:=?00:00:00?
	If (DB_ti_UTDOC=?00:00:00?)
		DB_ti_UTDOC:=Create document:C266("PO_LoadDFPriceGroup"; "TEXT")
		
	End if 
	DB_bo_FromTest:=True:C214
	PO_LoadDFPriceGroup
	SEND PACKET:C103(DB_ti_UTDOC; "Current Purchase Pricing Defaults="+USR_t_DefaultPPriceGroup+Char:C90(13))
	$_t_DefaultPPriceGroup:=USR_t_DefaultPPriceGroup
	For ($_l_Index; 1; 1000)
		USR_t_DefaultPPriceGroup:="Setting"+String:C10($_l_Index)
		$_t_DefaultPPriceGroup2:=USR_t_DefaultPPriceGroup
		PO_LoadDFPriceGroup(True:C214)
		PO_LoadDFPriceGroup
		SEND PACKET:C103(DB_ti_UTDOC; "TEMP "+String:C10($_l_Index)+"Current Purchase Pricing Defaults="+USR_t_DefaultPPriceGroup+Char:C90(13))
		If (USR_t_DefaultPPriceGroup#$_t_DefaultPPriceGroup2)
			SEND PACKET:C103(DB_ti_UTDOC; "ERROR")
		End if 
	End for 
	USR_t_DefaultPPriceGroup:=$_t_DefaultPPriceGroup
	PO_LoadDFPriceGroup(True:C214)
	PO_LoadDFPriceGroup
	SEND PACKET:C103(DB_ti_UTDOC; "FINAL "+String:C10($_l_Index)+"Current Purchase Pricing Defaults="+USR_t_DefaultPPriceGroup+Char:C90(13))
	Gen_Alert("Test Complete")
	CLOSE DOCUMENT:C267(DB_ti_UTDOC)
	
Else 
	
	READ ONLY:C145([PREFERENCES:116])
	While (Semaphore:C143("LoadingPGCode"))
		DelayTicks
	End while 
	
	$_l_ItemID:=PREF_GetPreferenceID("Purchase Pricing Defaults")
	
	CLEAR SEMAPHORE:C144("LoadingPGCode")
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(USR_t_DefaultPPriceGroup; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		If (Count parameters:C259=0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; USR_t_DefaultPPriceGroup; $_l_offset)
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
				VARIABLE TO BLOB:C532(USR_t_DefaultPPriceGroup; [PREFERENCES:116]DataBlob:2; *)
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("PO_LoadDFPriceGroup"; $_t_oldMethodName)
