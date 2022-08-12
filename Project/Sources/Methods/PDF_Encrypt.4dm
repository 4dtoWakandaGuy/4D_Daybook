//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF_Encrypt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       30/08/2011 23:38 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($PDF_bo_PreventCopy; $PDF_bo_PreventEdit; $PDF_bo_PreventPrinting; $PDF_bo_SetUserPassword; DOC_bo_DOCUserPassword; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; DOC_Pdf_Prevent; PDF_bo_IsLicenced; PDF_bo_PreventCopy)
	C_BOOLEAN:C305(PDF_bo_PreventEdit; PDF_bo_PreventPrinting; PDF_bo_SecurityActive; PDF_bo_UseDOcumentPrefs; PDF_bo_UserPassword)
	C_LONGINT:C283($_l_CharacterPosition; $_l_IsAPath; $_l_Iteration; $_l_OSMaj; $_l_OSMinor; $_l_SpacePosition)
	C_TEXT:C284($_t_Before; $_t_BootVolume; $_t_CommandLine; $_t_DocName2; $_t_DocPathToDelete; $_t_docToPrintPosix; $_t_docToPrintPosix2; $_t_docToPrintPosixReplace; $_t_DocumentName; $_t_DocumentToPrint; $_t_DocumentToPrint2)
	C_TEXT:C284($_t_DocumentToPrintOLD; $_t_DocWithoutExtension; $_t_oldMethodName; $_t_OS; $_t_PasswordOwner; $_t_PasswordUser; $_t_PathName; $_t_PathPosix; $_t_PathSystem; $_t_PreventMessage; $_t_PreventMessage2)
	C_TEXT:C284($_t_PreventMessage3; $_t_script_file_path; $_t_script_folder_path; $_t_SystemFolder; $_t_SystemPath; $_t_TargetVolume; $_t_TestDocumentPath; $0; $1; PDF_T_OwnerPassword)
	C_TIME:C306($_ti_DocumentToPrint)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF_Encrypt")
