//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_DataretreiveManager
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
	//ARRAY DATE(DM_ad_LastDate;0)
	//ARRAY DATE(DM_ad_NextDate;0)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY LONGINT(DM_al_Frequency;0)
	//ARRAY LONGINT(DM_al_LastTime;0)
	//ARRAY LONGINT(DM_al_ModuleID;0)
	//ARRAY LONGINT(DM_al_ModuleType;0)
	//ARRAY LONGINT(DM_al_NextTime;0)
	//ARRAY LONGINT(DM_al_SortOrder;0)
	//ARRAY POINTER(DM_aptr_DestinationFields;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	//ARRAY TEXT(DM_at_FREQUENCYTYPE;0)
	//ARRAY TEXT(DM_at_SourceField;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_BusKit; $_bo_OK; $_bo_WebServerActive)
	C_DATE:C307(DM_D_NextRetrieveDate)
	C_LONGINT:C283(<>DM_l_RetrieveManagerProcessID; $_l_DataSourceRow; $_l_Index; $_l_ListID; $_l_ModuleType; $_l_offset; $_l_Type; DM_l_NextRetrieveModuleID; DM_l_ResetModuleID)
	C_TEXT:C284($_t_oldMethodName; DM_t_DataSource)
	C_TIME:C306(DM_ti_NextRetreiveTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_DataretreiveManager")

//DM_DataRetreiveManager
$_t_oldMethodName:=ERR_MethodTracker("DM_DataretreiveManager")
<>DM_l_RetrieveManagerProcessID:=Current process:C322
If (Application type:C494=4D Server:K5:6)
	Ask_Person
End if 


ARRAY LONGINT:C221(DM_al_ModuleType; 0)
ARRAY LONGINT:C221(DM_al_ModuleID; 0)
ARRAY LONGINT:C221(DM_al_LastTime; 0)
ARRAY DATE:C224(DM_ad_LastDate; 0)
ARRAY LONGINT:C221(DM_al_Frequency; 0)
ARRAY LONGINT:C221(DM_al_NextTime; 0)
ARRAY DATE:C224(DM_ad_NextDate; 0)
ARRAY LONGINT:C221(DM_al_SortOrder; 0)
ARRAY TEXT:C222(DM_at_FREQUENCYTYPE; 0)
DM_l_ResetModuleID:=0
DM_ti_NextRetreiveTime:=?00:00:00?
DM_D_NextRetrieveDate:=!00-00-00!
DM_l_NextRetrieveModuleID:=0

ARRAY LONGINT:C221(DM_al_DataSources; 0)
ARRAY TEXT:C222(DM_at_DataSources; 0)
$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
$_l_DataSourceRow:=Find in array:C230(DM_at_DataSources; "Daybook Webserver")
$_bo_WebServerActive:=False:C215
If ($_l_DataSourceRow>0)
	$_bo_WebServerActive:=True:C214
End if 
DM_GetBKSettings(->DM_al_ModuleType; ->DM_al_ModuleID; ->DM_al_LastTime; ->DM_ad_LastDate; ->DM_al_Frequency; ->DM_at_FREQUENCYTYPE)

//DM_GetWSSettings(->DM_al_ModuleType;->DM_al_ModuleID;->DM_al_LastTime;->DM_D_aLa

//Here we can retrieve other settings
ARRAY LONGINT:C221(DM_al_NextTime; Size of array:C274(DM_al_ModuleID))

ARRAY LONGINT:C221(DM_al_SortOrder; Size of array:C274(DM_al_ModuleID))

For ($_l_Index; 1; Size of array:C274(DM_al_NextTime))
	DM_al_NextTime{$_l_Index}:=DM_SetNextTime(DM_ad_LastDate{$_l_Index}; DM_al_LastTime{$_l_Index}; DM_al_Frequency{$_l_Index}; DM_at_FREQUENCYTYPE{$_l_Index})
End for 

SORT ARRAY:C229(DM_al_NextTime; DM_al_Frequency; DM_at_FREQUENCYTYPE; DM_ad_LastDate; DM_al_LastTime; DM_al_ModuleID; DM_al_ModuleType)

Repeat 
	IDLE:C311
	
	If (Size of array:C274(DM_al_NextTime)>0) | ($_bo_WebServerActive)
		$_bo_BusKit:=False:C215
		If (Size of array:C274(DM_al_NextTime)>0)
			Gen_TimeStamp2Date(DM_al_NextTime{1}; ->DM_D_NextRetrieveDate; ->DM_ti_NextRetreiveTime)
		Else 
			DM_D_NextRetrieveDate:=!00-00-00!
			DM_ti_NextRetreiveTime:=?00:00:00?
		End if 
		Repeat 
			If (Not:C34($_bo_WebServerActive))
				DelayTicks(1*60)
			Else 
				$_bo_BusKit:=True:C214
			End if 
		Until ((DM_D_NextRetrieveDate=Current date:C33(*)) & (DM_ti_NextRetreiveTime<=Current time:C178(*))) | (DM_l_ResetModuleID>0) | (DM_D_NextRetrieveDate<Current date:C33(*)) | ($_bo_WebServerActive)
		If (Size of array:C274(DM_al_ModuleType)>0)
			$_l_ModuleType:=DM_al_ModuleType{1}
		Else 
			//temporary
			$_l_ModuleType:=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Daybook Webserver")}
		End if 
		If (DM_l_ResetModuleID=0)
			Case of 
				: (DM_at_DataSources{Find in array:C230(DM_al_DataSources; $_l_ModuleType)}="Business Kit") & (Not:C34($_bo_BusKit))  //Business Kit
					DM_GetBKData(DM_al_ModuleID{1})
					DM_l_ResetModuleID:=DM_al_ModuleID{1}
					DM_GetBKSettings(->DM_al_ModuleType; ->DM_al_ModuleID; ->DM_al_LastTime; ->DM_ad_LastDate; ->DM_al_Frequency; ->DM_at_FREQUENCYTYPE; 0)
					DM_l_ResetModuleID:=0
				: (DM_at_DataSources{Find in array:C230(DM_al_DataSources; $_l_ModuleType)}="Daybook Webserver")  //Web Server
					QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]ServiceType:6="DMwebReceive"; *)
					QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Status:2=-1)
					If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
						$_l_offset:=0
						BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; DM_t_DataSource)
						If (DM_t_DataSource#"")
							//need to check we know the source handling
							ARRAY TEXT:C222(DM_at_SourceField; 0)
							ARRAY POINTER:C280(DM_aptr_DestinationFields; 0)
							$_bo_OK:=DM_GetWebServSource(DM_t_DataSource; ->[PROCESSES_TO_HANDLE:115]Data5Blob:12; ->DM_at_SourceField; ->DM_aptr_DestinationFields)
							If ($_bo_OK=False:C215)
								DM_CreateWebServSource(DM_t_DataSource)
								
								
							End if 
							If ($_bo_OK=True:C214)
								//THE MAP IS VALID
								DM_SAVEWEBDATA([PROCESSES_TO_HANDLE:115]TableNumber:1; ->[PROCESSES_TO_HANDLE:115]Data5Blob:12; ->DM_at_SourceField; ->DM_aptr_DestinationFields)
							End if 
						Else 
							//we have some rubarb
						End if 
					Else 
						$_bo_WebServerActive:=False:C215
					End if 
					
			End case 
			
			
		Else 
			//re-get the settings for that module. Note if may be a new module
			$_l_DataSourceRow:=Find in array:C230(DM_al_ModuleID; DM_l_ResetModuleID)
			If ($_l_DataSourceRow>0)
				$_l_Type:=DM_al_ModuleType{$_l_DataSourceRow}
				
				Case of 
					: (DM_at_DataSources{Find in array:C230(DM_al_DataSources; $_l_Type)}="Business Kit")
						//business kit
						DM_GetBKSettings(->DM_al_ModuleType; ->DM_al_ModuleID; ->DM_al_LastTime; ->DM_ad_LastDate; ->DM_al_Frequency; ->DM_at_FREQUENCYTYPE; 0)
						
					: (DM_at_DataSources{Find in array:C230(DM_al_DataSources; $_l_Type)}="Daybook Intercom")
						//webserver
						// DM_GetWSSettings(->DM_al_ModuleType;->DM_al_ModuleID;->DM_al_LastTime;->DM_D_aL
					: (DM_at_DataSources{Find in array:C230(DM_al_DataSources; $_l_Type)}="Daybook Webserver")  //Web Server
						QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]ServiceType:6="DMwebReceive"; *)
						QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Status:2=-1)
						If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
							
						Else 
							$_bo_WebServerActive:=False:C215
						End if 
						
				End case 
				DM_l_ResetModuleID:=0
			Else 
				//its not currently loaded
				DM_l_ResetModuleID:=0
			End if 
		End if 
		For ($_l_Index; 1; Size of array:C274(DM_al_NextTime))
			If (Not:C34($_bo_WebServerActive))
				DM_al_NextTime{$_l_Index}:=DM_SetNextTime(DM_ad_LastDate{$_l_Index}; DM_al_LastTime{$_l_Index}; DM_al_Frequency{$_l_Index}; DM_at_FREQUENCYTYPE{$_l_Index})
			Else 
				$_l_Index:=Size of array:C274(DM_al_NextTime)
			End if 
		End for 
		
		SORT ARRAY:C229(DM_al_NextTime; DM_al_Frequency; DM_at_FREQUENCYTYPE; DM_ad_LastDate; DM_al_LastTime; DM_al_ModuleID; DM_al_ModuleType)
		
	End if 
	
	DelayTicks(1*60)
	
Until (<>SYS_bo_QuitCalled) | (OK=0) | ((Size of array:C274(DM_al_NextTime)=0) & (Not:C34($_bo_WebServerActive)))
<>DM_l_RetrieveManagerProcessID:=0
ERR_MethodTrackerReturn("DM_DataretreiveManager"; $_t_oldMethodName)