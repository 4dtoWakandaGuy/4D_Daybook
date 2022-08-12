//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ServerSideManager
	//------------------ Method Notes ------------------
	//This Process ONLY hands out search results in response to client side requests
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2010 15:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>SD2_ad_CurrentSearchEndDT;0)
	//ARRAY DATE(<>SD2_ad_CurrentSearchStartDT;0)
	//ARRAY LONGINT(<>SD2_al_LastUpdate;0)
	//ARRAY LONGINT(<>SD2_al_RecordIDS;0;0)
	//ARRAY PICTURE(<>SD2_api_CurrentSearchBlob;0)
	//ARRAY TEXT(<>SD2_at_CurrentSearches;0)
	//ARRAY TEXT(<>SD2_at_CurrentSearchUUID;0)
	C_BLOB:C604(SD2_blb_SearchVars)
	C_BOOLEAN:C305(<>DB_bo_Exit)
	C_DATE:C307(SD2_d_ReturnEndDate; SD2_d_ReturnStartDate)
	C_LONGINT:C283(<>DB_l_DiarySetmanagerProcess; $_l_LastUpdateStamp; $_l_SearchPosition; SD2_l_SearchReady)
	C_PICTURE:C286(SD2_pi_BlobinPicture)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchID; SD2_t_SearchCharacters; SD2_t_SearchID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ServerSideManager")
ARRAY TEXT:C222(<>SD2_at_CurrentSearches; 0)
ARRAY PICTURE:C279(<>SD2_api_CurrentSearchBlob; 0)
ARRAY TEXT:C222(<>SD2_at_CurrentSearchUUID; 0)
ARRAY DATE:C224(<>SD2_ad_CurrentSearchStartDT; 0)
ARRAY DATE:C224(<>SD2_ad_CurrentSearchEndDT; 0)
ARRAY LONGINT:C221(<>SD2_al_LastUpdate; 0)
ARRAY LONGINT:C221(<>SD2_al_RecordIDS; 0; 0)
<>DB_l_DiarySetmanagerProcess:=Current process:C322
//TRACE
Repeat 
	While (SD2_l_SearchReady=0)
		DelayTicks(10)
	End while 
	If (SD2_l_SearchReady=-1)
		If (SD2_t_SearchCharacters#"") & (BLOB size:C605(SD2_blb_SearchVars)>0)
			$_l_SearchPosition:=Find in array:C230(<>SD2_at_CurrentSearches; SD2_t_SearchCharacters)
			If ($_l_SearchPosition<0)
				APPEND TO ARRAY:C911(<>SD2_at_CurrentSearches; SD2_t_SearchCharacters)
				BLOB TO PICTURE:C682(SD2_blb_SearchVars; SD2_pi_BlobinPicture; "BLOB")
				APPEND TO ARRAY:C911(<>SD2_api_CurrentSearchBlob; SD2_pi_BlobinPicture)
				
				$_t_SearchID:=SD2_ServerSideCreateQuery(SD2_blb_SearchVars; ->SD2_d_ReturnStartDate; ->SD2_d_ReturnEndDate)
				APPEND TO ARRAY:C911(<>SD2_at_CurrentSearchUUID; $_t_SearchID)
				APPEND TO ARRAY:C911(<>SD2_ad_CurrentSearchStartDT; SD2_d_ReturnStartDate)
				APPEND TO ARRAY:C911(<>SD2_ad_CurrentSearchEndDT; SD2_d_ReturnEndDate)
				$_l_LastUpdateStamp:=GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*))
				APPEND TO ARRAY:C911(<>SD2_al_LastUpdate; $_l_LastUpdateStamp)
				INSERT IN ARRAY:C227(<>SD2_al_RecordIDS; Size of array:C274(<>SD2_al_RecordIDS)+1; 1)
				LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; <>SD2_al_RecordIDS{Size of array:C274(<>SD2_al_RecordIDS)})
				SD2_t_SearchID:=$_t_SearchID
				SD2_l_SearchReady:=1
			Else 
				While (Semaphore:C143("Updating"+String:C10(<>SD2_at_CurrentSearchUUID{$_l_SearchPosition})))
					DelayTicks(2)
				End while 
				SD2_t_SearchID:=<>SD2_at_CurrentSearchUUID{$_l_SearchPosition}
				SD2_l_SearchReady:=1
				CLEAR SEMAPHORE:C144("Updating"+String:C10(<>SD2_at_CurrentSearchUUID{$_l_SearchPosition}))
			End if 
			
		End if 
	End if 
Until (<>DB_bo_Exit)
ERR_MethodTrackerReturn("SD2_ServerSideManager"; $_t_oldMethodName)