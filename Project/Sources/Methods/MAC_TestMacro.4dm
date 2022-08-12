//%attributes = {}
If (False:C215)
	//Project Method Name:      MAC_TestMacro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    02/10/2011 17:02 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Mistrue)
	//C_UNKNOWN(VmRemainingTitle)
	ARRAY TEXT:C222($_at_1DConjuctions; 0)
	ARRAY TEXT:C222($_at_1DParameters; 0)
	ARRAY TEXT:C222($_at_2DConjuctions; 0; 0)
	ARRAY TEXT:C222($_at_2DParameters; 0; 0)
	ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
	ARRAY TEXT:C222($_at_Commands; 0)
	ARRAY TEXT:C222($_at_Conjuctions; 0; 0)
	ARRAY TEXT:C222($_at_ExternalBlocks; 0)
	ARRAY TEXT:C222($_at_OriginalLines; 0)
	C_BOOLEAN:C305($_bo_Stop)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_CharacterPosition; $_l_ExportIndex; $_l_ExportIndex2; $_l_ExportIndex3; $_l_Index; $_l_IndexP1; $_l_LineRow; $_l_Lines; $_l_offset)
	C_LONGINT:C283($_l_SizeofArray)
	C_TEXT:C284(<>RecText; $_t_Command; $_t_Evaluate; $_t_oldMethodName; $1; VmTitle2)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MAC_TestMacro")
//$_t_ProcessName:="AAJUnk_7"
//$_at_2DParameters:="1;"+Char(34)+"2"+Char(34)+";Records in selection([contacts])"+";*")
//$_l_Process:=New Process($_t_ProcessName;128000;"MyProcess";$_at_2DParameters)
If (True:C214)
	READ WRITE:C146([SCRIPTS:80])
	If (Count parameters:C259>=1)
		If ([SCRIPTS:80]Script_Code:1#$1)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
		End if 
	Else 
		
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Cmireport")
		
	End if 
	
	QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3#"")
	ORDER BY:C49([ORDERS:24]; [ORDERS:24]Order_Date:4; <)
	
	
	
	
	
	//If (BLOB size([MACROS]Parsed_Macro)=0)
	MACRO_ParseForCode([SCRIPTS:80]Script_Code:1)
	//End if
	//DB_l_CurrentDisplayedForm:=Table(->[ORDER ITEMS])
	ARRAY TEXT:C222($_at_Commands; 0)
	ARRAY TEXT:C222($_at_ExternalBlocks; 0)
	ARRAY TEXT:C222($_at_2DParameters; 0; 0)
	ARRAY TEXT:C222($_at_2DConjuctions; 0; 0)
	ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_l_Lines; $_l_offset)
	ARRAY TEXT:C222($_at_2DParameters; $_l_Lines; 0)
	ARRAY TEXT:C222($_at_2DConjuctions; $_l_Lines; 0)
	ARRAY TEXT:C222($_at_2DTextBlocks; $_l_Lines; 0)
	For ($_l_Index; 1; $_l_Lines)
		BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DTextBlocks{$_l_Index}; $_l_offset)
	End for 
	BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_Commands; $_l_offset)
	BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_ExternalBlocks; $_l_offset)
	For ($_l_Index; 1; $_l_Lines)
		BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DParameters{$_l_Index}; $_l_offset)
	End for 
	For ($_l_Index; 1; $_l_Lines)
		BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DConjuctions{$_l_Index}; $_l_offset)
	End for 
	<>SCPT_l_PlayerActive:=Current process:C322
	<>RecText:=[SCRIPTS:80]Recording_Text:4
	<>SYS_l_CancelProcess:=0
	//Record_Play (1;<>RecText)
	//TRACE
	
	Macro_Play(0; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_2DConjuctions)
	//ALERT(String(MRandAmount))
	//Gen_Alert(vmResultText)
