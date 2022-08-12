If (False:C215)
	//object Name: [USER]BK_ImportSetup.Variable2
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
	//ARRAY LONGINT(DM_al_BusinessKitServerID;0)
	//ARRAY TEXT(DM_at_BKStoreName;0)
	//ARRAY TEXT(DM_at_BusinessKitServer;0)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_offset; $_l_ServerID; $_l_ServerPosition; DM_l_BkserverID; DM_l_BkstoreID)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKStoreName; DM_t_BusinessKitServer; DM_t_ServerIP; DM_t_ServerPort)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Variable2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_BusinessKitServer>0)
			If (DM_al_BusinessKitServerID{DM_at_BusinessKitServer}>0)
				DM_t_BusinessKitServer:=DM_at_BusinessKitServer{DM_at_BusinessKitServer}
				DM_l_BkserverID:=DM_al_BusinessKitServerID{DM_at_BusinessKitServer}
				DM_bo_CModified:=True:C214
			Else 
				//add BK server
				$_l_ServerID:=BK_EditServer(0)
				If ($_l_ServerID>0)
					DM_bo_CModified:=True:C214
					
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-1)
					//these
					SELECTION TO ARRAY:C260([PREFERENCES:116]IDNumber:1; DM_al_BusinessKitServerID)
					
					ARRAY TEXT:C222(DM_at_BusinessKitServer; 0)
					ARRAY TEXT:C222(DM_at_BusinessKitServer; Size of array:C274(DM_al_BusinessKitServerID))
					FIRST RECORD:C50([PREFERENCES:116])
					For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
						$_l_offset:=0
						DM_BKServerBlobtoVars
						DM_at_BusinessKitServer{$_l_Index}:=DM_t_BusinessKitServer
						
						NEXT RECORD:C51([PREFERENCES:116])
					End for 
					INSERT IN ARRAY:C227(DM_at_BusinessKitServer; Size of array:C274(DM_at_BusinessKitServer)+1; 2)
					INSERT IN ARRAY:C227(DM_al_BusinessKitServerID; Size of array:C274(DM_al_BusinessKitServerID)+1; 2)
					DM_at_BusinessKitServer{Size of array:C274(DM_at_BusinessKitServer)}:="Add Business Kit"
					DM_at_BusinessKitServer{Size of array:C274(DM_at_BusinessKitServer)-1}:="-"
					
					$_l_ServerPosition:=Find in array:C230(DM_al_BusinessKitServerID; $_l_ServerID)
					
					If ($_l_ServerPosition<0)
						//reload and set
						
						$_l_ServerPosition:=Find in array:C230(DM_al_BusinessKitServerID; $_l_ServerID)
						If ($_l_ServerPosition>0)
							DM_t_BusinessKitServer:=DM_at_BusinessKitServer{$_l_ServerPosition}
							DM_l_BkserverID:=DM_al_BusinessKitServerID{$_l_ServerPosition}
							
						Else 
							//some error here
						End if 
						//```
						
						
					Else 
						// just set
						DM_t_BusinessKitServer:=DM_at_BusinessKitServer{$_l_ServerPosition}
						DM_l_BkserverID:=DM_al_BusinessKitServerID{$_l_ServerPosition}
					End if 
					
				End if 
			End if 
		End if 
		
		
		If (DM_l_BkserverID>0)
			ARRAY TEXT:C222(DM_at_BKStoreName; 0)
			ARRAY LONGINT:C221(DM_al_BKStoreIDs; 0)
			//can only identify within a server
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-(DM_l_BkserverID))
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
			OBJECT SET VISIBLE:C603(DM_at_BKStoreName; True:C214)
			OBJECT SET VISIBLE:C603(*; "DM_Pi_BKStorePop"; True:C214)
			If (DM_l_BkstoreID>0)
				//a store had been picked
				$_l_ServerPosition:=Find in array:C230(DM_al_BKStoreIDs; DM_l_BkstoreID)
				If ($_l_ServerPosition<0)
					//that store is on a different server!
					Gen_Alert("The selected store is on a different server, please re-select a store")
					DM_l_BkstoreID:=0
					DM_t_BKStoreName:=""
				End if 
				
			End if 
		End if 
		
End case 
DM_at_BusinessKitServer:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Variable2"; $_t_oldMethodName)