//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_BKGetDBProductCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ITM_abo_Detail_Boolean;0;0)
	//ARRAY BOOLEAN(ITM_abo_Header;0)
	//ARRAY DATE(ITM_ad_Detail_Date;0;0)
	//ARRAY DATE(ITM_ad_Header_Date;0)
	//ARRAY INTEGER(ITM_ai_Detail_Integer;0;0)
	//ARRAY INTEGER(ITM_al_Header_Integer;0)
	ARRAY LONGINT:C221($_al_DataSources; 0)
	//ARRAY LONGINT(DM_al_BKAssModel2IDS;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(ITM_al_Detail_Fields;0)
	//ARRAY LONGINT(ITM_al_Detail_Longint;0;0)
	//ARRAY LONGINT(ITM_al_Detail_SFieldType;0)
	//ARRAY LONGINT(ITM_al_Header_Fields;0)
	//ARRAY LONGINT(ITM_al_Header_Longint;0)
	//ARRAY LONGINT(ITM_al_Header_SFieldType;0)
	//ARRAY REAL(ITM_ar_Detail_Real;0;0)
	//ARRAY REAL(ITM_ar_Header_Real;0)
	ARRAY TEXT:C222($_at_DataSources; 0)
	//ARRAY TEXT(IITM_at_DetailStrings;0;0)
	//ARRAY TEXT(ITM_at_Detail_Text;0;0)
	//ARRAY TEXT(ITM_at_DetailSField;0)
	//ARRAY TEXT(ITM_at_Header_Text;0)
	//ARRAY TEXT(ITM_at_HeaderSField;0)
	//ARRAY TEXT(ITM_at_HeaderStrings;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK)
	C_LONGINT:C283($_l_DataModelID; $_l_Delay; $_l_ItemID; $_l_ListID; $_l_ModelPosition; $_l_offset; $_l_Repeats; $_l_SourcePosition; $1; $2; DM_l_BKDataModelID)
	C_LONGINT:C283(DM_l_BKOptions; DM_l_BKRetrieveType; DM_l_DestinationContext)
	C_REAL:C285($5)
	C_TEXT:C284($_t_BKQuery; $_t_oldMethodName; $0; $3; $4; $BK_t_BKCONTEXT; DM_t_BKFileName; DM_t_DBProduct; DM_t_DBProductCode; DM_t_rProductCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_BKGetDBProductCode")
ARRAY LONGINT:C221($_al_DataSources; 0)
ARRAY TEXT:C222($_at_DataSources; 0)
$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->$_at_DataSources; ->$_al_DataSources)
$_l_SourcePosition:=Find in array:C230($_at_DataSources; "Business Kit")
If ($_l_SourcePosition<0)
	$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Business Kit")
	
Else 
	$_l_ItemID:=$_al_DataSources{$_l_SourcePosition}
End if 

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
					$_l_DataModelID:=DM_al_BKAssModel2IDS{$_l_ModelPosition}
				End if 
				
			: ($BK_t_BKCONTEXT="ITM")
				$0:="ERROR"
			: ($BK_t_BKCONTEXT="CUS")
				$_bo_Continue:=True:C214
				$_l_DataModelID:=DM_l_BKDataModelID
			Else 
				SET PROCESS VARIABLE:C370($5; DM_t_rProductCode; "ERROR")
		End case 
		
	Else 
		SET PROCESS VARIABLE:C370($5; DM_t_rProductCode; "ERROR")
		
	End if 
	CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
	
	If ($_bo_Continue)
		//data model defined
		DM_t_BKFileName:="ITMTEMP"
		DM_l_BKDataModelID:=$_l_DataModelID
		DM_l_BKRetrieveType:=5
		DM_l_BKOptions:=0
		DM_t_DBProduct:=""
		//the options need to be attachable to the
		//build the query string here
		If ($3#"")
			$_t_BKQuery:="*C01="+$3
			
			DM_GetBKData((Record number:C243([PREFERENCES:116])); $_t_BKQuery; ->DM_t_DBProductCode)
		Else 
			If ($4#"")
				//this is a non-item such as delivery....
				//so there is no point in going back to the business kit
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=$4)
				If (Records in selection:C76([PRODUCTS:9])=1)  //it should do
					DM_t_DBProductCode:=[PRODUCTS:9]Product_Code:1
				Else 
					//no product
					//   so create it`
					ARRAY LONGINT:C221(ITM_al_Header_Fields; 1)
					ARRAY TEXT:C222(ITM_at_HeaderSField; 1)
					ARRAY LONGINT:C221(ITM_al_Header_SFieldType; 1)
					ARRAY TEXT:C222(ITM_at_HeaderStrings; 1)
					ARRAY INTEGER:C220(ITM_al_Header_Integer; 1)
					ARRAY LONGINT:C221(ITM_al_Header_Longint; 1)
					ARRAY REAL:C219(ITM_ar_Header_Real; 1)
					ARRAY DATE:C224(ITM_ad_Header_Date; 1)
					ARRAY BOOLEAN:C223(ITM_abo_Header; 1)
					ARRAY TEXT:C222(ITM_at_Header_Text; 1)
					ITM_al_Header_Fields{1}:=Field:C253(->[PRODUCTS:9]Product_Name:2)
					ITM_at_HeaderSField{1}:=$4
					ITM_at_Header_Text{1}:=$4
					ITM_al_Header_SFieldType{1}:=Is text:K8:3
					
					//the following are not currently used
					ARRAY LONGINT:C221(ITM_al_Detail_Fields; 0)
					ARRAY TEXT:C222(ITM_at_DetailSField; 0)
					ARRAY LONGINT:C221(ITM_al_Detail_SFieldType; 0)
					ARRAY TEXT:C222(IITM_at_DetailStrings; 0; 0)
					ARRAY INTEGER:C220(ITM_ai_Detail_Integer; 0; 0)
					ARRAY LONGINT:C221(ITM_al_Detail_Longint; 0; 0)
					ARRAY REAL:C219(ITM_ar_Detail_Real; 0; 0)
					ARRAY DATE:C224(ITM_ad_Detail_Date; 0; 0)
					ARRAY BOOLEAN:C223(ITM_abo_Detail_Boolean; 0; 0)
					ARRAY TEXT:C222(ITM_at_Detail_Text; 0; 0)
					DM_t_DBProductCode:=""
					DM_l_DestinationContext:=Table:C252(->[PRODUCTS:9])
					$_bo_OK:=DM_Validate((Record number:C243([PREFERENCES:116])); DM_l_DestinationContext; 0; DM_l_BKOptions; "Header"; "Detail"; ->DM_t_DBProductCode)
					
				End if 
				
			Else 
				//not product name either!!!!
				DM_t_DBProduct:="Unknown"
			End if 
			
		End if 
		SET PROCESS VARIABLE:C370($5; DM_t_rProductCode; DM_t_DBProductCode)
		
		
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("DM_BKGetDBProductCode"; $_t_oldMethodName)