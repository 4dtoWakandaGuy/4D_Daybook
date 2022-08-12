//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MailP_LetFax
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>Faxing; $_bo_company; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>FaxMode; <>SYS_l_CancelProcess; $_l_Error; $_l_WindowReferenceRow; First; rDiary; rState; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_CurrentTable; $1)
	C_TEXT:C284($_t_From; $_t_oldMethodName; vFrom; vOurRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_LetFax")
$_ptr_CurrentTable:=$1
If ((<>FaxMode>0) & (Is Windows:C1573))
	
	If (Not:C34(Macro_AccTypeDEF("Efax_SendLetter")))
		MailP_Ready("Are you ready to Fax?")
		If (OK=1)
			$_l_Error:=0
			Case of 
				: (<>FaxMode=1)
					$_l_Error:=Fax_FEStartM1("Document")
				: (<>FaxMode=2)
					$_l_Error:=Fax_SPStartM1("Document")
			End case 
			
			If ($_l_Error=0)
				<>Faxing:=True:C214
				If (Records in selection:C76($_ptr_CurrentTable->)>1)
					Gen_Confirm("Where both Company and Contact Fax Nos are found, which do you want to Fax to?"; "Contact"; "Company")
					$_bo_company:=(OK=0)
				Else 
					$_bo_company:=False:C215
				End if 
				First:=0
				If (OK=1)
					// Check_Pages
					If (OK=1)
						If (Records in selection:C76($_ptr_CurrentTable->)>1)
							Open_PrD_Window("Faxing")
							MESSAGE:C88(Char:C90(13))
						End if 
						FIRST RECORD:C50($_ptr_CurrentTable->)
						Mail_MSRec
						
						While ((Not:C34(End selection:C36($_ptr_CurrentTable->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
							Case of 
								: (rDiary=1)
									$_t_From:=vFrom
									Letter_LoadD
									RELATE ONE:C42([DIARY:12]Company_Code:1)
									RELATE ONE:C42([DIARY:12]Contact_Code:2)
									vOurRef:=[DIARY:12]Company_Code:1+"-"+[DIARY:12]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
									MCont_Add("")
									If (Letter_FaxSetup($_bo_company; $_ptr_CurrentTable)=0)
										Letter_Print([DOCUMENTS:7]Document_Code:1)
										Letter_AllocD([DOCUMENTS:7]Document_Code:1)
									End if 
									vFrom:=$_t_From
								: (rState>1)
									RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
									Letter_LoadI
									MState_Calc2
									vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
									MCont_Add("")
									If (Letter_FaxSetup($_bo_company)=0)
										Letter_Print([DOCUMENTS:7]Document_Code:1)
										Letter_Alloc([DOCUMENTS:7]Document_Code:1)
										If (rState=2)
											LOAD RECORD:C52([INVOICES:39])
											[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
											DB_SaveRecord(->[INVOICES:39])
										Else 
											FIRST RECORD:C50([INVOICES:39])
											While (Not:C34(End selection:C36([INVOICES:39])))
												[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
												DB_SaveRecord(->[INVOICES:39])
												NEXT RECORD:C51([INVOICES:39])
											End while 
										End if 
									End if 
								Else 
									Letter_AllDets(True:C214)
									If (Letter_FaxSetup($_bo_company)=0)
										Letter_Print([DOCUMENTS:7]Document_Code:1)
										Letter_Alloc([DOCUMENTS:7]Document_Code:1)
									End if 
							End case 
							If (<>FaxMode=2)
								Fax_SPEndM2([COMPANIES:2]Company_Name:2)
							End if 
							NEXT RECORD:C51($_ptr_CurrentTable->)
							Mail_MSRec
						End while 
						If (Records in selection:C76>1)
							CLOSE WINDOW:C154
							If (WIN_bo_TrackerInited)
								$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
								If ($_l_WindowReferenceRow>0)
									WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
								End if 
							End if 
							
						End if 
					End if 
				End if 
				Case of 
					: (<>FaxMode=1)
						PLUGCALL_Chooser("SetChooser")
						
						
					: (<>FaxMode=2)
						Fax_SPEndM1
				End case 
			Else 
				If ($_l_Error#9999)
					Gen_Alert("The Fax software is not responding")
				End if 
			End if 
		End if 
	End if 
Else 
	If (Not:C34(Macro_AccTypeDEF("Efax_SendLetter")))
		Gen_Alert("Fax software is not available")
	End if 
	
End if 
<>Faxing:=False:C215
ERR_MethodTrackerReturn("MailP_LetFax"; $_t_oldMethodName)
