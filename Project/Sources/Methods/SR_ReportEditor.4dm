//%attributes = {}
If (False:C215)
	//Project Method Name:      SR_ReportEditor
	//------------------ Method Notes ------------------
	//GP:   SR_ReportEditor(fileNo:L{;docName:S;options:L;diskFile:S...
	//         ;screenWidth:L;screenHeight:L}) -> areaRef:L
	//LM:  6/16/98, v2.0
	
	//NOTE:  This routine requires 4D v6 as it uses native bit operators
	
	//$0:  area referece
	//$1:  fileNumber used as primary file
	//$2:  desired report template (optional)
	//$3:  SR Pro options (optional)
	//$4:  diskFile -- if you select "Print Print Disk" (optional)
	//$5:  Screen Width (optional)
	//$6:  Screen Height (optional)
	
	//SR Pro Options:
	// • - option not supported (compatability with original SuperReport)
	
	//SR Pro Options:    Items above 2048 are added for SR Pro
	
	//       0 - don't display editor
	//       1 - display editor
	//       2 - disable print options (disk, preview and printer)
	//       4 - disable editor (not supported in this version) (•)
	//       8 - use larger window (window will default to size of monitor) (•)
	//     16 - disable new, open, load and save options
	//     32 - disable scripts submenu
	//     64 - disable file selection and search/sort options
	//   128 - disable prompt (•)
	//   256 - save with replace (•)
	//   512 - use standard window (•)
	// 1024 - Supress job setup
	// 2048 - change font/size popup (•)
	
	// 4096 - Print Preview
	// 8192 - Print to Disk
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 16:23`Method: SR_ReportEditor
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR Doc 2 Report)
	//C_UNKNOWN(SR Load Report)
	//C_UNKNOWN(SR Menu Item)
	//C_UNKNOWN(SR Options)
	//C_UNKNOWN(SR Preview)
	//C_UNKNOWN(SR Print Disk)
	//C_UNKNOWN(SR Set Area)
	//C_UNKNOWN(SR Validate)
	//C_UNKNOWN(SR Variables)
	//C_UNKNOWN(SR_GetLongProperty)
	//C_UNKNOWN(SR_NewReport)
	//C_UNKNOWN(SR_Print)
	//C_UNKNOWN(SR_SaveReport)
	//C_UNKNOWN(SR_SetLongProperty)
	//ARRAY TEXT(SR_at_SRVarSettings;0)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>SRP262; $_bo_Continue)
	C_DATE:C307(SRDate)
	C_LONGINT:C283($_l_CountParameters; $_l_CurrentWinRefOLD; $_l_Error; $_l_PrintOptions; $_l_ScreenHeight; $_l_ScreenWidth; $_l_Sections; $_l_SRError; $_l_WindowReference; $0; $1)
	C_LONGINT:C283($3; $5; $6; SR_l_Options; SR_l_TableNumber; SR_l_Window; SRPage; SRRecord; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_PICTURE:C286(SR_Pic_ReportData)
	C_POINTER:C301($_ptr_Hold; $_ptr_SRData)
	C_TEXT:C284($_t_ErrorMethodName; $_t_ExportDocument; $_t_oldMethodName; $_t_WindowTitle; $2; $4; SR_t_DocumentPath; SR_t_ReportDataXML)
	C_TIME:C306($_ti_SRDocumentRef; SRTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR_ReportEditor")

$_l_CountParameters:=Count parameters:C259

//Create SuperReport Pro Variable Items
ARRAY TEXT:C222(SR_at_SRVarSettings; 5)
SR_at_SRVarSettings{1}:="1;Variables"
SR_at_SRVarSettings{2}:="1;Report Date;SRDate;1"
SR_at_SRVarSettings{3}:="1;Report Time;SRTime;1"
SR_at_SRVarSettings{4}:="1;Page Number;SRPage;1"
SR_at_SRVarSettings{5}:="1;Record No.;SRRecord;1"

SR_l_Window:=0  //external area handle
If ($_l_CountParameters>0)
	SR_l_TableNumber:=$1
Else 
	SR_l_TableNumber:=0
End if 

SR_t_DocumentPath:=""  //default to new report
If ($_l_CountParameters>=2)
	SR_t_DocumentPath:=$2
End if 

SR_l_Options:=1  //default to displaying editor only
If ($_l_CountParameters>=3)
	SR_l_Options:=$3
End if 


$_t_ExportDocument:=""
If (Count parameters:C259=4)
	$_t_ExportDocument:=$4
End if 

$_l_ScreenWidth:=Screen width:C187
$_l_ScreenHeight:=Screen height:C188
If (Count parameters:C259=6)  //use the defined screen width / screen height
	$_l_ScreenWidth:=$5
	$_l_ScreenHeight:=$6
End if 

$_bo_Continue:=True:C214  //default to continuing, we'll handle it from here
If (SR_t_DocumentPath="")
	If (<>SRP262)
		$_ptr_SRData:=->SR_blb_ReportDataBLOB
	Else 
		$_ptr_SRData:=->SR_t_ReportDataXML
	End if 
	//$_l_SRError:=SR New Report ($_ptr_SRReport->)  //create a new report
	$_l_SRError:=SR_NewReport($_ptr_SRData->; $_ptr_SRData->; 0)
	//SR_NewReport
Else 
	If (Test path name:C476(SR_t_DocumentPath)=-43)  //we can't find the report, go look for it
		$_ti_SRDocumentRef:=DB_OpenDocument(""; "")
		CLOSE DOCUMENT:C267($_ti_SRDocumentRef)
		SR_t_DocumentPath:=Document
		//e("Select Report...")
		If (SR_t_DocumentPath="")  //we didn't select a report, don't do anything
			$_bo_Continue:=False:C215
		End if 
	End if 
End if 

If ($_bo_Continue)
	If ((SR_l_Options & 1)=1)  //make sure we wish to display the editor able
		If (Is table number valid:C999(SR_l_TableNumber))
			If (SR_t_DocumentPath="")
				
				$_t_WindowTitle:=Table name:C256(SR_l_TableNumber)+" : New Report"
			Else 
				$_t_WindowTitle:=Table name:C256(SR_l_TableNumber)+" :"  //+  `HFSShortName(SR_t_DocumentPath)
			End if 
			
			SR_l_Window:=_O_Open external window:C309(5; 45; $_l_ScreenWidth-5; $_l_ScreenHeight-5; 8; $_t_WindowTitle; "%SuperReport")
			If (SR_l_Window>0)
				If (<>SRP262)
					$_ptr_SRData:=->SR_blb_ReportDataBLOB
				Else 
					$_ptr_SRData:=->SR_t_ReportDataXML
				End if 
				$_l_SRError:=SR Variables(SR_l_Window; "SR_at_SRVarSettings")  //create variable menu
				If (SR_t_DocumentPath#"")
					$_l_SRError:=SR Load Report(SR_l_Window; SR_t_DocumentPath)  //load document name or template
					//$_l_SRError:=SR_LoadReport ($_ptr_SRReport->;$_ptr_SRReport»;0)
					$_l_Error:=SR_SaveReport(SR_l_Window; SR_t_ReportDataXML)
					$_ptr_Hold->:=SR_t_ReportDataXML
					
					//$_l_SRError:=SR Get Area (SR_l_Window;$_ptr_SRReport->)  //copy area to PICT var
					//$R:=SR_SaveReport (SR_l_Window;$_ptr_Hold->;0)
					
				End if 
				
				Case of 
					: (SR_t_DocumentPath="")  //we only need to do this if we are opening a new document
						//$_l_SRError:=SR Main Table ($_ptr_SRReport->;1;SR_l_TableNumber;"")  //set main file
						//$_l_SRError:=SR_SetLongProperty ($_ptr_Hold->;SRP_DataSource_TableID;SR_l_TableNumber)
						//$_l_SRError:=SR_SetLongProperty ($_ptr_Hold->;SRP_DataSource_Source;1)
						SR_SetLongProperty(SR_l_Window; SR_GetLongProperty(SR_l_Window; 1; SRP_Report_DataSource); SRP_DataSource_TableID; [DOCUMENTS:7]Table_Number:11)
						
						
						$_l_SRError:=SR Set Area(SR_l_Window; $_ptr_SRData->)  //update area, cotaining default settings
				End case 
				
				//Disable Print (106-108)
				If ((SR_l_Options & 2)=2)
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 106; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 107; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 108; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 109; ""; 0; 0; "")
				End if 
				
				//Handle additional SR Pro options
				If ((SR_l_Options & 16)=16)  //disable load/save menu items
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 101; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 102; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 103; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 104; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 105; ""; 0; 0; "")
				End if 
				
				//Disable Procedure hiearchical menu
				If ((SR_l_Options & 32)=32)
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 211; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 405; ""; 0; 0; "")
					$_l_SRError:=SR Options(SR_l_Window; 1; 0; -1)  //update the script button(s)
				End if 
				
				//Disable File Selection
				If ((SR_l_Options & 64)=64)
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 401; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 402; ""; 0; 0; "")
					$_l_SRError:=SR Menu Item(SR_l_Window; 2; 403; ""; 0; 0; "")
				End if 
				
			End if 
		End if 
	Else 
		If (<>SRP262)
			$_ptr_SRData:=->SR_blb_ReportDataBLOB
		Else 
			$_ptr_SRData:=->SR_Pic_ReportData
		End if 
		$_l_SRError:=SR Doc 2 Report(SR_t_DocumentPath; $_ptr_SRData->)  //load document from disk
		If ($_l_SRError=0)
			$_l_SRError:=SR Validate($_ptr_SRData->)  //update printer information
			//$_l_SRError:=SR Main Table ($_ptr_SRReport->;1;SR_l_TableNumber;"")  //set main file
			//$_l_SRError:=SR_SetLongProperty ($_ptr_SRReport->;SRP_DataSource_TableID;SR_l_TableNumber)
			//$_l_SRError:=SR_SetLongProperty ($_ptr_SRReport->;SRP_DataSource_Source;1)
			SR_SetLongProperty($_ptr_SRData->; SR_GetLongProperty($_ptr_SRData->; 1; SRP_Report_DataSource); SRP_DataSource_TableID; SR_l_TableNumber)
			
			//print preview
			If ((SR_l_Options & 4096)=4096)
				$_t_WindowTitle:=Table name:C256(SR_l_TableNumber)+" :"  //+HFSShortName(SR_t_DocumentPath)
				$_l_SRError:=SR Preview($_ptr_SRData->; 5; 45; $_l_ScreenWidth-5; $_l_ScreenHeight-5; 8; $_t_WindowTitle)
			End if 
			
			//print to disk
			If ((SR_l_Options & 8192)=8192)
				$_l_PrintOptions:=4
				$_l_Sections:=0  //print all sections
				If ($_t_ExportDocument="")
					$_l_PrintOptions:=$_l_PrintOptions+1
				End if 
				$_l_SRError:=SR Print Disk($_ptr_SRData->; $_t_ExportDocument; $_l_PrintOptions; $_l_Sections; 9; 13)
			End if 
			
			//print to printer
			If (((SR_l_Options & 4096)=0) & ((SR_l_Options & 8192)=0))  //make sure we didn't choose preview or disk
				$_l_PrintOptions:=4  //force report to use current driver
				If ((SR_l_Options & 1024)#1024)
					$_l_PrintOptions:=$_l_PrintOptions+2  //show job setup dialog
				End if 
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				
				$_l_WindowReference:=Open window:C153(5; 45; $_l_ScreenWidth-5; $_l_ScreenHeight-5; 8; SR_t_DocumentPath)  //we gotta have a window, otherwise we hosed
				WIN_l_CurrentWinRef:=$_l_WindowReference
				$_t_ErrorMethodName:=Method called on error:C704
				ON ERR CALL:C155("")
				PRINT SETTINGS:C106
				If (OK=1)
					//$_l_SRError:=SR Print Report ($_ptr_SRReport->;SRP_Print_4DPageSetup;65535)
					$_l_SRError:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
					
				Else 
					$_l_SRError:=-1
				End if 
				ON ERR CALL:C155($_t_ErrorMethodName)
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			End if 
			
		Else 
			// ALERT("An error occured loading report ["+String($_l_SRError)+"]  Please contact yo
			Gen_Alert("An error occured loading report ["+String:C10($_l_SRError)+"]  Please contact your database administrator.")
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("SR_ReportEditor"; $_t_oldMethodName)
