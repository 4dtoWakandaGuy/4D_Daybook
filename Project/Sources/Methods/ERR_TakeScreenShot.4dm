//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 15/12/2009 09:19`Method: ERR_TakeScreenShot
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
C_TEXT:C284($_t_Path; $_t_CR; $_t_Command)
C_BOOLEAN:C305($_bo_ForClipboard)
C_PICTURE:C286(DB_pic_Screenshot)
C_BOOLEAN:C305($_bo_Printout)
$_bo_Printout:=False:C215
If (Not:C34(Is macOS:C1572))
	//sorry("no Screencapture")
Else 
	//
	If (Count parameters:C259=0)
		$_bo_ForClipboard:=True:C214
	End if 
	
	//capture the window
	If ($_bo_ForClipboard)
		$_t_Command:="screencapture -i -W -c"
	Else 
		$_t_Path:="/tmp/preview.jpg"
		$_t_CR:="\n"
		//delete the previous screendump
		$_t_Command:="rm -r"+$_t_Path
		LAUNCH EXTERNAL PROCESS:C811($_t_Command)
		//
		$_t_Command:="screencapture -i -W "+$_t_Path
	End if 
	LAUNCH EXTERNAL PROCESS:C811($_t_Command)
	//
	GET PICTURE FROM PASTEBOARD:C522(DB_pic_Screenshot)
	//
	If (Picture size:C356(DB_pic_Screenshot)>0)
		
		If ($_bo_Printout)
			C_LONGINT:C283($_l_Scaling)  //SCALING
			$_l_Scaling:=80
			C_LONGINT:C283($Scale; $Orientation; $_l_Landscape)
			$_l_Landscape:=2
			$_t_CurrentPrinter:=Get current printer:C788
			GET PRINT OPTION:C734(Scale option:K47:3; $Scale)
			GET PRINT OPTION:C734(Orientation option:K47:2; $Orientation)
			SET PRINT OPTION:C733(Scale option:K47:3; $_l_Scaling)
			SET PRINT OPTION:C733(Orientation option:K47:2; $_l_Landscape)
			_O_PAGE SETUP:C299("Print.PageSetup."+String:C10($_l_Scaling))
			PRINT SETTINGS:C106
			If (OK=1)
				//
				C_LONGINT:C283($_l_PrintedHeight)
				$_l_PrintedHeight:=Print form:C5("Print.Window")
				//
				PAGE BREAK:C6
				//
			End if 
			//
			SET CURRENT PRINTER:C787($_t_CurrentPrinter)
			SET PRINT OPTION:C733(Scale option:K47:3; $Scale)
			SET PRINT OPTION:C733(Orientation option:K47:2; $Orientation)
		Else 
			$_t_NewPath:=DB_GetDocumentPath
			//here construct the sub folder path
			$_l_TestPath:=Test path name:C476($_t_NewPath)
			//$_t_DocumentName:=Select document("";"*";"";0)
			//$TestPathname2:=$_t_NewPath+$_t_DocumentName
			//$TestPath2:=Test path name($TestPathname2)
			//TRACE
			
			If ($_l_TestPath=Is a folder:K24:2)
				$_t_TimeString:=Time string:C180(Current time:C178*1)
				$_t_TimeString:=Replace string:C233($_t_TimeString; ":"; "-")
				$_t_DocumentName:="ERR_ScreenShot"+String:C10(Year of:C25(Current date:C33))+"-"+String:C10(Month of:C24(Current date:C33))+"-"+String:C10(Day of:C23(Current date:C33))+"-"+$_t_TimeString
				C_BLOB:C604($_blb_PicBLOB)
				PICTURE TO BLOB:C692(DB_pic_Screenshot; $_blb_PicBLOB; "PNTG")
				$_ti_DocumentRef:=DB_CreateDocument($_t_NewPath+$_t_DocumentName+".png")
				If (OK=1)
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					
					BLOB TO DOCUMENT:C526($_t_NewPath+$_t_DocumentName+".png"; $_blb_PicBLOB)
				End if 
			End if 
		End if   //
	End if 
	//
	//TBox_RaZ_Pict(->◊vPict01)
	
	//  `be sure to close the previous screendump
	//$_t_Command:="osascript -e 'tell application \"Preview\" to quit'"
	//LAUNCH EXTERNAL PROCESS($_t_Command)
End if 