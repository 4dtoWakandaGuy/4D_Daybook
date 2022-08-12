//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_BKGetDBContactCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKAssModel1IDS;0)
	//ARRAY LONGINT(DM_al_BKDataDefaults;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK)
	C_LONGINT:C283($_l_DataModelID; $_l_Delay; $_l_ItemID; $_l_ModelPosition; $_l_offset; $_l_Repeats; $1; $2; DM_l_BKDataModelID; DM_l_BKOptions; DM_l_BKRetrieveType)
	C_REAL:C285($5)
	C_TEXT:C284($_t_BKQuery; $_t_oldMethodName; $0; $3; $4; $BK_t_BKCONTEXT; DM_t_BKFileName; DM_t_CompanyCode; DM_t_DBContactCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_BKGetDBContactCode")
//$0:=$3
ARRAY LONGINT:C221(DM_al_DataSources; 0)
ARRAY TEXT:C222(DM_at_DataSources; 0)
$_l_ItemID:=PREF_GetPreferenceID("Business Kit")
If ($1=$_l_ItemID)  //just to be carefull
	//need to know where to get the data from
	$_l_offset:=0
	While (Semaphore:C143("LoadingDataModelPrefs"))
		DelayTicks(2)
	End while 
	GOTO RECORD:C242([PREFERENCES:116]; $2)
	DM_BKConnectionBLobtovariables
	//we need to now go to the data model and if it is orders
	$_bo_Continue:=True:C214
	If (DM_l_BKDataModelID>0)
		$_l_ItemID:=PREF_GetPreferenceID("Data Model Names")
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		//here use a Check_Locked
		If (Records in selection:C76([PREFERENCES:116])>0)
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
		End if 
		If (Records in selection:C76([PREFERENCES:116])=0)
			//add the the preferences list here
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
			[PREFERENCES:116]Pref_OwnerID:4:=-2
			DB_SaveRecord(->[PREFERENCES:116])
		End if   //this will be ONE record
		DM_BKDataModelBlobtoVariables
		
		$_bo_Continue:=False:C215
		//get that data model
		QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=DM_l_BKDataModelID)
		$BK_t_BKCONTEXT:=[EW_BK_FieldMap:121]BKTableName:6
		Case of 
			: ($BK_t_BKCONTEXT="ODR")
				$_l_ModelPosition:=Find in array:C230(DM_al_BKModelIDS; DM_l_BKDataModelID)
				If ($_l_ModelPosition>0)
					$_bo_Continue:=True:C214
					$_l_DataModelID:=DM_al_BKAssModel1IDS{$_l_ModelPosition}
				End if 
				
			: ($BK_t_BKCONTEXT="ITM")
				// $0:="ERROR"
				SET PROCESS VARIABLE:C370($5; DM_t_DBContactCode; "ERROR")
			: ($BK_t_BKCONTEXT="CUS")
				$_bo_Continue:=True:C214
				$_l_DataModelID:=DM_l_BKDataModelID
			Else 
				// $0:="ERROR"
				SET PROCESS VARIABLE:C370($5; DM_t_DBContactCode; "ERROR")
		End case 
		
	Else 
		//$0:="ERROR"
		SET PROCESS VARIABLE:C370($5; DM_t_DBContactCode; "ERROR")
	End if 
	CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
	
	If ($_bo_Continue)
		//data model defined
		DM_t_BKFileName:="CUSTEMP"
		DM_l_BKDataModelID:=$_l_DataModelID
		DM_l_BKRetrieveType:=5
		//this sets the defaults to use
		$_l_ModelPosition:=Find in array:C230(DM_al_BKModelIDS; $_l_DataModelID)
		DM_l_BKOptions:=DM_al_BKDataDefaults{$_l_ModelPosition}
		
		//the options need to be attachable to the
		//build the query string here
		$_t_BKQuery:="*cuscode="+$3
		DM_t_CompanyCode:=$4
		DM_GetBKData((Record number:C243([PREFERENCES:116])); $_t_BKQuery; ->DM_t_DBContactCode; ->DM_t_CompanyCode)
		
		//$0:=DM_t_DBContactCode
		SET PROCESS VARIABLE:C370($5; DM_t_CompanyCode; DM_t_CompanyCode)
		SET PROCESS VARIABLE:C370($5; DM_t_DBContactCode; DM_t_DBContactCode)
		
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DM_BKGetDBContactCode"; $_t_oldMethodName)