If (False:C215)
	//object Name: [DIARY]Diary_InDocument.Scrollable Area1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_LONGINT:C283($l_thermo)
	C_TEXT:C284($_t_ConvertedPath; $_t_DocumentPath2; $_t_input; $_t_oldMethodName; $_t_OriginalPath; $_t_SepChar)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InDocument.Scrollable Area1"; Form event code:C388)

Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		If ([DIARY:12]Email_ID:41>0)  //Email sent before so file is on server
			
			
			//First we should test the path
			If (Test path name:C476(WS_at_AttachmentsPath{WS_at_Attachments})=Is a document:K24:1)
				//$err:=AP Sublaunch (WS_at_AttachmentsPath{WS_at_Attachments})
				If (Is macOS:C1572)
					$_t_DocumentPath2:=WS_at_AttachmentsPath{WS_at_Attachments}
					//$tempcreator:=_o_Document creator($_t_DocumentPath2)
					//$temptype:=_o_Document type($_t_DocumentPath2)
					$_t_OriginalPath:=$_t_DocumentPath2
					$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; ":"; "/")
					$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; " "; "\\ ")
					$_t_ConvertedPath:="/Volumes/"+$_t_OriginalPath
					$_t_DocumentPath2:=$_t_ConvertedPath
					$_t_input:=""
					$_t_SepChar:="\""
					$_t_DocumentPath2:=$_t_SepChar+$_t_DocumentPath2+$_t_SepChar
					LAUNCH EXTERNAL PROCESS:C811("open "+$_t_DocumentPath2)
					
				Else 
					$_t_DocumentPath2:=WS_at_AttachmentsPath{WS_at_Attachments}
					SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
					LAUNCH EXTERNAL PROCESS:C811("cmd.exe /C start \"\" \""+$_t_DocumentPath2+"\"")
					
					//$err:=AP ShellExecute (WS_at_AttachmentsPath{WS_at_Attachments};0)
				End if 
			Else 
				$l_thermo:=OPEN_THERMOMETER("Opening document please wait...")
				SET_THERMOMETER("Opening document please wait..."; 10)
				$_t_DocumentPath2:=Email_Attachment_From_Server(WS_at_Attachments{WS_at_Attachments}; WS_at_AttachmentsPath{WS_at_Attachments})
				
				If (Test path name:C476($_t_DocumentPath2)=Is a document:K24:1)
					If (Is macOS:C1572)
						
						//$tempcreator:=_o_Document creator($_t_DocumentPath2)
						//$temptype:=_o_Document type($_t_DocumentPath2)
						$_t_OriginalPath:=$_t_DocumentPath2
						$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; ":"; "/")
						$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; " "; "\\ ")
						$_t_ConvertedPath:="/Volumes/"+$_t_OriginalPath
						$_t_DocumentPath2:=$_t_ConvertedPath
						$_t_input:=""
						$_t_SepChar:="\""
						$_t_DocumentPath2:=$_t_SepChar+$_t_DocumentPath2+$_t_SepChar
						LAUNCH EXTERNAL PROCESS:C811("open "+$_t_DocumentPath2)
						
					Else 
						
						SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
						LAUNCH EXTERNAL PROCESS:C811("cmd.exe /C start \"\" \""+$_t_DocumentPath2+"\"")
						
						
						//$err:=AP ShellExecute ($_t_DocumentPath2;0)
						
					End if 
				Else 
					SET_THERMOMETER("Sorry document not found!"; 100)
					DelayTicks(60*2)
				End if 
				CLOSE_THERMOMETER
			End if 
		Else   //else file is still here on client
			
			If (Test path name:C476(WS_at_AttachmentsPath{WS_at_Attachments})=Is a document:K24:1)
				//$err:=AP Sublaunch (WS_at_AttachmentsPath{WS_at_Attachments})
				If (Is macOS:C1572)
					$_t_DocumentPath2:=WS_at_AttachmentsPath{WS_at_Attachments}
					//$tempcreator:=_o_Document creator($_t_DocumentPath2)
					//$temptype:=_o_Document type($_t_DocumentPath2)
					$_t_OriginalPath:=$_t_DocumentPath2
					$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; ":"; "/")
					$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; " "; "\\ ")
					$_t_ConvertedPath:="/Volumes/"+$_t_OriginalPath
					$_t_DocumentPath2:=$_t_ConvertedPath
					$_t_input:=""
					$_t_SepChar:="\""
					$_t_DocumentPath2:=$_t_SepChar+$_t_DocumentPath2+$_t_SepChar
					LAUNCH EXTERNAL PROCESS:C811("open "+$_t_DocumentPath2)
					
				Else 
					$_t_DocumentPath2:=WS_at_AttachmentsPath{WS_at_Attachments}
					SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
					LAUNCH EXTERNAL PROCESS:C811("cmd.exe /C start \"\" \""+$_t_DocumentPath2+"\"")
					
					//$err:=AP ShellExecute (WS_at_AttachmentsPath{WS_at_Attachments};0)
				End if 
			Else 
				If (Get_Email_Owner=[EMAIL_ATTACHMENTS:103]Location:6)
					//        ALERT("Sorry cannot open attachment because this email is not sent and t
					Gen_Alert("Sorry cannot open attachment because this email is not sent and the "+"attachment doesn't exist on this machine!")
				End if 
			End if 
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ:Diary_InEmail,WS_at_Attachments"; $_t_oldMethodName)
