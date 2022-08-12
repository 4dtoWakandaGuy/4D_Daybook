//%attributes = {}
If (False:C215)
	//Project Method Name:      MList_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 15:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_LONGINT:C283($_l_Email; $_l_OK; $L; bd4)
	C_POINTER:C301($1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $CURPDRIVER; $CURPTYPE; DOC_PATHNAME; DocPathName; PDF_t_CURPDriver; PDF_t_CURPName; PDF_t_CURPType; PDF_t_CURPZone)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MList_Print")
Gen_Confirm("Are you ready to Print the List?"; "Yes"; "No")
If (OK=1)
	If (Bd4=1)
		$_l_Email:=EmailCheckPDFWriter(1)
		If ($_l_Email>0)
			Gen_Confirm("Attach The printed list to an email?"; "Yes"; "No")
		End if 
		If (ok=1)
			//switch to PDf Writer and Print the selection
			$_l_OK:=PLUGCALL_PDFs("GETPRINTER"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
			
			$_l_OK:=SetMachinePDFWriter(<>PER_t_CurrentUserInitials)
			
			$_l_OK:=PLUGCALL_PDFs("GETPATH"; ->DOC_PATHNAME)
			$L:=PLUGCALL_PDFs("Define"; ->DocPathName)
			PRINT SELECTION:C60($1->)
			$_l_OK:=PLUGCALL_PDFs("SETPRINTER"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
			
			//we now have a document-add to attachments
			INSERT IN ARRAY:C227(WS_at_Attachments; Size of array:C274(WS_at_Attachments)+1; 1)
			INSERT IN ARRAY:C227(WS_at_AttachmentsPath; Size of array:C274(WS_at_AttachmentsPath)+1; 1)
			INSERT IN ARRAY:C227(WS_al_EmailID; Size of array:C274(WS_al_EmailID)+1; 1)
			INSERT IN ARRAY:C227(SD3_at_DocDiaryCode; Size of array:C274(SD3_at_DocDiaryCode)+1; 1)
			WS_at_AttachmentsPath{Size of array:C274(WS_at_AttachmentsPath)}:=Doc_PathName
			WS_at_Attachments{Size of array:C274(WS_at_Attachments)}:=FileNamefromPath(Doc_Pathname)
		Else 
			PRINT SELECTION:C60($1->)
		End if 
		
	Else 
		PRINT SELECTION:C60($1->)
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("MList_Print"; $_t_oldMethodName)
