//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_4dBKC_ToolsData
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
	//ARRAY TEXT(EW_at_FieldLabels;0)
	//ARRAY TEXT(EW_at_FieldNames;0)
	//ARRAY TEXT(EW_atFieldLabels;0)
	//ARRAY TEXT(EW_atFieldNames;0)
	//ARRAY TEXT(EW_at_OpenedDocsFileRefsTXT;0)
	//ARRAY TEXT(EW_at_OpenedDocsPathnnames;0)
	C_BOOLEAN:C305($_bo_isHeader)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharacterPosition2; $_l_Index; $_l_SizeofArray; $_l_SizeofArray2; $_l_SizeofOpenedFIles; EW_l_IOERR)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_Buffer; $_t_oldMethodName; $_t_Value; $_t_Value2; $0; $1; $2)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_4dBKC_ToolsData")
// EW_4DBKC_ToolsData
// Pat's version of the 4DBKC_ToolsData component method
// 30/10/03 pb

// a generic tool to handle import/export data files

//used in "_V2_xxx_From" and "_V2_xxx_To" methods









$0:=""

Case of 
	: ($1="INIT")
		
		ARRAY TEXT:C222(EW_at_OpenedDocsFileRefsTXT; 0)
		ARRAY TEXT:C222(EW_at_OpenedDocsPathnnames; 0)
		
	: ($1="Open_DocUMENT")
		//-->$2:pathname
		
		//<--$0:error
		
		
		If (Test path name:C476($2)=Is a document:K24:1)
			EW_l_IOERR:=0
			//ON ERR CALL("4DBKC_ToolsDataErr")
			
			
			//if the file has been opened previously but not closed
			
			//then we try to close
			
			$_l_SizeofArray:=Find in array:C230(EW_at_OpenedDocsPathnnames; $2)
			If ($_l_SizeofArray>0)
				CLOSE DOCUMENT:C267(Time:C179(EW_at_OpenedDocsFileRefsTXT{$_l_SizeofArray}))
			End if 
			
			$_ti_DocumentRef:=DB_OpenDocument($2; ""; Read mode:K24:5)
			If (OK=1)
				//we save a reference to the file
				
				$_l_SizeofOpenedFIles:=Size of array:C274(EW_at_OpenedDocsFileRefsTXT)+1
				INSERT IN ARRAY:C227(EW_at_OpenedDocsFileRefsTXT; $_l_SizeofOpenedFIles; 1)
				EW_at_OpenedDocsFileRefsTXT{$_l_SizeofOpenedFIles}:=String:C10($_ti_DocumentRef)
				INSERT IN ARRAY:C227(EW_at_OpenedDocsPathnnames; $_l_SizeofOpenedFIles; 1)
				EW_at_OpenedDocsPathnnames{$_l_SizeofOpenedFIles}:=$2
			End if 
			$0:=String:C10(EW_l_IOERR)
			If ($0="0")
				$0:=""
			End if 
		Else 
			$0:="-43"  //file not found
			
		End if 
		
	: ($1="Close DocUMENT")
		//-->$2:pathname
		
		//<--$0:error
		
		
		EW_l_IOERR:=0
		$_l_SizeofArray:=Find in array:C230(EW_at_OpenedDocsPathnnames; $2)
		If ($_l_SizeofArray>0)
			CLOSE DOCUMENT:C267(Time:C179(EW_at_OpenedDocsFileRefsTXT{$_l_SizeofArray}))
			DELETE FROM ARRAY:C228(EW_at_OpenedDocsFileRefsTXT; $_l_SizeofArray; 1)
			DELETE FROM ARRAY:C228(EW_at_OpenedDocsPathnnames; $_l_SizeofArray; 1)
		End if 
		$0:=String:C10(EW_l_IOERR)
		If ($0="0")
			$0:=""
		End if 
		
		ON ERR CALL:C155("")
		
	: ($1="GET DATA@")
		//-->$2:pathname
		
		//-->$3:ptr to text array for data
		
		//<--$0:error
		
		
		EW_l_IOERR:=0
		
		$_bo_isHeader:=($1="GET DATA HEADER")
		
		$_l_SizeofArray:=Find in array:C230(EW_at_OpenedDocsPathnnames; $2)
		If ($_l_SizeofArray>0)
			$_ti_DocumentRef:=Time:C179(EW_at_OpenedDocsFileRefsTXT{$_l_SizeofArray})
			
			RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Buffer; Char:C90(13))
			If (EW_l_IOERR=0)
				
				//$_l_SizeofArray2:=Num(4DBKC_ToolsString ("STRING TO FIELD COUNT";$_t_Buffer;Char(9)))
				ARRAY TEXT:C222($3->; $_l_SizeofArray2)
				
				If ($_bo_isHeader)
					// create arrays contianing the field names and labels
					ARRAY TEXT:C222(EW_at_FieldNames; 0)  // the actual field names, e.g. L01
					ARRAY TEXT:C222(EW_at_FieldLabels; 0)  // the labels that have been set up
					ARRAY TEXT:C222(EW_at_FieldNames; $_l_SizeofArray2)  // the actual field names, e.g. L01
					ARRAY TEXT:C222(EW_at_FieldLabels; $_l_SizeofArray2)  // the labels that have been set up
				End if 
				
				For ($_l_Index; 1; $_l_SizeofArray2; 1)
					$_t_Value:=""
					//$_t_Value:=4DBKC_ToolsString ("STRING TO FIELD";$_t_Buffer;Char(9);$_l_Index)
					If ($_bo_isHeader)
						$_t_Value2:=$_t_Value
						$_l_CharacterPosition2:=Position:C15("["; $_t_Value2)
						If ($_l_CharacterPosition2>0)
							EW_at_FieldNames{$_l_Index}:=Substring:C12($_t_Value2; $_l_CharacterPosition2)
							EW_at_FieldLabels{$_l_Index}:=Substring:C12($_t_Value2; 1; $_l_CharacterPosition2-2)  // label+space+code
						Else   // this would be an error, I think
							EW_at_FieldNames{$_l_Index}:=$_t_Value2
							EW_at_FieldLabels{$_l_Index}:=$_t_Value2
						End if 
						//we remove the layout info
						$_l_CharacterPosition:=Position:C15("["; $_t_Value)
						If ($_l_CharacterPosition>0)
							$_t_Value:=Substring:C12($_t_Value; $_l_CharacterPosition)
						End if 
						$_l_CharacterPosition:=Position:C15(","; $_t_Value)
						If ($_l_CharacterPosition>0)
							$_t_Value:=Substring:C12($_t_Value; 1; $_l_CharacterPosition-1)+"]"
						End if 
						
					End if 
					$3->{$_l_Index}:=$_t_Value
				End for 
			End if 
			
		Else 
			EW_l_IOERR:=-38  //file is not yet opened
			
		End if 
		$0:=String:C10(EW_l_IOERR)
		If ($0="0")
			$0:=""
		End if 
		
		
	: ($1="GET FIELD")
		//-->$2:field name
		
		//-->$3:ptr to text array for fields names
		
		//-->$4:ptr to text array for fields values
		
		//<--$0:error
		
		
		$_l_SizeofArray:=Find in array:C230($3->; $2)
		If ($_l_SizeofArray>0)
			$0:=$4->{$_l_SizeofArray}
		Else 
			$0:="-43"
		End if 
		
	: ($1="CREATE DOCUMENT")
		//-->$2:pathname
		
		//<--$0:error
		
		
		EW_l_IOERR:=0
		//ON ERR CALL("4DBKC_ToolsDataErr")
		
		//if the file has been opened previously but not closed
		
		//then we try to close
		
		$_l_SizeofArray:=Find in array:C230(EW_at_OpenedDocsPathnnames; $2)
		If ($_l_SizeofArray>0)
			CLOSE DOCUMENT:C267(Time:C179(EW_at_OpenedDocsFileRefsTXT{$_l_SizeofArray}))
		End if 
		
		If (Test path name:C476($2)=Is a document:K24:1)
			DELETE DOCUMENT:C159($2)
		End if 
		
		If (EW_l_IOERR=0)
			
			$_ti_DocumentRef:=Create document:C266($2; "")
			If (OK=1)
				//we save a reference to the file
				
				$_l_SizeofOpenedFIles:=Size of array:C274(EW_at_OpenedDocsFileRefsTXT)+1
				INSERT IN ARRAY:C227(EW_at_OpenedDocsFileRefsTXT; $_l_SizeofOpenedFIles; 1)
				EW_at_OpenedDocsFileRefsTXT{$_l_SizeofOpenedFIles}:=String:C10($_ti_DocumentRef)
				INSERT IN ARRAY:C227(EW_at_OpenedDocsPathnnames; $_l_SizeofOpenedFIles; 1)
				EW_at_OpenedDocsPathnnames{$_l_SizeofOpenedFIles}:=$2
			End if 
		End if 
		
		$0:=String:C10(EW_l_IOERR)
		If ($0="0")
			$0:=""
		End if 
		
	: ($1="SET DATA")
		//-->$2:pathname
		
		//-->$3:ptr to text array for data
		
		//<--$0:error
		
		
		EW_l_IOERR:=0
		
		$_l_SizeofArray:=Find in array:C230(EW_at_OpenedDocsPathnnames; $2)
		If ($_l_SizeofArray>0)
			$_ti_DocumentRef:=Time:C179(EW_at_OpenedDocsFileRefsTXT{$_l_SizeofArray})
			
			$_l_SizeofArray2:=Size of array:C274($3->)
			
			$_t_Buffer:=""
			
			For ($_l_Index; 1; $_l_SizeofArray2; 1)
				$_t_Buffer:=$_t_Buffer+$3->{$_l_Index}+Char:C90(9)
			End for 
			
			$_t_Buffer:=Substring:C12($_t_Buffer; 1; Length:C16($_t_Buffer)-1)+Char:C90(13)
			
			SEND PACKET:C103($_ti_DocumentRef; $_t_Buffer)
			
		Else 
			EW_l_IOERR:=-38  //file is not yet opened
			
		End if 
		$0:=String:C10(EW_l_IOERR)
		If ($0="0")
			$0:=""
		End if 
		
End case 
ERR_MethodTrackerReturn("EW_4dBKC_ToolsData"; $_t_oldMethodName)