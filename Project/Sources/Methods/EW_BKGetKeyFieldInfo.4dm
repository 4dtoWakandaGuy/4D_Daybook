//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_BKGetKeyFieldInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Data; 0)
	ARRAY TEXT:C222($_at_Header; 0)
	//ARRAY TEXT(EW_at_BKCodes;0)
	//ARRAY TEXT(EW_at_CombinedCodes;0)
	//ARRAY TEXT(EW_at_DaybookCodes;0)
	//ARRAY TEXT(EW_at_FieldLabels;0)
	//ARRAY TEXT(EW_at_FieldNames;0)
	C_LONGINT:C283($_l_CountRecords; $_l_Duration; $_l_Index; $_l_Number; $_l_Port; $_l_Result; $_l_Timeout)
	C_TEXT:C284($_t_Category; $_t_CO1; $_t_IPAddress; $_t_Label; $_t_Module; $_t_oldMethodName; $_t_Password; $_t_Pathname; $_t_Result; $_t_Store; $_t_Text)
	C_TEXT:C284($1; $t_pathnamepic; $t_query; $t_text)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_BKGetKeyFieldInfo")
// EW_BKGetKeyfieldInfo
// 04/09/03 pb
// Queries the BK for Cust or Item records
// and creates two arrays:
// EW_at_BKCodes is the BK key fields
// EW_at_DaybookCodes is the Daybook key fields
// E.g., for Items: C01 and Product Code
// Parameters:
//     $1 = ITM or CUS - Items or Customers

ARRAY TEXT:C222(EW_at_BKCodes; 0)
ARRAY TEXT:C222(EW_at_DaybookCodes; 0)
ARRAY TEXT:C222(EW_at_CombinedCodes; 0)  // BK code + Daybook code
ARRAY TEXT:C222(EW_at_FieldNames; 0)  // the actual field names, e.g. L01
ARRAY TEXT:C222(EW_at_FieldLabels; 0)  // the labels that have been set up

$_t_Module:=$1  // item or customer details
$t_query:="*ALL"  //* will give the number of records
//4DBKC_ToolsData ("INIT")
$_l_Number:=1
$_t_Pathname:="temp"+String:C10($_l_Number)+".txt"  //the data will be here
While (Test path name:C476($_t_Pathname)=Is a document:K24:1)
	$_l_Number:=$_l_Number+1
	$_t_Pathname:="temp"+String:C10($_l_Number)+".txt"  //the data will be here
End while 
//launch the request
$_t_Result:=""
//$_t_Result:=4DBKC_ImportFileFrom4DBK ([EW_ExportProjects]BKIPAddress;[EW_ExportProjects]BKServerPort;[EW_ExportProjects]BKTimeout;[EW_ExportProjects]BKMaxDuration;[EW_ExportProjects]BKPassword;[EW_ExportProjects]BKStoreCode;$_t_Module;"*ALL";$_t_Pathname)
$_l_CountRecords:=Num:C11($_t_Result)  //number of items retrieved