If (Is macOS:C1572)
	$_t_OS:=DBGetOSVersion
	$_t_OS:=Replace string:C233($_t_OS; "Mac OS™ version "; "")
	$_l_CharacterPosition:=Position:C15("."; $_t_OS)
	
	$_l_OSMaj:=Num:C11(Substring:C12($_t_OS; 1; $_l_CharacterPosition-1))
	$_l_OSMinor:=Num:C11(Substring:C12($_t_OS; $_l_CharacterPosition+1))
	If ($_l_OSMaj>10) | ($_l_OSMinor>6)
		
		$_t_DocumentToPrint:=""
		PDF_EncyptLoadPrefs
		PDF_bo_IsLicenced:=PDF_EncryptVerfifyLicence
		If (PDF_bo_IsLicenced)
			If (PDF_bo_SecurityActive)
				
				If (Count parameters:C259>=1)
					$_t_DocumentToPrint:=$1
				Else 
					$_ti_DocumentToPrint:=Open document:C264(""; ".PDF")
					If ($_ti_DocumentToPrint#?00:00:00?)
						CLOSE DOCUMENT:C267($_ti_DocumentToPrint)
						$_t_DocumentToPrint:=Document
					End if 
				End if 
				$_t_DocumentToPrintOLD:=$_t_DocumentToPrint
				If ($_t_DocumentToPrint#"")
					//check there are on at least 10.5
					//$PosixPath:=/usr/sbin/pdfauxinfo
					$_t_SystemPath:=System folder:C487
					$_l_CharacterPosition:=Position:C15(":"; $_t_SystemPath)
					$_t_SystemPath:=Substring:C12($_t_SystemPath; 1; $_l_CharacterPosition)
					//$_t_SystemPath:=$_t_SystemPath+":"+"usr"+":"+"sbin"+":"+"pdfauxinfo"
					$_t_SystemPath:=$_t_SystemPath+"opt"+":"+"pdflabs:pdftk:bin"+":"+"pdftk"
					$_t_PathPosix:=Replace string:C233($_t_SystemPath; ":"; "/")
					$_l_IsAPath:=Test path name:C476($_t_SystemPath)
					If ($_l_IsAPath<0)
						
						//launch the installer
						$_t_script_folder_path:=Get 4D folder:C485(Current resources folder:K5:16)+"additions:"
						$_t_script_file_path:=$_t_script_folder_path+"Pdftk.mpkg"
						$_t_PathSystem:=Replace string:C233($_t_script_file_path; ":"; "/")  //the POSIX separator
						$_t_TargetVolume:=Substring:C12($_t_PathSystem; 1; Position:C15("/"; $_t_PathSystem)-1)
						$_t_SystemFolder:=System folder:C487(System:K41:1)  //take care of the /Volumes/ syntax
						$_t_BootVolume:=Substring:C12($_t_SystemFolder; 1; Position:C15(":"; $_t_SystemFolder)-1)
						$_t_script_file_path:=Choose:C955($_t_BootVolume=$_t_TargetVolume; Substring:C12($_t_PathSystem; Position:C15("/"; $_t_PathSystem)); "/Volumes/"+$_t_PathSystem)
						
						LAUNCH EXTERNAL PROCESS:C811("open "+$_t_script_file_path)
						
					End if 
					//Convert document to posix
					$_l_CharacterPosition:=Position:C15(".pdf"; $_t_DocumentToPrint)
					If ($_l_CharacterPosition=0)
						$_t_DocumentToPrint2:=$_t_DocumentToPrint
						$_t_DocumentToPrint:=$_t_DocumentToPrint+".pdf"
						COPY DOCUMENT:C541($_t_DocumentToPrint2; $_t_DocumentToPrint)
					End if 
					$_t_DocumentName:=DocNameFromPath($_t_DocumentToPrint)
					$_t_PathName:=PathFromPathName($_t_DocumentToPrint)
					$_t_docToPrintPosix:=Replace string:C233($_t_PathName; ":"; "/")  //the POSIX separator
					$_t_PathSystem:=Replace string:C233($_t_PathName; ":"; "/")  //the POSIX separator
					$_t_TargetVolume:=Substring:C12($_t_PathSystem; 1; Position:C15("/"; $_t_PathSystem)-1)
					$_t_SystemFolder:=System folder:C487(System:K41:1)  //take care of the /Volumes/ syntax
					$_t_BootVolume:=Substring:C12($_t_SystemFolder; 1; Position:C15(":"; $_t_SystemFolder)-1)
					
					$_t_docToPrintPosix:=Choose:C955($_t_BootVolume=$_t_TargetVolume; Substring:C12($_t_docToPrintPosix; Position:C15("/"; $_t_PathSystem)); "/Volumes/"+$_t_docToPrintPosix)
					$_t_PathPosix:=Choose:C955($_t_BootVolume=$_t_TargetVolume; Substring:C12($_t_PathPosix; Position:C15("/"; $_t_PathSystem)); "/Volumes/"+$_t_PathPosix)
					$_t_DocWithoutExtension:=Substring:C12($_t_DocumentName; 1; Length:C16($_t_DocumentName)-4)
					$_t_DocumentName:=$_t_DocWithoutExtension+".pdf"
					$_l_CharacterPosition:=Position:C15("."; $_t_DocWithoutExtension)
					$_l_SpacePosition:=Position:C15(" "; $_t_DocWithoutExtension)
					If ($_l_CharacterPosition>0) | ($_l_SpacePosition>0)
						$_t_DocName2:=(Replace string:C233($_t_DocWithoutExtension; "."; "_"))
						$_t_DocName2:=(Replace string:C233($_t_DocWithoutExtension; " "; "_"))+".PDF"
						$_t_DocumentName:=Replace string:C233($_t_DocWithoutExtension; "."; "_")
						$_t_DocumentName:=Replace string:C233($_t_DocWithoutExtension; " "; "_")+".PDF"
						$_t_DocumentToPrint2:=$_t_DocumentToPrint
						$_t_DocumentToPrint:=$_t_PathName+$_t_DocName2
						$_t_DocName2:=Replace string:C233($_t_DocName2; ".PDF"; "")+".PDF"
						$_l_Iteration:=0
						Repeat 
							$_t_TestDocumentPath:=$_t_DocumentToPrint
							$_l_IsAPath:=Test path name:C476($_t_TestDocumentPath)
							If ($_l_IsAPath>0)
								$_l_Iteration:=$_l_Iteration+1
								$_t_DocumentToPrint:=$_t_PathName+Replace string:C233($_t_DocumentName; ".PDF"; "")+"_"+String:C10($_l_Iteration)+".PDF"
								$_t_DocName2:=Replace string:C233($_t_DocumentName; ".PDF"; "")+"_"+String:C10($_l_Iteration)+".PDF"
							End if 
						Until ($_l_IsAPath<0)
						COPY DOCUMENT:C541($_t_DocumentToPrint2; $_t_DocumentToPrint)
					Else 
						$_t_DocName2:=$_t_DocWithoutExtension
					End if   //dont forget to delete this one after so we go back to the . version
					
					$_t_docToPrintPosix2:=$_t_docToPrintPosix+$_t_DocumentName
					$_t_docToPrintPosixReplace:=$_t_docToPrintPosix+"_"+$_t_DocumentName
					$_t_docToPrintPosix:=$_t_docToPrintPosix2
					$_t_DocPathToDelete:=$_t_PathName+"_"+$_t_DocumentName
					$_t_PasswordUser:=""
					If ($_t_PasswordUser#"") | (OK=1)
						$_t_PasswordOwner:=PDF_T_OwnerPassword
						If (PDF_bo_UseDOcumentPrefs)
							$PDF_bo_PreventCopy:=DOC_bo_PDFPreventCopy
							$PDF_bo_PreventEdit:=PDF_bo_PreventEdit
							$PDF_bo_PreventPrinting:=PDF_bo_PreventPrinting
							$PDF_bo_SetUserPassword:=DOC_bo_DOCUserPassword
						Else 
							$PDF_bo_PreventCopy:=PDF_bo_PreventCopy | DOC_bo_PDFPreventCopy
							$PDF_bo_PreventEdit:=PDF_bo_PreventEdit
							$PDF_bo_PreventPrinting:=PDF_bo_PreventPrinting
							$PDF_bo_SetUserPassword:=PDF_bo_UserPassword
						End if 
						If ($PDF_bo_SetUserPassword)
							$_t_PasswordUser:=Gen_Request("Enter Document password for users"; "")
						End if 
						
						
						//PDF_bo_PreventCopy:=True
						//PDF_bo_PreventPrinting:=False
						If ($PDF_bo_PreventCopy)
							$_t_PreventMessage:=""
						Else 
							$_t_PreventMessage:=" CopyContents"
						End if 
						If ($PDF_bo_PreventEdit)
							$_t_PreventMessage3:=""
						Else 
							$_t_PreventMessage3:=" ModifyContents"
						End if 
						If ($PDF_bo_PreventPrinting)
							$_t_PreventMessage2:=""
						Else 
							$_t_PreventMessage2:=" printing"
						End if 
						If ($_t_PasswordUser#"")
							$_t_PasswordUser:=" user_pw "+$_t_PasswordUser
						Else 
							$_t_PasswordUser:=""
						End if 
						$_t_Before:="_"
						Repeat 
							$_t_TestDocumentPath:=$_t_PathName+$_t_Before+$_t_DocName2
							$_l_IsAPath:=Test path name:C476($_t_TestDocumentPath)
							If ($_l_IsAPath>0)
								$_t_Before:=$_t_Before+"_"
							End if 
						Until ($_l_IsAPath<0)
						$_t_DocPathToDelete:=$_t_PathName+$_t_Before+$_t_DocName2
						$_t_CommandLine:=$_t_PathPosix+" "+$_t_DocumentName+" output "+$_t_Before+$_t_DocName2+" owner_pw "+$_t_PasswordOwner+$_t_PasswordUser+" allow "+$_t_PreventMessage2+$_t_PreventMessage+$_t_PreventMessage3
						SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY"; $_t_PathName)
						LAUNCH EXTERNAL PROCESS:C811($_t_CommandLine)
						If ($_t_DocumentToPrintOLD#$_t_DocumentToPrint)
							COPY DOCUMENT:C541($_t_DocPathToDelete; $_t_DocumentToPrintOLD; *)
							DELETE DOCUMENT:C159($_t_DocPathToDelete)
							DELETE DOCUMENT:C159($_t_DocumentToPrint)
						Else 
							COPY DOCUMENT:C541($_t_DocPathToDelete; $_t_DocumentToPrint; *)
							DELETE DOCUMENT:C159($_t_DocPathToDelete)
						End if 
						$0:=$_t_DocumentToPrint
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
$0:=$_t_DocumentToPrint
ERR_MethodTrackerReturn("PDF_Encrypt"; $_t_oldMethodName)