//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetBKRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_References; 0)
	ARRAY LONGINT:C221($_al_RefPointer; 0)
	ARRAY TEXT:C222($_at_RecordData; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	C_BOOLEAN:C305($_bo_exit; $_bo_Load)
	C_LONGINT:C283($_l_BKRecordCount; $_l_CharPosition; $_l_Count; $_l_Element; $_l_error; $_l_FieldCount; $_l_FieldPosition; $_l_Index; $_l_offset; $_l_WritePosition; $1)
	C_POINTER:C301($3; $4; $5; $6)
	C_TEXT:C284($_t_BKFilePath; $_t_BKquery; $_t_BKResult; $_t_NewString; $_t_oldMethodName; $2; $DM_T_FieldNames; DM_t_BkDataModel; DM_t_BKFileName; DM_t_BKFilePath; DM_T_CustomQuery)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetBKRecord")


$_bo_Load:=False:C215
//NOTE the setting MUST be loaded(usually by DM_GETBkRecord)
If (Count parameters:C259>=2)
	
	$_l_offset:=0
	
	
	$_t_BKFilePath:=DM_SetFilePath(DM_t_BKFilePath; DM_t_BKFileName)
	
	
	
	//query string is passed to this method
	$_t_BKquery:=$2
	$_t_BKResult:=""
	//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKquery;$_t_BKFilePath)
	Case of 
		: ($_t_BKResult#("[err"+"@"))
			//we now have the file and we want to put the content of $5 into the field at $6
			$_l_BKRecordCount:=Num:C11($_t_BKResult)  //because we know the first row is the field names we can now get them
			$_ti_DocumentRef:=DB_OpenDocument($_t_BKFilePath)
			RECEIVE PACKET:C104($_ti_DocumentRef; $DM_T_FieldNames; Char:C90(13))
			$_l_FieldCount:=0
			//$_l_FieldCount:=Num(4DBKC_ToolsString ("STRING TO FIELD COUNT";$DM_T_FieldNames;Char(9)))
			ARRAY TEXT:C222($_at_FieldNames; 0)
			ARRAY TEXT:C222($_at_FieldNames; $_l_FieldCount)
			$_l_WritePosition:=Get document position:C481($_ti_DocumentRef)
			
			
			ARRAY LONGINT:C221($_al_References; Size of array:C274($6->))
			ARRAY LONGINT:C221($_al_RefPointer; Size of array:C274($6->))
			$_l_Element:=0
			For ($_l_Index; 1; Size of array:C274($6->))
				
				$_l_FieldPosition:=Find in array:C230($_at_FieldNames; "["+($6->{$_l_Index})+"]")
				If ($_l_FieldPosition>0)
					$_l_Element:=$_l_Element+1
					$_al_References{$_l_Element}:=$_l_FieldPosition
					$_al_RefPointer{$_l_Element}:=$_l_Index
				End if 
			End for 
			ARRAY LONGINT:C221($_al_References; $_l_Element)
			ARRAY LONGINT:C221($_al_RefPointer; $_l_Element)
			If (Size of array:C274($_al_References)>0)
				
				//this is the field number we want to set
				//now extract the data
				ARRAY TEXT:C222($_at_RecordData; $_l_BKRecordCount)
				$_l_Element:=1
				$_l_Count:=0
				//Get the document position
				Repeat 
					If ($_l_Element>Size of array:C274($_at_RecordData))
						INSERT IN ARRAY:C227($_at_RecordData; $_at_RecordData+1; 100)
					End if 
					RECEIVE PACKET:C104($_ti_DocumentRef; $_at_RecordData{$_l_Element}; Char:C90(13))
					$_l_Element:=$_l_Element+1
					$_l_Count:=$_l_Count+1
				Until (OK=0) | ($_l_Count=$_l_BKRecordCount)
				//this should be ONE record
				
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				$_t_NewString:=""
				For ($_l_Element; 1; Size of array:C274($_at_RecordData))
					$_l_Count:=0
					$_bo_exit:=False:C215
					Repeat 
						$_l_CharPosition:=Position:C15(Char:C90(9); $_at_RecordData{$_l_Element})
						If ($_l_CharPosition>0)
							$_l_Count:=$_l_Count+1
							If ((Find in array:C230($_al_References; $_l_Count))>0)
								If ($5->{$_al_RefPointer{Find in array:C230($_al_References; $_l_Count)}}#"DEL")
									$_t_NewString:=$_t_NewString+$5->{$_al_RefPointer{Find in array:C230($_al_References; $_l_Count)}}+Char:C90(9)
									$_at_RecordData{$_l_Element}:=Substring:C12($_at_RecordData{$_l_Element}; $_l_CharPosition+1; Length:C16($_at_RecordData{$_l_Element}))
								Else 
									$_t_NewString:=$_t_NewString+Substring:C12($_at_RecordData{$_l_Element}; 1; $_l_CharPosition-1)+"*DEL*"+Char:C90(9)
									$_at_RecordData{$_l_Element}:=Substring:C12($_at_RecordData{$_l_Element}; $_l_CharPosition+1; Length:C16($_at_RecordData{$_l_Element}))
								End if 
							Else 
								$_t_NewString:=$_t_NewString+Substring:C12($_at_RecordData{$_l_Element}; 1; $_l_CharPosition)
								
								$_at_RecordData{$_l_Element}:=Substring:C12($_at_RecordData{$_l_Element}; $_l_CharPosition+1; Length:C16($_at_RecordData{$_l_Element}))
							End if 
						Else 
							//the last field
							$_l_Count:=$_l_Count
							If ((Find in array:C230($_al_References; $_l_Count))>0)
								If ($5->{$_al_RefPointer{Find in array:C230($_al_References; $_l_Count)}}#"DEL")
									$_t_NewString:=$_t_NewString+$5->{$_al_RefPointer{Find in array:C230($_al_References; $_l_Count)}}+Char:C90(13)
									$_at_RecordData{$_l_Element}:=""
								Else 
									$_t_NewString:=$_t_NewString+Substring:C12($_at_RecordData{$_l_Element}; 1; $_l_CharPosition-1)+"*DEL*"+Char:C90(13)
									$_at_RecordData{$_l_Element}:=""
								End if 
							Else 
								$_t_NewString:=$_t_NewString+$_at_RecordData{$_l_Element}+Char:C90(13)
								$_at_RecordData{$_l_Element}:=""
							End if 
						End if 
					Until ($_at_RecordData{$_l_Element}="") | ($_bo_exit)
				End for 
				
				
				//now we have the data to send back to the document
				//set the write to after the header
				$_ti_DocumentRef:=DB_OpenDocument($_t_BKFilePath)
				SET DOCUMENT POSITION:C482($_ti_DocumentRef; $_l_WritePosition; 1)
				SEND PACKET:C103($_ti_DocumentRef; $_t_NewString)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				$_t_BKResult:=""
				//$_t_BKResult:=4DBKC_ExportFileTo4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;"";$_t_BKFilePath)
				
			Else 
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				
			End if 
			
		Else 
			//handle no file error here
			$_l_error:=3
			
			
	End case 
	
	
	
End if   // no data model!!!
ERR_MethodTrackerReturn("DM_SetBKRecord"; $_t_oldMethodName)