If ($_l_CountRecords=0)
	// create a bogus record so that we can get the field headers
	$_ti_DocumentRef:=DB_CreateDocument($_t_Pathname)
	If ([EW_ExportProjects:117]BKDataModel:35#"")
		$_t_Text:="[C01,"+[EW_ExportProjects:117]BKDataModel:35+"]"+Char:C90(9)+"[StActive]"+Char:C90(9)+Char:C90(13)
	Else 
		$_t_Text:="[C01,Standard]"+Char:C90(9)+"[StActive]"+Char:C90(9)+Char:C90(13)
	End if 
	$_t_Text:=$_t_Text+"Bogus"+Char:C90(9)+"0"+Char:C90(9)+"Bogus"+Char:C90(13)
	SEND PACKET:C103($_ti_DocumentRef; $_t_Text)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	$_t_IPAddress:=[EW_ExportProjects:117]BKIPAddress:22
	$_l_Port:=[EW_ExportProjects:117]BKServerPort:23
	$_l_Timeout:=[EW_ExportProjects:117]BKTimeout:30
	$_l_Duration:=[EW_ExportProjects:117]BKMaxDuration:31
	$_t_Password:=[EW_ExportProjects:117]BKPassword:32
	$_t_Store:=[EW_ExportProjects:117]BKStoreCode:24
	$_l_Result:=0
	//$_l_Result:=4DBKC_ExportFileTo4DBK ($_t_IPAddress;$_l_Port;$_l_Timeout;$_l_Duration;$_t_Password;$_t_Store;EW_t_ModuleName;"";$_t_Pathname)
	DELETE DOCUMENT:C159($_t_Pathname)
	$_t_Result:=""
	//$_t_Result:=4DBKC_ImportFileFrom4DBK ([EW_ExportProjects]BKIPAddress;[EW_ExportProjects]BKServerPort;[EW_ExportProjects]BKTimeout;[EW_ExportProjects]BKMaxDuration;[EW_ExportProjects]BKPassword;[EW_ExportProjects]BKStoreCode;$_t_Module;"*ALL";$_t_Pathname)
	$_l_CountRecords:=Num:C11($_t_Result)  //number of items retrieved
End if 

//  $0:=0
If ($_t_Result#"[err@")
	If ($_l_CountRecords>0)
		$_t_Result:=""
		//$_t_Result:=4DBKC_ToolsData ("Open_DocUMENT";$_t_Pathname)
		ARRAY TEXT:C222(EW_at_BKCodes; $_l_CountRecords)
		ARRAY TEXT:C222(EW_at_DaybookCodes; $_l_CountRecords)
		ARRAY TEXT:C222(EW_at_CombinedCodes; $_l_CountRecords)  // BK code + Daybook code
		//opening of file received
		If ($_t_Result="")
			//retrieval of the name of the fields
			ARRAY TEXT:C222($_at_Header; 0)
			$_t_Result:=""
			//$_t_Result:=EW_4dBKC_ToolsData ("GET DATA HEADER";$_t_Pathname;->$_at_Header)
		End if 
		
		If ($_t_Result="")
			
			//retrieval of each record
			//$i_i:=1
			//$i_n:=$_l_CountRecords
			ARRAY TEXT:C222($_at_Data; 0)  //values of each field
			//     While ($_t_Result="")
			For ($_l_Index; 1; $_l_CountRecords)
				$_t_Result:=""
				//$_t_Result:=EW_4dBKC_ToolsData ("GET DATA";$_t_Pathname;->$_at_Data)
				If ($_t_Result="")
					//the "$_at_Header" array contains the name of the fields
					//the "$_at_Data" array contains the values of the fields
					If ($1="itm")  // items
						//EW_at_BKCodes{$_l_Index}:=4DBKC_ToolsData ("GET FIELD";"[C01]";->$_at_Header;->$_at_Data)  ` Items table key field
						//EW_at_DaybookCodes{$_l_Index}:=4DBKC_ToolsData ("GET FIELD";"[C04]";->$_at_Header;->$_at_Data)  ` this is the daybook product code
						//EW_atCombinedCodes{$_l_Index}:=EW_at_BKCodes{$_l_Index}+"/"+EW_at_DaybookCodes{$_l_Index}
					Else   // customers
						//EW_at_BKCodes{$_l_Index}:=4DBKC_ToolsData ("GET FIELD";"[CusCode]";->$_at_Header;->$_at_Data)  ` Customer table key field
						//EW_at_DaybookCodes{$_l_Index}:=4DBKC_ToolsData ("GET FIELD";"[CusPersoA1]";->$_at_Header;->$_at_Data)  ` this is the daybook contact Code
					End if 
				End if 
			End for 
		End if 
	End if 
End if 
//close the document
$_t_Result:=""
//$_t_Result:=4DBKC_ToolsData ("Close DocUMENT";$_t_Pathname)
DELETE DOCUMENT:C159($_t_Pathname)
ERR_MethodTrackerReturn("EW_BKGetKeyFieldInfo"; $_t_oldMethodName)