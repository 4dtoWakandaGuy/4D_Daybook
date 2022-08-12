If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.oLayDefintionsexport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/02/2013 14:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(LAY_bo_RecordEdited; Lay_bo_SetupEdited)
	C_LONGINT:C283($_l_ColumnIndex; $_l_ColumnIndex2; $_l_ColumnNumber; $_l_LastNumber; $_l_offset; $_l_RecordNumber; $_L_RecordNumberRow; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_TEXT:C284($_t_ColumnTitle; $_t_DocumentPath; $_t_oldMethodName; $_t_OutputFolderPath; $_t_OutputPath; $_t_QueryAdd; $_t_RefName; $_t_StructurePath; DB_t_CurrentFormUsage3; LAY_t_CurrentDefsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.oLayDefintionsexport"; Form event code:C388)
If (LAY_bo_RecordEdited=True:C214)
	//do we want to save the current loaded first
	Gen_Confirm("The current loaded column definition has been edited do you want to save it first?"; "Yes"; "No")
	If (OK=1)
		Lay_bo_SetupEdited:=True:C214
		DB_SaveRecord(->[LIST_LAYOUTS:96])
	End if 
	LAY_bo_RecordEdited:=False:C215
	$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
	$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
	$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
	$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
	If ($_L_RecordNumberRow<0)
		$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; 0)
	End if 
	LAY_al_ColumnNumber{$_L_RecordNumberRow}:=$_l_ColumnNumber
	LAY_at_ColumnTitle{$_L_RecordNumberRow}:=$_t_ColumnTitle
	LAY_al_RecordNumbers{$_L_RecordNumberRow}:=$_l_RecordNumber
	SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
	$_l_LastNumber:=0
	For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
		If (LAY_al_RecordNumbers{$_l_ColumnIndex}=0)
			LAY_al_RecordNumbers{$_l_ColumnIndex}:=1
		End if 
		If (LAY_al_ColumnNumber{$_l_ColumnIndex}=$_l_LastNumber)
			//its a clash
			If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_ColumnIndex})
				LAY_al_ColumnNumber{$_l_ColumnIndex}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+1
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
				[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
				DB_SaveRecord(->[LIST_LAYOUTS:96])
			Else 
				$_l_offset:=0
				For ($_l_ColumnIndex2; $_l_ColumnIndex; 1; -1)
					If (LAY_al_ColumnNumber{$_l_ColumnIndex2}=LAY_al_ColumnNumber{$_l_ColumnIndex})
						LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+$_l_offset
						GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
						[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
						DB_SaveRecord(->[LIST_LAYOUTS:96])
					End if 
					$_l_offset:=$_l_offset+1
				End for 
			End if 
		End if 
		$_l_LastNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
	End for 
	SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
	$_l_ColumnNumber:=0
	For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
		$_l_ColumnNumber:=$_l_ColumnIndex
		If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
			GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
			LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
			[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
			DB_SaveRecord(->[LIST_LAYOUTS:96])
			
		End if 
	End for 
	LAY_bo_RecordEdited:=False:C215
	OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
	OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
	//``````
End if 
//SET CHANNEL(11)

If (User in group:C338(Current user:C182; "Designer"))
	
	Gen_Confirm("Export as default settings?"; "No"; "Yes")
	If (OK=1)
		//TRACE
		
		$_t_QueryAdd:=""
		If (SVS_at_PreviewEvent>0)
			If (SVS_at_PreviewEvent{SVS_at_PreviewEvent}#"Default")
				Gen_Confirm("Export for "+SVS_at_PreviewEvent{SVS_at_PreviewEvent}+"?"; "Yes"; "No")
				If (OK=1)
					$_t_RefName:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
					If ($_t_RefName="Default")
						DB_t_CurrentFormUsage3:=""
						$_t_RefName:=LAY_t_CurrentDefsName
					Else 
						DB_t_CurrentFormUsage3:=$_t_RefName
						$_t_RefName:=LAY_t_CurrentDefsName+$_t_RefName
					End if 
				Else 
					DB_t_CurrentFormUsage3:=""
					$_t_RefName:=LAY_t_CurrentDefsName
					$_t_QueryAdd:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
				End if 
				
			Else 
				DB_t_CurrentFormUsage3:=""
				$_t_RefName:=LAY_t_CurrentDefsName
			End if 
		Else 
			DB_t_CurrentFormUsage3:=""
			$_t_RefName:=LAY_t_CurrentDefsName
		End if 
		$_t_OutputFolderPath:=DB_GetDocumentPath
		$_t_OutputPath:=Select folder:C670("Select a folder to store the exported configuration"; $_t_OutputFolderPath; 16)
		//TRACE
		READ WRITE:C146([LIST_LAYOUTS:96])
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_RefName+$_t_QueryAdd)
		//Create set("
		//$_ti_DocumentRef:=Create document($_t_OutputPath+$Ref+".txt";"TEXT")
		SET CHANNEL:C77(10; $_t_OutputPath+$_t_RefName+".txt")
		For ($_l_ColumnIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
			SEND RECORD:C78([LIST_LAYOUTS:96])
			NEXT RECORD:C51([LIST_LAYOUTS:96])
		End for 
		SET CHANNEL:C77(11)
		//USE SET("$Temp")
		If ($_t_QueryAdd#"")
			//APPLY TO SELECTION([LIST LAYOUTS];[LIST LAYOUTS]Layout Ref:=$_t_RefName+$_t_QueryAdd)
		End if 
		//Close DocUMENT($_ti_DocumentRef)
		
	Else 
		
		//export to preferences folder
		$_t_QueryAdd:=""
		If (SVS_at_PreviewEvent>0)
			If (SVS_at_PreviewEvent{SVS_at_PreviewEvent}#"Default")
				
				$_t_QueryAdd:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
			End if 
		End if 
		
		$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
		
		If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")=Is a folder:K24:2))
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
				CREATE FOLDER:C475($_t_StructurePath+"Resources")
			End if 
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")=Is a folder:K24:2))
				CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")
			End if 
		End if 
		$_t_DocumentPath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS"+Folder separator:K24:12+LAY_t_CurrentDefsName+".txt"
		READ WRITE:C146([LIST_LAYOUTS:96])
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=LAY_t_CurrentDefsName+$_t_QueryAdd)
		CREATE SET:C116([LIST_LAYOUTS:96]; "$Temp")
		If ($_t_QueryAdd#"")
			APPLY TO SELECTION:C70([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1:=LAY_t_CurrentDefsName)
		End if 
		SET CHANNEL:C77(10; $_t_DocumentPath)
		FIRST RECORD:C50([LIST_LAYOUTS:96])
		
		For ($_l_ColumnIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
			SEND RECORD:C78([LIST_LAYOUTS:96])
			NEXT RECORD:C51([LIST_LAYOUTS:96])
		End for 
		SET CHANNEL:C77(11)
		USE SET:C118("$Temp")
		If ($_t_QueryAdd#"")
			APPLY TO SELECTION:C70([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1:=LAY_t_CurrentDefsName+$_t_QueryAdd)
		End if 
		
	End if 
Else 
	$_t_QueryAdd:=""
	If (SVS_at_PreviewEvent>0)
		If (SVS_at_PreviewEvent{SVS_at_PreviewEvent}#"Default")
			Gen_Confirm("Export for "+SVS_at_PreviewEvent{SVS_at_PreviewEvent}+"?"; "Yes"; "No")
			If (OK=1)
				$_t_RefName:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
				If ($_t_RefName="Default")
					DB_t_CurrentFormUsage3:=""
					$_t_RefName:=LAY_t_CurrentDefsName
				Else 
					DB_t_CurrentFormUsage3:=$_t_RefName
					$_t_RefName:=LAY_t_CurrentDefsName+$_t_RefName
				End if 
			Else 
				DB_t_CurrentFormUsage3:=""
				$_t_RefName:=LAY_t_CurrentDefsName
				$_t_QueryAdd:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
			End if 
			
		Else 
			DB_t_CurrentFormUsage3:=""
			$_t_RefName:=LAY_t_CurrentDefsName
		End if 
	Else 
		DB_t_CurrentFormUsage3:=""
		$_t_RefName:=LAY_t_CurrentDefsName
	End if 
	$_t_OutputFolderPath:=DB_GetDocumentPath
	$_t_OutputPath:=Select folder:C670("Select a folder to store the exported configuration"; $_t_OutputFolderPath; 16)
	//TRACE
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_RefName+$_t_QueryAdd)
	//$_ti_DocumentRef:=Create document($_t_OutputPath+$Ref+".txt";"TEXT")
	SET CHANNEL:C77(10; $_t_OutputPath+$_t_RefName+".txt")
	For ($_l_ColumnIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
		SEND RECORD:C78([LIST_LAYOUTS:96])
		NEXT RECORD:C51([LIST_LAYOUTS:96])
	End for 
	SET CHANNEL:C77(11)
	
End if 
//
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.oLayDefintionsexport"; $_t_oldMethodName)