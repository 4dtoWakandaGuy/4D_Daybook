//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_PDFs
	//------------------ Method Notes ------------------
	// PlugCall_PDFs
	// modified 13/03/04 pb for new Mac OSX stuff
	// parameters: $1 = the action to take
	//                     $2 = pointer to current printer name variable
	//                     $3 = pointer to current printer type variable
	//                     $4 = pointer to current printer zone variable
	//                     $5 = pointer to current printer driver variable
	//                     $6 = default file name (added 03/04/04 pb) (optional)
	
	// Returns 0 if not OK, 1 if OK
	//TRACE
	
	// Example call: $pOK:=PLUGCALL_PDFs ("GetPrinter";->PDF_t_CURPName;->PDF_t_CURPType;->PDF_t_CURPZone;->PDF_t_CURPDriver;$_t_Path)
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>iOS; $_l_Platform; $0)
	C_POINTER:C301($2; $3; $4; $5)
	C_TEXT:C284($_t_DocumentOutputPath; $_t_oldMethodName; $_t_PlugInDocPath; $1; $6)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_PDFs")

<>iOS:=Int:C8(Num:C11(DB_GetVersionNum(DBGetOSVersion)))

$0:=0
If (Count parameters:C259>5)  // 03/04/04 pb
	$_t_PlugInDocPath:=$6
Else 
	$_t_PlugInDocPath:=""
End if 


Case of 
	: ($1="CheckAvailable") & (<>iOS=10)  // Mac OSX 13/03/04
		$0:=1
	: ($1="CheckAvailable")
		//_O_PLATFORM PROPERTIES($_l_Platform;$SystemVersion;$Machinetype)
		Get_PlatformProperty("Platform"; ->$_l_Platform)
		If (($_l_Platform<1) | (3<$_l_Platform))
			//$0:=PD_IsAvailable
		Else 
			Case of 
				: ($_l_Platform=2)
					$0:=995
			End case 
		End if 
	: ($1="GetPrinter")  // Get Current printer
		If (Is macOS:C1572)
			$2->:=Get current printer:C788
			// the other 3 parameters don't seem to be used anywhere ...
		Else 
			$2->:=Get current printer:C788
		End if 
		
	: ($1="GETPATH")
		If (($_l_Platform<1) | (3<$_l_Platform))
			If (<>iOS<10)  // Windows or Mac OS9
				If (Count parameters:C259=2)
					//$0:=PD_GetPath ($2->;"Name the PDF";"")
				Else 
					//$0:=PD_GetPath ($2->;"Name the PDF";$3->)
				End if 
			Else   // OSX
				
				If ($_t_PlugInDocPath="")
					$_ti_DocumentRef:=DB_CreateDocument("")
					$_t_PlugInDocPath:=document
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					DELETE DOCUMENT:C159(document)
				Else 
					$_t_PlugInDocPath:=Get 4D folder:C485+$_t_PlugInDocPath
				End if 
				If ($_t_PlugInDocPath#"@.pdf")
					$_t_PlugInDocPath:=$_t_PlugInDocPath+".PDF"
				End if 
				If (Test path name:C476($_t_PlugInDocPath)=Is a document:K24:1)
					DELETE DOCUMENT:C159($_t_PlugInDocPath)
				End if 
			End if 
			If (OK=1)
				$2->:=$_t_PlugInDocPath
				$0:=1
				SET PRINT OPTION:C733(Destination option:K47:7; 3; $_t_PlugInDocPath)
			Else 
				$2->:=""
				$0:=0
			End if 
		Else 
			Doc_InitPrintPreferences
			$0:=0
			Reports_InternalPrefsLoad
			//``
			If ((Test path name:C476($_t_DocumentOutputPath)#Is a folder:K24:2) | ($_t_DocumentOutputPath=""))
				
				If (Is macOS:C1572)
					//If (Application type=4D Client )
					//$_t_DocumentOutputPath:=PathFromPathName (Application file)
					//Else
					//$_t_DocumentOutputPath:=PathFromPathName (Structure file)
					//End if
					$_t_DocumentOutputPath:=DB_GetDocumentPath
					$_t_DocumentOutputPath:=$_t_DocumentOutputPath+"Daybook_PDFs:"
				Else 
					//********************** kmw 29/10/08 v631b120c - changed to use the document folder like it does in other parts of the code - just must have been missed in this place *****************************************
					//If (Application type=4D Client )
					//$_t_DocumentOutputPath:=PDF995_filePathToDirPath (Application file)
					//Else
					//$_t_DocumentOutputPath:=PDF995_filePathToDirPath (Structure file)
					//End if
					$_t_DocumentOutputPath:=DB_GetDocumentPath
					//********************************************************************************************************************************************************************************************************
					$_t_DocumentOutputPath:=$_t_DocumentOutputPath+"Daybook_PDFs\\"
					
				End if 
				
				If (Test path name:C476($_t_DocumentOutputPath)#Is a folder:K24:2)
					CREATE FOLDER:C475($_t_DocumentOutputPath)
				End if 
			End if 
			If ($_t_PlugInDocPath="")
				$_ti_DocumentRef:=DB_CreateDocument("")
				$_t_PlugInDocPath:=document
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				DELETE DOCUMENT:C159(document)
			Else 
				$_t_PlugInDocPath:=$_t_DocumentOutputPath+$_t_PlugInDocPath
			End if 
			If ($_t_PlugInDocPath#"@.pdf")
				$_t_PlugInDocPath:=$_t_PlugInDocPath+".PDF"
			End if 
			If (Test path name:C476($_t_PlugInDocPath)=Is a document:K24:1)
				DELETE DOCUMENT:C159($_t_PlugInDocPath)
			End if 
			
			$3->:=$_t_PlugInDocPath
			$2->:=$_t_DocumentOutputPath
			
		End if   //
		
	: ($1="Define")
		If (<>iOS<10)  // Windows or Mac OS9
			//$0:=PD_Define ($2->;0)
		Else   // OSX
		End if 
		
	: ($1="SetPrinter")
		If (($_l_Platform<1) | (3<$_l_Platform))
			If (<>iOS<10)  // Windows or Mac OS9
				//$0:=PD_SetPrinter ($2->;$3->;$4->;$5->)
			Else 
				//SET CURRENT PRINTER($2->)
			End if 
		Else 
			SET PRINT OPTION:C733(Destination option:K47:7; 0)
			
		End if 
		
End case 
ERR_MethodTrackerReturn("PLUGCALL_PDFs"; $_t_oldMethodName)
