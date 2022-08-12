If (False:C215)
	//object Name: [USER]BK_ImportSetup.Pop-up%2FDrop-down List5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKAssModel1IDS;0)
	//ARRAY LONGINT(DM_al_BKAssModel2IDS;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(DM_al_BKOptions;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(DM_at_BKoptions;0)
	C_BOOLEAN:C305($_bo_OK; DM_bo_CModified; DSS_bo_Enabled)
	C_LONGINT:C283($_l_ArraySIze; $_l_DataModelID; $_l_Delay; $_l_event; $_l_Index; $_l_ItemID; $_l_ModelPosition; $_l_offset; $_l_Repeats; $_l_Retries; DM_l_BKDataModelID)
	C_LONGINT:C283(DM_l_BKOptions; DM_l_ConnectionContext)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKModelName; DM_t_BKOPTIONS)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List5"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_BKModelNames>0)
			If (DM_al_BKModelIDS{DM_at_BKModelNames}>0)
				DM_l_BKDataModelID:=DM_al_BKModelIDS{DM_at_BKModelNames}
				DM_t_BKModelName:=DM_at_BKModelNames{DM_at_BKModelNames}
				DM_bo_CModified:=True:C214
			Else 
				$_l_DataModelID:=BK_EditDataModel(0; 0; 0; ""; 0)
				If ($_l_DataModelID>0)
					DM_bo_CModified:=True:C214
					
					DM_l_BKDataModelID:=$_l_DataModelID
					//reload and reset
					ARRAY TEXT:C222(DM_at_BKModelNames; 0)
					ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
					ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; 0)
					ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; 0)
					$_l_Retries:=0
					While (Semaphore:C143("LoadingDataModelPrefs"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*$_l_Retries)
					End while 
					READ ONLY:C145([PREFERENCES:116])
					$_l_ItemID:=PREF_GetPreferenceID("Data Model Names")
					If ($_l_ItemID>0)
						
						DSS_bo_Enabled:=False:C215
						
						
						
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
						//here use a Check_Locked
						If (Records in selection:C76([PREFERENCES:116])=0)
							//add the the preferences list here
							READ WRITE:C146([PREFERENCES:116])
							CREATE RECORD:C68([PREFERENCES:116])
							[PREFERENCES:116]IDNumber:1:=$_l_ItemID
							[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
							[PREFERENCES:116]Pref_OwnerID:4:=-2
							
							DB_SaveRecord(->[PREFERENCES:116])
						Else 
							LOAD RECORD:C52([PREFERENCES:116])
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))  //only increase every 10 tries
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									End if 
									DelayTicks(10*$_l_Delay)
								End if 
							Until ($_bo_OK)
							
						End if   //this will be ONE record
						DM_BKDataModelBlobtoVariables
						$_l_ArraySIze:=Size of array:C274(DM_at_BKModelNames)
						ARRAY TEXT:C222(DM_at_BKModelNames; $_l_ArraySIze)
						ARRAY LONGINT:C221(DM_al_BKModelIDS; $_l_ArraySIze)
						ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; $_l_ArraySIze)
						ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; $_l_ArraySIze)
						INSERT IN ARRAY:C227(DM_at_BKModelNames; Size of array:C274(DM_at_BKModelNames)+1; 2)
						INSERT IN ARRAY:C227(DM_al_BKModelIDS; Size of array:C274(DM_al_BKModelIDS)+1; 2)
						INSERT IN ARRAY:C227(DM_al_BKAssModel1IDS; Size of array:C274(DM_al_BKAssModel1IDS)+1; 2)
						INSERT IN ARRAY:C227(DM_al_BKAssModel2IDS; Size of array:C274(DM_al_BKAssModel2IDS)+1; 2)
						DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)}:="New Data Model"
						DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)-1}:="-"
						$_l_ModelPosition:=Find in array:C230(DM_al_BKModelIDS; DM_l_BKDataModelID)
						If ($_l_ModelPosition<0)
							DM_l_BKDataModelID:=0
							DM_t_BKModelName:=""
						Else 
							DM_t_BKModelName:=DM_at_BKModelNames{$_l_ModelPosition}
						End if 
					End if 
					CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
					
				End if 
				
			End if 
		End if 
End case 
DM_at_BKModelNames:=0
If (DM_l_BKDataModelID>0)
	DM_l_ConnectionContext:=DM_GetModelContext(DM_l_BKDataModelID)
	If (DM_l_ConnectionContext>0)
		$_l_Retries:=0
		While (Semaphore:C143("LoadingDataModelPrefs"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=(DM_l_ConnectionContext))
		ARRAY LONGINT:C221(DM_al_BKOptions; Records in selection:C76([PREFERENCES:116]))
		ARRAY TEXT:C222(DM_at_BKoptions; Records in selection:C76([PREFERENCES:116]))
		FIRST RECORD:C50([PREFERENCES:116])
		For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
			$_l_offset:=0
			DM_al_BKOptions{$_l_Index}:=[PREFERENCES:116]IDNumber:1
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_BKoptions{$_l_Index}; $_l_offset)
				NEXT RECORD:C51([PREFERENCES:116])
			End if 
			
		End for 
		CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
		
		
		If (DM_l_BKOptions>0)
			// DM_t_BKOptionsName
			OBJECT SET VISIBLE:C603(DM_at_BKoptions; False:C215)
			$_l_ModelPosition:=Find in array:C230(DM_al_BKOptions; DM_l_BKOptions)
			If ($_l_ModelPosition>0)
				DM_t_BKOPTIONS:=DM_at_BKoptions{$_l_ModelPosition}
			End if 
			
		Else 
			If (DM_l_ConnectionContext>0)
				INSERT IN ARRAY:C227(DM_at_BKoptions; Size of array:C274(DM_at_BKoptions)+1; 2)
				INSERT IN ARRAY:C227(DM_al_BKOptions; Size of array:C274(DM_al_BKOptions)+1; 2)
				
				DM_at_BKoptions{Size of array:C274(DM_at_BKoptions)}:="New Data Options"
				DM_at_BKoptions{Size of array:C274(DM_at_BKoptions)-1}:="-"
				DM_t_BKOPTIONS:=""
				DM_l_BKOptions:=0
			End if 
			
		End if 
	Else 
		DM_t_BKOPTIONS:=""
		DM_l_BKOptions:=0
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ:BK_ImportSetup,DM_at_BKModelNames"; $_t_oldMethodName)
