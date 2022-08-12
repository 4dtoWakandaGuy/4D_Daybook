//%attributes = {}
If (False:C215)
	//Project Method Name:      TICK_IMPORT_CUSTOMERS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentText; 0)
	ARRAY TEXT:C222($_at_FolderContents; 0)
	ARRAY TEXT:C222($_at_RecordText; 0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_DocumentCount; $_l_DocumentPosition; $_l_DocumentSize; $_l_Element; $_l_Index; $_l_PathType; $_l_PathType2; $_l_RecordCount)
	C_TEXT:C284($_t_CarriageReturn; $_t_CustomerCode; $_t_CustomerName; $_t_DocumentName; $_t_Name; $_t_Name2; $_t_oldMethodName; $_t_Path; $_t_Suffix; $_t_Tab; $_t_WIdow)
	C_TEXT:C284($1)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TICK_IMPORT_CUSTOMERS")
If (Count parameters:C259>=1)
	$_t_DocumentName:=$1
	$_t_CarriageReturn:=Char:C90(13)
	$_t_Tab:=Char:C90(9)
	
	Repeat 
		$_l_PathType:=Test path name:C476($_t_DocumentName)
		If ($_l_PathType=1)
			//the document exists
			//we must change the name of document -so it cannot be read again!
			
			$_t_Path:=PathFromPathName($_t_DocumentName)
			$_t_Name:=FileNamefromPath
			$_l_PathType2:=Test path name:C476($_t_Path+"Previous Imports")
			If ($_l_PathType2=2)  //folder exists
				ARRAY TEXT:C222($_at_FolderContents; 0)
				DOCUMENT LIST:C474($_t_Path+"Previous Imports"; $_at_FolderContents)
				$_l_DocumentCount:=Size of array:C274($_at_FolderContents)+1
				ARRAY TEXT:C222($_at_FolderContents; 0)
			Else 
				CREATE FOLDER:C475($_t_Path+"Previous Imports")
				$_l_DocumentCount:=1
			End if 
			$_l_CharacterPosition:=Position:C15("."; $_t_Name)
			If ($_l_CharacterPosition=0)
				If (Is macOS:C1572)
					COPY DOCUMENT:C541($_t_DocumentName; $_t_Path+"Previous Import:"+$_t_Name+String:C10($_l_DocumentCount))
				Else 
					COPY DOCUMENT:C541($_t_DocumentName; $_t_Path+"Previous Import\\"+$_t_Name+String:C10($_l_DocumentCount))
				End if 
				
			Else 
				$_t_Name2:=Substring:C12($_t_Name; 1; $_l_CharacterPosition-1)
				$_t_Suffix:=Substring:C12($_t_Name; $_l_CharacterPosition+1; Length:C16($_t_Name))
				If (Is macOS:C1572)
					COPY DOCUMENT:C541($_t_DocumentName; $_t_Path+"Previous Import:"+$_t_Name2+String:C10($_l_DocumentCount)+"."+$_t_Suffix)
				Else 
					COPY DOCUMENT:C541($_t_DocumentName; $_t_Path+"Previous Import\\"+$_t_Name2+String:C10($_l_DocumentCount)+"."+$_t_Suffix)
				End if 
			End if 
			ARRAY TEXT:C222($_at_DocumentText; 100)
			$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName; "TEXT")
			$_l_Element:=0
			$_l_DocumentSize:=Get document size:C479($_ti_DocumentRef)
			Repeat 
				$_l_Element:=$_l_Element+1
				If ($_l_Element>Size of array:C274($_at_DocumentText))
					INSERT IN ARRAY:C227($_at_DocumentText; Size of array:C274($_at_DocumentText)+1; 100)
				End if 
				RECEIVE PACKET:C104($_ti_DocumentRef; $_at_DocumentText{$_l_Element}; 2000)
				$_l_DocumentPosition:=Get document position:C481($_ti_DocumentRef)
			Until (ok=0) | ($_l_DocumentPosition>=$_l_DocumentSize)  //we are at the end of the document
			//now delete the document
			ARRAY TEXT:C222($_at_DocumentText; $_l_Element)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			DELETE DOCUMENT:C159($_t_DocumentName)
			//we now have the doc backed up and read into memory here we can parse the documen
			$_t_WIdow:=""
			ARRAY TEXT:C222($_at_RecordText; 100)
			$_l_RecordCount:=0
			For ($_l_Index; 1; Size of array:C274($_at_DocumentText))
				$_at_DocumentText{$_l_Index}:=$_t_WIdow+$_at_DocumentText{$_l_Index}
				//now break this into record chunks
				Repeat 
					$_l_CharacterPosition:=Position:C15($_t_CarriageReturn; $_at_DocumentText{$_l_Index})
					If ($_l_CharacterPosition>0)
						//we have a record
						$_l_RecordCount:=$_l_RecordCount+1
						If ($_l_RecordCount>Size of array:C274($_at_RecordText))
							INSERT IN ARRAY:C227($_at_RecordText; Size of array:C274($_at_RecordText)+1; 100)
						End if 
						$_at_RecordText{$_l_RecordCount}:=Substring:C12($_at_DocumentText{$_l_Index}; 1; $_l_CharacterPosition-1)
						$_at_DocumentText{$_l_Index}:=Substring:C12($_at_DocumentText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_DocumentText{$_l_Index}))
					End if 
				Until ($_l_CharacterPosition=0)
			End for 
			//we now
			ARRAY TEXT:C222($_at_RecordText; $_l_RecordCount)
			//have the data broken into recor
			//we can now parse that and do the rest of the work
			
			//BEFORE THIS IS GENERIC
			For ($_l_Index; 1; Size of array:C274($_at_RecordText))
				// Customer List
				// Code
				//Name
				//Address
				//Tel No.
				//EC
				//VA
				$_l_CharacterPosition:=Position:C15($_t_Tab; $_at_RecordText{$_l_Index})
				$_t_CustomerCode:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
				$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
				$_l_CharacterPosition:=Position:C15($_t_Tab; $_at_RecordText{$_l_Index})
				$_t_CustomerName:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
				$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
				
				
				//
				
			End for 
			
			//AFTER THIS IS GENERIC
			
			
		End if 
		
	Until (Ok=0)
End if 
ERR_MethodTrackerReturn("TICK_IMPORT_CUSTOMERS"; $_t_oldMethodName)
