//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_prefsLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_prefsLoad
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	C_BOOLEAN:C305(DOC_bo_CopyToprinter)
	C_LONGINT:C283($_l_Offset; $_l_Parameters; $_l_PreferencesID; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoEmail_copy; DOC_l_docDoPdf; DOC_l_DocDoPDFcopy; DOC_l_DocDoPrint; DOC_l_DoPrintCopy)
	C_OBJECT:C1216($_obj_ReportPreferences)
	C_POINTER:C301($_Ptr_AndPrint; $_ptr_DocEmail; $_ptr_DocPDF; $_Ptr_DocPrint; $_ptr_DocumentName; $_ptr_EmailBody; $_ptr_EmailFrom; $_ptr_EmailTitle; $_ptr_EMailTo; $_ptr_EmailToRole; $_ptr_TemplateCode)
	C_POINTER:C301($10; $11; $12; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DocumentCode; $_t_EmailRoleTo; $_t_EmailTo; $_t_oldMethodName; $_t_PreferencesName; $_t_TextBody; $1; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport)
	C_TEXT:C284(DOC_t_EmailFrom; DOC_t_EmailSubject; DOC_t_OutputFolderPath; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_prefsLoad")  //moved to top of method 30/10/07 -kmw
$_l_Parameters:=Count parameters:C259
If ($_l_Parameters>0)
	$_t_DocumentCode:=$1
Else 
	$_t_DocumentCode:=[DOCUMENTS:7]Document_Code:1
End if 

//$_ptr_EMailTo

If ($_l_Parameters>=2)
	$_ptr_TemplateCode:=$2
	
	If ($_l_Parameters>=3)
		$_Ptr_DocPrint:=$3
		If ($_l_Parameters>=4)
			$_ptr_DocPDF:=$4
			If ($_l_Parameters>=5)
				$_ptr_DocEmail:=$5
				If ($_l_Parameters>=6)
					$_Ptr_AndPrint:=$6
					If ($_l_Parameters>=7)
						$_ptr_DocumentName:=$7
						If ($_l_Parameters>=8)
							//ALERT((String(Type($8->)))+"__1")
							$_ptr_EmailFrom:=$8
							If ($_l_Parameters>=9)
								$_ptr_EmailTitle:=$9
								If ($_l_Parameters>=10)
									$_ptr_EmailBody:=$10
									If ($_l_Parameters>=11)
										//ALERT(String(Type($11->))+"_param11")
										
										$_ptr_EMailTo:=$11
										//ALERT(String(Type($_ptr_EMailTo->))+"_1")
										
										If ($_l_Parameters>=12)
											$_ptr_EmailToRole:=$12
										Else 
											$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
										End if 
									Else 
										//ALERT(String(Type(Rep_t_docEmailToTxt))+"_1A")
										
										$_ptr_EMailTo:=->Rep_t_docEmailToTxt
										$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
									End if 
								Else 
									$_ptr_EmailBody:=->DOC_t_EmailBodyReport
									//ALERT(String(Type(Rep_t_docEmailToTxt))+"_1B")
									
									$_ptr_EMailTo:=->Rep_t_docEmailToTxt
									$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
								End if 
							Else 
								$_ptr_EmailTitle:=->DOC_t_EmailSubject
								$_ptr_EmailBody:=->DOC_t_EmailBodyReport
								$_ptr_EMailTo:=->Rep_t_docEmailToTxt
								$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
							End if 
						Else 
							//ALERT(DOC_t_DocEmailFrom+"__2")
							$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
							$_ptr_EmailTitle:=->DOC_t_EmailSubject
							$_ptr_EmailBody:=->DOC_t_EmailBodyReport
							//ALERT(String(Type(Rep_t_docEmailToTxt))+"_2")
							$_ptr_EMailTo:=->Rep_t_docEmailToTxt
							$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
						End if 
					Else 
						$_ptr_DocumentName:=->DOC_t_DocumentName
						//ALERT(DOC_t_DocEmailFrom+"__3")
						$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
						$_ptr_EmailTitle:=->DOC_t_EmailSubject
						$_ptr_EmailBody:=->DOC_t_EmailBodyReport
						//ALERT(String(Type(Rep_t_docEmailToTxt))+"_3")
						$_ptr_EMailTo:=->Rep_t_docEmailToTxt
						$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
					End if 
				Else 
					$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
					$_ptr_DocumentName:=->DOC_t_DocumentName
					//ALERT(DOC_t_DocEmailFrom+"__4")
					$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
					$_ptr_EmailTitle:=->DOC_t_EmailSubject
					$_ptr_EmailBody:=->DOC_t_EmailBodyReport
					//ALERT(String(Type(Rep_t_docEmailToTxt))+"_4")
					$_ptr_EMailTo:=->Rep_t_docEmailToTxt
					$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
				End if 
			Else 
				$_ptr_DocEmail:=->DOC_l_docDoEmail
				$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
				$_ptr_DocumentName:=->DOC_t_DocumentName
				//ALERT(DOC_t_DocEmailFrom+"__5")
				$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
				$_ptr_EmailTitle:=->DOC_t_EmailSubject
				$_ptr_EmailBody:=->DOC_t_EmailBodyReport
				//ALERT(String(Type(Rep_t_docEmailToTxt))+"_5")
				$_ptr_EMailTo:=->Rep_t_docEmailToTxt
				$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
			End if 
		Else 
			$_ptr_DocPDF:=->DOC_l_docDoPdf
			$_ptr_DocEmail:=->DOC_l_docDoEmail
			$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
			$_ptr_DocumentName:=->DOC_t_DocumentName
			//ALERT(DOC_t_DocEmailFrom+"__6")
			$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
			$_ptr_EmailTitle:=->DOC_t_EmailSubject
			$_ptr_EmailBody:=->DOC_t_EmailBodyReport
			//ALERT(String(Type(Rep_t_docEmailToTxt))+"_6")
			$_ptr_EMailTo:=->Rep_t_docEmailToTxt
			$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
		End if 
	Else 
		$_Ptr_DocPrint:=->DOC_l_DocDoPrint
		$_ptr_DocPDF:=->DOC_l_docDoPdf
		$_ptr_DocEmail:=->DOC_l_docDoEmail
		$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
		$_ptr_DocumentName:=->DOC_t_DocumentName
		//ALERT(DOC_t_DocEmailFrom+"__7")
		$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
		$_ptr_EmailTitle:=->DOC_t_EmailSubject
		$_ptr_EmailBody:=->DOC_t_EmailBodyReport
		//ALERT(String(Type(Rep_t_docEmailToTxt))+"_7")
		$_ptr_EMailTo:=->Rep_t_docEmailToTxt
		$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
	End if 
Else 
	$_ptr_TemplateCode:=->DOC_t_TemplateCode
	$_Ptr_DocPrint:=->DOC_l_DocDoPrint
	$_ptr_DocPDF:=->DOC_l_docDoPdf
	$_ptr_DocEmail:=->DOC_l_docDoEmail
	$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
	$_ptr_DocumentName:=->DOC_t_DocumentName
	//ALERT(DOC_t_DocEmailFrom+"__8")
	$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
	$_ptr_EmailTitle:=->DOC_t_EmailSubject
	$_ptr_EmailBody:=->DOC_t_EmailBodyReport
	//ALERT(String(Type(Rep_t_docEmailToTxt))+"_8")
	$_ptr_EMailTo:=->Rep_t_docEmailToTxt
	$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
	DOC_l_DocDoPrint:=1
	DOC_l_docDoPdf:=0
	DOC_l_docDoEmail:=0
	DOC_t_TemplateCode:=""
	DOC_t_DocumentName:=""
	DOC_t_DocEmailFrom:=""
	DOC_t_EmailSubject:=""
	DOC_t_EmailBodyReport:=""
	DOC_t_OutputFolderPath:=""
	DOC_t_EmailBodyReport:=""
	Rep_t_docEmailToTxt:=""
	EMAIL_t_DocEmailRoletoText:=""
	DOC_l_CopyToPrinter:=0  // This only comes into play when the print is to email
	
End if 

$_ptr_TemplateCode->:=""
$_Ptr_DocPrint->:=1
$_ptr_DocPDF->:=0
$_ptr_DocEmail->:=0
$_Ptr_AndPrint->:=0
$_ptr_DocumentName->:=""
//ALERT(String(Type($_ptr_EmailFrom->)))

$_ptr_EmailFrom->:=""
//ALERT(String(Type(DOC_t_DocEmailFrom)))

$_ptr_EmailTitle->:=""
$_ptr_EmailBody->:=""
//ALERT(String(Type($_ptr_EMailTo->)))

$_ptr_EMailTo->:=""
$_ptr_EmailToRole->:=""

DOC_t_OutputFolderPath:=""




If ($_t_DocumentCode#"")
	$_t_PreferencesName:="SRP_"+$_t_DocumentCode+"_All"
	$_l_Offset:=0
	//
	While (Semaphore:C143("LoadDocPrefs"))
		DelayTicks
	End while 
	$_l_PreferencesID:=PREF_GetPreferenceID($_t_PreferencesName)
	//
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_PreferencesID
		SAVE RECORD:C53([PREFERENCES:116])
	End if 
	
	
	READ ONLY:C145([PREFERENCES:116])
	
	SET QUERY LIMIT:C395(1)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)
	SET QUERY LIMIT:C395(0)
	OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_Properties; $_al_PropertyTypes)
	If (Find in array:C230($_at_Properties; "TemplateCode")<0)
		
		
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
			Expand_BlobPtr(->[PREFERENCES:116]DataBlob:2)
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_TemplateCode->; $_l_Offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_Ptr_DocPrint->; $_l_Offset)
				
				
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_DocPDF->; $_l_Offset)
					
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_DocEmail->; $_l_Offset)
						
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_DocumentName->; $_l_Offset)
							
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_EmailFrom->; $_l_Offset)
								
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_EmailTitle->; $_l_Offset)
									
									
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_TextBody; $_l_Offset)
										If (Type:C295($_t_TextBody)=Is text:K8:3)
											$_ptr_EmailBody->:=$_t_TextBody
										End if 
										
										//
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_EmailTo; $_l_Offset)
											If (Type:C295($_t_EmailTo)=Is text:K8:3)
												$_ptr_EMailTo->:=$_t_EmailTo
											End if 
											
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_EmailRoleTo; $_l_Offset)
												If (Type:C295($_t_EmailRoleTo)=Is text:K8:3)
													$_ptr_EmailToRole->:=$_t_EmailRoleTo
												End if 
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_Ptr_AndPrint->; $_l_Offset)
													
												End if 
												
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					
					
				End if 
			End if 
		End if 
	Else 
		$_obj_ReportPreferences:=[PREFERENCES:116]DataObject:8
		$_ptr_TemplateCode->:=OB Get:C1224($_obj_ReportPreferences; "TemplateCode")
		If (Find in array:C230($_at_Properties; "DocumentPrint")>0)
			$_Ptr_DocPrint->:=OB Get:C1224($_obj_ReportPreferences; "DocumentPrint")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentMakePDF")>0)
			$_ptr_DocPDF->:=OB Get:C1224($_obj_ReportPreferences; "DocumentMakePDF")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentSendEmail")>0)
			$_ptr_DocEmail->:=OB Get:C1224($_obj_ReportPreferences; "DocumentSendEmail")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentAndPrint")>0)
			$_Ptr_AndPrint->:=OB Get:C1224($_obj_ReportPreferences; "DocumentAndPrint")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentName")>0)
			$_ptr_DocumentName->:=OB Get:C1224($_obj_ReportPreferences; "DocumentName")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentFromPerson")>0)
			$_ptr_EmailFrom->:=OB Get:C1224($_obj_ReportPreferences; "DocumentFromPerson")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentEmailTitle")>0)
			$_ptr_EmailTitle->:=OB Get:C1224($_obj_ReportPreferences; "DocumentEmailTitle")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentEmailBody")>0)
			$_ptr_EmailBody->:=OB Get:C1224($_obj_ReportPreferences; "DocumentEmailBody")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentToEmail")>0)
			$_ptr_EMailTo->:=OB Get:C1224($_obj_ReportPreferences; "DocumentToEmail")
		End if 
		If (Find in array:C230($_at_Properties; "DocumentToRole")>0)
			$_ptr_EmailToRole->:=OB Get:C1224($_obj_ReportPreferences; "DocumentToRole")
		End if 
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	If (False:C215)
		//now load the user specific preferences
		$_t_PreferencesName:="SRP_"+$_t_DocumentCode+"_"+<>PER_t_CurrentUserInitials
		$_l_PreferencesID:=PREF_GetPreferenceID($_t_PreferencesName)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_PreferencesID
			SAVE RECORD:C53([PREFERENCES:116])
		End if 
		
		
		READ ONLY:C145([PREFERENCES:116])
		
		SET QUERY LIMIT:C395(1)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)
		SET QUERY LIMIT:C395(0)
		
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
			Expand_BlobPtr(->[PREFERENCES:116]DataBlob:2)
			$_l_Offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_t_OutputFolderPath; $_l_Offset)
			
		End if 
		
		UNLOAD RECORD:C212([PREFERENCES:116])
	End if 
	CLEAR SEMAPHORE:C144("LoadDocPrefs")
	//ERR_MethodTrackerReturn ("Reports_prefsLoad";$_t_oldMethodName)        `moved to bottom of method 30/10/07 -kmw
	
	DOC_l_DoPrintCopy:=$_Ptr_DocPrint->
	DOC_l_DocDoPDFcopy:=$_ptr_DocPDF->
	DOC_l_docDoEmail_copy:=$_ptr_DocEmail->
	DOC_bo_CopyToprinter:=($_Ptr_AndPrint->=1)
	Reports_SetPrefInterface(($_ptr_DocPDF->=1); ($_Ptr_AndPrint->=1))
	
	
	
	
End if 
ERR_MethodTrackerReturn("Reports_prefsLoad"; $_t_oldMethodName)  //moved to bottom of method 30/10/07 -kmw
