If (False:C215)
	//object Name: [USER]BK_ImportSetup.Variable5
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
	//ARRAY LONGINT(DM_al_BKStoreIDs;0)
	//ARRAY TEXT(DM_at_BKStoreName;0)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_offset; $_l_StoreID; $_l_StorePosition; DM_l_BkserverID; DM_l_BkstoreID)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKStoreName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Variable5"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_BKStoreName>0)
			If (DM_al_BKStoreIDs{DM_at_BKStoreName}>0)
				DM_t_BKStoreName:=DM_at_BKStoreName{DM_at_BKStoreName}
				DM_l_BkstoreID:=DM_al_BKStoreIDs{DM_at_BKStoreName}
				DM_bo_CModified:=True:C214
			Else 
				//add BK store
				$_l_StoreID:=BK_EditStore(DM_l_BkserverID; 0)
				If ($_l_StoreID>0)
					DM_bo_CModified:=True:C214
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-(DM_l_BkserverID))
					//these
					SELECTION TO ARRAY:C260([PREFERENCES:116]IDNumber:1; DM_al_BKStoreIDs)
					ARRAY TEXT:C222(DM_at_BKStoreName; Size of array:C274(DM_al_BKStoreIDs))
					FIRST RECORD:C50([PREFERENCES:116])
					For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
						$_l_offset:=0
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_BKStoreName{$_l_Index}; $_l_offset)
						NEXT RECORD:C51([PREFERENCES:116])
					End for 
					INSERT IN ARRAY:C227(DM_at_BKStoreName; Size of array:C274(DM_at_BKStoreName)+1; 2)
					INSERT IN ARRAY:C227(DM_al_BKStoreIDs; Size of array:C274(DM_al_BKStoreIDs)+1; 2)
					DM_at_BKStoreName{Size of array:C274(DM_at_BKStoreName)}:="Add Store"
					DM_at_BKStoreName{Size of array:C274(DM_at_BKStoreName)-1}:="-"
					$_l_StorePosition:=Find in array:C230(DM_al_BKStoreIDs; $_l_StoreID)
					If ($_l_StorePosition<0)
						
						//reload and set
						
						$_l_StorePosition:=Find in array:C230(DM_al_BKStoreIDs; $_l_StoreID)
						If ($_l_StorePosition>0)
							DM_t_BKStoreName:=DM_at_BKStoreName{$_l_StorePosition}
							DM_l_BkstoreID:=DM_al_BKStoreIDs{$_l_StorePosition}
						Else 
							//some error here
						End if 
						
					Else 
						// just set
						DM_t_BKStoreName:=DM_at_BKStoreName{$_l_StorePosition}
						DM_l_BkstoreID:=DM_al_BKStoreIDs{$_l_StorePosition}
					End if 
					
				End if 
			End if 
		End if 
		
End case 
DM_at_BKStoreName:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Variable5"; $_t_oldMethodName)