Else 
	If (False:C215)
		$_ti_DocumentRef:=Open document:C264(""; "TEXT")
		ARRAY TEXT:C222($_at_OriginalLines; 0)
		ARRAY TEXT:C222($_at_Commands; 0)
		ARRAY TEXT:C222($_at_2DParameters; 0; 0)
		ARRAY TEXT:C222($_at_Conjuctions; 0; 0)
		//TRACE
		Repeat 
			
			
			$_t_Command:=""
			VmRemainingTitle:=""
			ARRAY TEXT:C222($_at_1DParameters; 0)
			ARRAY TEXT:C222($_at_1DConjuctions; 0)
			RECEIVE PACKET:C104($_ti_DocumentRef; VmTitle2; 320000)
			VmTitle2:=VmRemainingTitle+VmTitle2
			
			If (VmTitle2#"")
				Repeat 
					$_l_CharacterPosition:=Position:C15(Char:C90(13); VmTitle2)
					If ($_l_CharacterPosition=0)
						$_l_CharacterPosition:=Position:C15(Char:C90(10); VmTitle2)
					End if 
					If ($_l_CharacterPosition>0)
						VmRemainingTitle:=Substring:C12(Vmtitle2; $_l_CharacterPosition+1)
						
						VmTitle2:=Substring:C12(Vmtitle2; 1; $_l_CharacterPosition-1)
						
						
						
						ARRAY TEXT:C222($_at_1DParameters; 0)
						ARRAY TEXT:C222($_at_1DConjuctions; 0)
						$_l_LineRow:=Find in array:C230($_at_OriginalLines; VmTitle2)
						If ($_l_LineRow<0)
							APPEND TO ARRAY:C911($_at_OriginalLines; VmTitle2)
							Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_1DParameters; ->$_at_1DConjuctions)
							APPEND TO ARRAY:C911($_at_Commands; $_t_Command)
							$_l_SizeofArray:=Size of array:C274($_at_Commands)
							INSERT IN ARRAY:C227($_at_2DParameters; $_l_SizeofArray; 1)
							INSERT IN ARRAY:C227($_at_Conjuctions; $_l_SizeofArray; 1)
							For ($_l_IndexP1; 1; Size of array:C274($_at_1DParameters))
								If (Size of array:C274($_at_2DParameters{Size of array:C274($_at_2DParameters)})<$_l_IndexP1)
									INSERT IN ARRAY:C227($_at_2DParameters{Size of array:C274($_at_2DParameters)}; $_l_IndexP1; 1)
								End if 
								$_at_2DParameters{Size of array:C274($_at_2DParameters)}{$_l_IndexP1}:=$_at_1DParameters{$_l_IndexP1}
							End for 
							For ($_l_IndexP1; 1; Size of array:C274($_at_1DConjuctions))
								If (Size of array:C274($_at_Conjuctions{Size of array:C274($_at_Conjuctions)})<$_l_IndexP1)
									INSERT IN ARRAY:C227($_at_Conjuctions{Size of array:C274($_at_Conjuctions)}; $_l_IndexP1; 1)
								End if 
								$_at_Conjuctions{Size of array:C274($_at_Conjuctions)}{$_l_IndexP1}:=$_at_1DConjuctions{$_l_IndexP1}
							End for 
						End if 
						
					Else 
					End if 
					Vmtitle2:=VmRemainingTitle
				Until ($_l_CharacterPosition=0)
				
			End if 
			
			
		Until (OK=0)
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
		
		$_ti_DocumentRef:=Create document:C266(""; "TEXT")
		For ($_l_Index; 78; Size of array:C274($_at_OriginalLines))
			SEND PACKET:C103($_ti_DocumentRef; "OL="+$_at_OriginalLines{$_l_Index}+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; "Command="+$_at_Commands{$_l_Index}+Char:C90(9))
			For ($_l_IndexP1; 1; Size of array:C274($_at_2DParameters{$_l_Index}))
				$_bo_Stop:=False:C215
				If ($_at_2DParameters{$_l_Index}{$_l_IndexP1}#"")
					Mistrue:=False:C215
					$_l_CharacterPosition:=Position:C15("|"; $_at_2DParameters{$_l_Index}{$_l_IndexP1})
					If ($_l_CharacterPosition=0)
						$_l_CharacterPosition:=Position:C15("&"; $_at_2DParameters{$_l_Index}{$_l_IndexP1})
					End if 
					If ($_l_CharacterPosition>0)
						$_t_Evaluate:=$_at_2DParameters{$_l_Index}{$_l_IndexP1}
						$_t_Evaluate:=Gen_RequestText("Alter this line:"; $_t_Evaluate)
						If (OK=1)
							EXECUTE FORMULA:C63("mIsTrue:="+$_t_Evaluate)
							ALERT:C41(String:C10(Mistrue))
							SEND PACKET:C103($_ti_DocumentRef; "PAR="+$_at_2DParameters{$_l_Index}{$_l_IndexP1}+Char:C90(9))
						Else 
							Gen_Confirm("STOP?"; "YES"; "NO")
							If (OK=0)
								$_l_Index:=Size of array:C274($_at_OriginalLines)
								$_bo_Stop:=True:C214
							End if 
						End if 
					Else 
						SEND PACKET:C103($_ti_DocumentRef; "PAR="+$_at_2DParameters{$_l_Index}{$_l_IndexP1}+Char:C90(9))
					End if 
					If (Not:C34($_bo_Stop))
						If ($_l_IndexP1>1)
							If (($_l_IndexP1-1)>Size of array:C274($_at_Conjuctions{$_l_Index}))
								If ($_at_Conjuctions{$_l_Index}{$_l_IndexP1}#"")
									SEND PACKET:C103("CONJ="+$_at_Conjuctions{$_l_Index}{$_l_IndexP1})
								End if 
							End if 
						End if 
					End if 
				End if 
			End for 
			
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
	End if 
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
	ALL RECORDS:C47([SCRIPTS:80])
	For ($_l_ExportIndex; 1; Records in selection:C76([SCRIPTS:80]))
		MESSAGE:C88(String:C10($_l_ExportIndex))
		
		
		MACRO_ParseForCode([SCRIPTS:80]Script_Code:1)
		ARRAY TEXT:C222($_at_Commands; 0)
		ARRAY TEXT:C222($_at_ExternalBlocks; 0)
		ARRAY TEXT:C222($_at_2DParameters; 0; 0)
		ARRAY TEXT:C222($_at_2DConjuctions; 0; 0)
		ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_l_Lines; $_l_offset)
		ARRAY TEXT:C222($_at_2DParameters; $_l_Lines; 0)
		ARRAY TEXT:C222($_at_2DConjuctions; $_l_Lines; 0)
		ARRAY TEXT:C222($_at_2DTextBlocks; $_l_Lines; 0)
		For ($_l_Index; 1; $_l_Lines)
			BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DTextBlocks{$_l_Index}; $_l_offset)
		End for 
		BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_Commands; $_l_offset)
		BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_ExternalBlocks; $_l_offset)
		For ($_l_Index; 1; $_l_Lines)
			BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DParameters{$_l_Index}; $_l_offset)
		End for 
		For ($_l_Index; 1; $_l_Lines)
			BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DConjuctions{$_l_Index}; $_l_offset)
		End for 
		For ($_l_ExportIndex2; 1; $_l_Lines)
			For ($_l_ExportIndex3; 1; Size of array:C274($_at_2DTextBlocks{$_l_ExportIndex2}))
				SEND PACKET:C103($_ti_DocumentRef; $_at_2DTextBlocks{$_l_ExportIndex2}{$_l_ExportIndex3}+Char:C90(9))
			End for 
			SEND PACKET:C103($_ti_DocumentRef; $_at_Commands{$_l_ExportIndex2}+Char:C90(9))
			
			For ($_l_ExportIndex3; 1; Size of array:C274($_at_2DParameters{$_l_ExportIndex2}))
				SEND PACKET:C103($_ti_DocumentRef; $_at_2DParameters{$_l_ExportIndex2}{$_l_ExportIndex3}+Char:C90(9)+$_at_2DConjuctions{$_l_ExportIndex2}{$_l_ExportIndex3}+Char:C90(9))
			End for 
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		End for 
		NEXT RECORD:C51([SCRIPTS:80])
	End for 
	
End if 
ERR_MethodTrackerReturn("MAC_TestMacro"; $_t_oldMethodName)
