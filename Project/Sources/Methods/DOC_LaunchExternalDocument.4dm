//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_LaunchExternalDocument
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_ConvertedPath; $_t_DocumentPath; $_t_DocumentPath2; $_t_Input; $_t_LocalDocumentName; $_t_oldMethodName; $_t_OriginalPath; $_t_SepChar; $1; $2; $output)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_LaunchExternalDocument")

If (Count parameters:C259>=1)
	If (Count parameters:C259<2)
		READ ONLY:C145([DOCUMENTS:7])
		If ([DOCUMENTS:7]Document_Code:1#$1)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$1)
		End if 
		$_t_DocumentPath:=[DOCUMENTS:7]DOC_PATH:21
		$_t_LocalDocumentName:=[DOCUMENTS:7]Heading:2
	Else 
		$_t_DocumentPath:=$2
		$_t_LocalDocumentName:=FileNamefromPath($2)
		
	End if 
	If ($_t_LocalDocumentName="")
		$_t_LocalDocumentName:=FileNamefromPath($_t_DocumentPath)
	End if 
	If ($_t_LocalDocumentName="")
		$_t_LocalDocumentName:="Documenttmp"
	End if 
	If ($_t_DocumentPath#"")
		If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
			If (Is macOS:C1572)
				$_t_DocumentPath2:=$_t_DocumentPath
				//$tempcreator:=_o_Document creator($_t_DocumentPath2)
				//$temptype:=_o_Document type($_t_DocumentPath2)
				$_t_OriginalPath:=$_t_DocumentPath2
				$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; ":"; "/")
				//$_t_OriginalPath:=Replace string($_t_OriginalPath;" ";"\\ ")
				$_t_ConvertedPath:="/Volumes/"+$_t_OriginalPath
				$_t_DocumentPath2:=$_t_ConvertedPath
				$_t_Input:=""
				$_t_SepChar:="/"
				
				$_t_DocumentPath2:=$_t_SepChar+$_t_DocumentPath2+$_t_SepChar
				
				
				LAUNCH EXTERNAL PROCESS:C811("open "+Char:C90(34)+$_t_DocumentPath2+Char:C90(34))
				
				
				//$err:=@XX_AP Sublaunch ([DOCUMENTS]DOC_PATH)
				
				//LAUNCH EXTERNAL PROCESS([DOCUMENTS]DOC_PATH)
			Else 
				SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
				LAUNCH EXTERNAL PROCESS:C811("cmd.exe /C start \"\" \""+[DOCUMENTS:7]DOC_PATH:21+"\"")
				
				//$err:=AP ShellExecute ([;0)
			End if 
			
			
			
		Else 
			
			$_t_DocumentPath2:=DOC_GetDocumentFromServer($_t_LocalDocumentName; $_t_DocumentPath)
			If (Test path name:C476($_t_DocumentPath2)=Is a document:K24:1)
				If (Is macOS:C1572)
					$_t_DocumentPath2:=$_t_DocumentPath2
					//$tempcreator:=_o_Document creator($_t_DocumentPath2)
					//$temptype:=_o_Document type($_t_DocumentPath2)
					$_t_OriginalPath:=$_t_DocumentPath2
					$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; ":"; "/")
					$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; " "; "\\ ")
					$_t_ConvertedPath:="/Volumes/"+$_t_OriginalPath
					$_t_DocumentPath2:=$_t_ConvertedPath
					$_t_Input:=""
					$_t_SepChar:="/"
					$_t_DocumentPath2:=$_t_SepChar+$_t_DocumentPath2+$_t_SepChar
					LAUNCH EXTERNAL PROCESS:C811("open "+Char:C90(34)+$_t_DocumentPath2+Char:C90(34))
					
					//$err:=@XX_AP Sublaunch ($_t_DocumentPath2)
					
					
				Else 
					SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
					LAUNCH EXTERNAL PROCESS:C811("cmd.exe /C start \"\" \""+$_t_DocumentPath2+"\"")
					
					//$err:=AP ShellExecute ($_t_DocumentPath2;0)
				End if 
			Else 
				SET_THERMOMETER("Sorry document not found!"; 100)
				DelayTicks(60*2)
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DOC_LaunchExternalDocument"; $_t_oldMethodName)