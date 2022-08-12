//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CODEMULTILINE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2012 16:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RepeatedCount; 0)
	ARRAY TEXT:C222($_at_AppearsInMethods; 0; 0)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	ARRAY TEXT:C222($_at_MatchedBlocksThisMethod; 0)
	ARRAY TEXT:C222($_at_RepeatedLines; 0)
	//ARRAY TEXT(DB_at_DocumentinArray1;0)
	C_BOOLEAN:C305($_bo_NoCheck)
	C_LONGINT:C283($_l_Break; $_l_Index; $_l_Index2; $_l_Index3; $_l_LastMinimum; $_l_LinePosition; $_l_MethodPosition; $_l_Minimum; $_l_NumberofRepeats; $_l_SizeofArray; $_l_StartPosition)
	C_TEXT:C284($_t_Lines; $_t_Lines2; $_t_oldMethodName; DB_t_MethodText)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CODEMULTILINE")
$_ti_DocumentRef:=Create document:C266("MultiplLinesReport-3"; "TEXT")
$_l_Minimum:=80
$_l_LastMinimum:=100
Repeat 
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	METHOD GET PATHS:C1163(1; $_at_DocumentPaths)
	SORT ARRAY:C229($_at_DocumentPaths)
	
	ARRAY TEXT:C222($_at_RepeatedLines; 0)
	ARRAY LONGINT:C221($_al_RepeatedCount; 0)
	ARRAY TEXT:C222($_at_AppearsInMethods; 0; 0)
	For ($_l_Index; 1; Size of array:C274($_at_DocumentPaths))
		
		MESSAGE:C88(String:C10($_l_Index; "0000")+" Line "+String:C10(0; "000000")+" Repeated "+String:C10(0; "000000")+" Checking blocks of "+String:C10(0)+" Lines")
		
		METHOD GET CODE:C1190($_at_DocumentPaths{$_l_Index}; DB_t_MethodText)
		$_l_StartPosition:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; DB_t_MethodText)
		If ($_l_StartPosition>0)
			ARRAY TEXT:C222(DB_at_DocumentinArray1; 0)
			DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_StartPosition)
			DB_TextToarray(->DB_t_MethodText; ->DB_at_DocumentinArray1; Char:C90(13); True:C214; True:C214; True:C214)
			$_l_Break:=$_l_LastMinimum
			If (Size of array:C274(DB_at_DocumentinArray1)<$_l_Break)
				$_l_Break:=Size of array:C274(DB_at_DocumentinArray1)
			End if 
			ARRAY TEXT:C222($_at_MatchedBlocksThisMethod; 0)
			Repeat 
				If (Size of array:C274(DB_at_DocumentinArray1)>=$_l_Break)
					For ($_l_Index2; 1; Size of array:C274(DB_at_DocumentinArray1))
						$_t_Lines:=""
						For ($_l_Index3; $_l_Index2; $_l_Break)
							$_t_Lines:=$_t_Lines+Char:C90(13)+DB_at_DocumentinArray1{$_l_Index3}
						End for 
						MESSAGE:C88(String:C10($_l_Index; "0000")+" Line "+String:C10($_l_Index2; "000000")+" Repeated "+String:C10(0; "000000")+" Checking blocks of "+String:C10($_l_Break)+" Lines")
						
						If ($_t_Lines#"End if") & ($_t_Lines#"")
							$_bo_NoCheck:=False:C215
							If (Size of array:C274($_at_MatchedBlocksThisMethod)>0)
								For ($_l_Index3; 1; Size of array:C274($_at_MatchedBlocksThisMethod))
									$_t_Lines2:=$_at_MatchedBlocksThisMethod{$_l_Index3}
									If (Position:C15($_t_Lines; $_t_Lines2)>0)
										$_bo_NoCheck:=True:C214
									End if 
								End for 
							End if 
							If (Not:C34($_bo_NoCheck))
								$_l_LinePosition:=Find in array:C230($_at_RepeatedLines; $_t_Lines)
								If ($_l_LinePosition<0)
									APPEND TO ARRAY:C911($_at_RepeatedLines; $_t_Lines)
									APPEND TO ARRAY:C911($_al_RepeatedCount; 1)
									$_l_SizeofArray:=Size of array:C274($_at_AppearsInMethods)
									INSERT IN ARRAY:C227($_at_AppearsInMethods; $_l_SizeofArray+1; 1)
									APPEND TO ARRAY:C911($_at_AppearsInMethods{$_l_SizeofArray+1}; $_at_DocumentPaths{$_l_Index})
								Else 
									MESSAGE:C88(String:C10($_l_Index; "0000")+" Line "+String:C10($_l_Index2; "000000")+" Repeated "+String:C10($_al_RepeatedCount{$_l_LinePosition}; "000000")+" Checking blocks of "+String:C10($_l_Break)+" Lines")
									$_l_MethodPosition:=Find in array:C230($_at_AppearsInMethods{$_l_LinePosition}; $_at_DocumentPaths{$_l_Index})
									If ($_l_MethodPosition<0)
										APPEND TO ARRAY:C911($_at_MatchedBlocksThisMethod; $_t_Lines)
										//There is then no point in checking this block again..move past the end of this block..
										$_l_Index2:=$_l_Index2+$_l_Break
										$_al_RepeatedCount{$_l_LinePosition}:=$_al_RepeatedCount{$_l_LinePosition}+1
										APPEND TO ARRAY:C911($_at_AppearsInMethods{$_l_LinePosition}; $_at_DocumentPaths{$_l_Index})
									End if 
								End if 
							End if 
						End if 
					End for 
				End if 
				If ($_l_Break>10)
					$_l_Break:=$_l_Break-10
				Else 
					$_l_Break:=$_l_Break-1
				End if 
			Until ($_l_Break<=$_l_Minimum)
		End if 
	End for 
	
	SEND PACKET:C103($_ti_DocumentRef; "Block Size no less than "+String:C10($_l_Minimum)+"Lines")
	
	
	$_l_NumberofRepeats:=99
	Repeat 
		For ($_l_Index; 1; Size of array:C274($_al_RepeatedCount))
			If ($_al_RepeatedCount{$_l_Index}>1)
				SEND PACKET:C103($_ti_DocumentRef; $_at_RepeatedLines{$_l_Index}+Char:C90(13)+Char:C90(9)+"Repeat Count: "+String:C10($_al_RepeatedCount)+Char:C90(9)+"Method Names: ")
				For ($_l_Index2; 1; Size of array:C274($_at_AppearsInMethods{$_l_Index}))
					If ($_l_Index2=1)
						SEND PACKET:C103($_ti_DocumentRef; $_at_AppearsInMethods{$_l_Index}{$_l_Index2})
					Else 
						SEND PACKET:C103($_ti_DocumentRef; ","+$_at_AppearsInMethods{$_l_Index}{$_l_Index2})
					End if 
				End for 
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				
			End if 
		End for 
		$_l_NumberofRepeats:=$_l_NumberofRepeats-1
	Until ($_l_NumberofRepeats<=1)
	$_l_LastMinimum:=$_l_Minimum
	If ($_l_Minimum>10)
		$_l_Minimum:=$_l_Minimum-10
	Else 
		$_l_Minimum:=$_l_Minimum-1
	End if 
Until ($_l_Minimum<=0)

CLOSE DOCUMENT:C267($_ti_DocumentRef)
ALERT:C41("Report Done")
ERR_MethodTrackerReturn("DB_CODEMULTILINE"; $_t_oldMethodName)