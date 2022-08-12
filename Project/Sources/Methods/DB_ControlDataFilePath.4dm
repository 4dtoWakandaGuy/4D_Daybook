//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ControlDataFilePath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/02/2013 12:33
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CheckSwitchDataFiles; $0)
	C_LONGINT:C283($_l_NewProcessess)
	C_TEXT:C284($_t_ApplicationPath; $_t_CurrentDataPath; $_t_DataFileName; $_t_LastDataFilePath; $_t_oldMethodName; $_t_OutputFolderDocument; $_t_OutputFolderPath; $_t_Path; $_t_StructureName; $_t_TakeOff)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ControlDataFilePath")

//if this is a compiled unlimited desktop app the data demo data file will be embedded in the structure folder. That is set in the build project
//We will look to see if there is a known datafile path stored.
//if there is not then this is the first build they have had and we will move the embedded datafile out of the structure and store the new location
//if there is a data file path we will now switch data files to the correct one(this might mean log out and back in
$0:=True:C214
Case of 
	: (Application type:C494=4D Volume desktop:K5:2)
		
		$_t_CurrentDataPath:=Data file:C490
		$_t_ApplicationPath:=Application file:C491
		$_t_StructureName:=FileNamefromPath($_t_ApplicationPath)
		$_t_DataFileName:=FileNamefromPath($_t_CurrentDataPath)
		$_t_TakeOff:=Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Database"+Folder separator:K24:12+$_t_StructureName
		$_bo_CheckSwitchDataFiles:=False:C215
		$_t_ApplicationPath:=Replace string:C233($_t_ApplicationPath; $_t_TakeOff; "")
		If (Position:C15($_t_ApplicationPath; $_t_CurrentDataPath)>0)
			$0:=True:C214
			$_bo_CheckSwitchDataFiles:=True:C214
			//Here we do not need to restart unless this is an already existing data
		End if 
		If ($_bo_CheckSwitchDataFiles)
			//$_t_OutputFolderPath:=Documents folder
			$_t_OutputFolderPath:=DB_GetDocumentPath
			$_t_OutputFolderDocument:=$_t_OutputFolderPath+"DaybookDataLocation.txt"
			If (Not:C34(Is a document:K24:1=Test path name:C476($_t_OutputFolderDocument)))
				
				$_ti_DocumentRef:=Create document:C266($_t_OutputFolderDocument; "TEXT")
				//in this case it is not a new data file.
				
				$_t_Path:=Select folder:C670("Select the location to store Daybook data"; DB_GetDocumentPath)
				//$_t_OutputFolderDocument)
				
				MOVE DOCUMENT:C540($_t_CurrentDataPath; $_t_Path+$_t_DataFileName)
				SEND PACKET:C103($_ti_DocumentRef; $_t_Path+$_t_DataFileName)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				SET DOCUMENT PROPERTIES:C478(document; False:C215; True:C214; Current date:C33; Current time:C178; Current date:C33; Current time:C178)
			Else 
				$_ti_DocumentRef:=Open document:C264($_t_OutputFolderDocument; "TEXT")
				RECEIVE PACKET:C104($_ti_DocumentRef; $_t_LastDataFilePath; 32000)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				If ($_t_LastDataFilePath#$_t_CurrentDataPath)
					
					$0:=False:C215
					If (Count parameters:C259>=1)
						OPEN DATA FILE:C312($_t_LastDataFilePath)
					Else 
						//Remember we ARE only here because the default path was to the dummy"
						$_l_NewProcessess:=New process:C317("DB_ResetDataFilePath"; 64000; "Restart Database")
					End if 
				End if 
			End if 
			
		Else 
			
		End if 
	: (Application type:C494=4D Server:K5:6)
		
		$_t_CurrentDataPath:=Data file:C490
		$_t_ApplicationPath:=Application file:C491
		$_t_OutputFolderPath:=DB_GetDocumentPath
		$_t_OutputFolderDocument:=$_t_OutputFolderPath+"DaybookDataLocation.txt"
		If (Not:C34(Is a document:K24:1=Test path name:C476($_t_OutputFolderDocument)))
			
			$_ti_DocumentRef:=Create document:C266($_t_OutputFolderDocument; "TEXT")
			//in this case it is not a new data file.
			SEND PACKET:C103($_ti_DocumentRef; $_t_CurrentDataPath)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			SET DOCUMENT PROPERTIES:C478(document; False:C215; True:C214; Current date:C33; Current time:C178; Current date:C33; Current time:C178)
		Else 
			//Set the xml keys and for a .4DC(4dbase) structure as well
			$_ti_DocumentRef:=Open document:C264($_t_OutputFolderDocument; "TEXT")
			RECEIVE PACKET:C104($_ti_DocumentRef; $_t_LastDataFilePath; 32000)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			If ($_t_LastDataFilePath#$_t_CurrentDataPath)
				$0:=False:C215
				If (Count parameters:C259>=1)
					OPEN DATA FILE:C312($_t_LastDataFilePath)
				Else 
					Gen_Confirm("Do you want to open the last opened data file? ("+$_t_LastDataFilePath+")")
					If (OK=1)
						//TRACE
						$_l_NewProcessess:=New process:C317("DB_ResetDataFilePath"; 64000; "Restart Database")
						
					Else 
						
						
						SET DOCUMENT PROPERTIES:C478(document; False:C215; False:C215; Current date:C33; Current time:C178; Current date:C33; Current time:C178)
						// old version says SET DOCUMENT PROPERTIES($_t_OutputFolderDocument;True;True;Current date;Current time;Current date;Current time)
						//Test this  /// note that on the other version this code is disabled
						
						
						$0:=True:C214
						$_ti_DocumentRef:=Create document:C266($_t_OutputFolderDocument; "TEXT")
						SEND PACKET:C103($_ti_DocumentRef; $_t_CurrentDataPath)
						CLOSE DOCUMENT:C267($_ti_DocumentRef)
						SET DOCUMENT PROPERTIES:C478(document; False:C215; True:C214; Current date:C33; Current time:C178; Current date:C33; Current time:C178)
					End if 
				End if 
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("DB_ControlDataFilePath"; $_t_oldMethodName)