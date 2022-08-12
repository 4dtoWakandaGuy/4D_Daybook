//%attributes = {}
If (False:C215)
	//Project Method Name:      MailP_Env
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 12:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_OK; cEnvelopes; rComp; rCont; rContr; rDiary; rOrd; rState)
	C_POINTER:C301($_ptr_CurrentTable; $1)
	C_TEXT:C284($_t_oldMethodName; vOurRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_Env")
//MailP_Env
<>SYS_l_CancelProcess:=0
vOurRef:=""
$_ptr_CurrentTable:=$1
If (cEnvelopes=1)
	MailP_Ready("Are you ready to Print Envelopes? ")
	$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Envelopes")
	If ($_l_OK>=0)
		If ($_l_OK=1)
			PRINT SETTINGS:C106
			$_l_OK:=OK
		Else 
			$_l_OK:=1
		End if 
		If ($_l_OK=1)
			//  PRINT SETTINGS
			If (OK=1)
				Check_Envelopes
				If (OK=1)
					FIRST RECORD:C50($_ptr_CurrentTable->)
					Mail_MSRec
					While ((Not:C34(End selection:C36($_ptr_CurrentTable->))) & (<>SYS_l_CancelProcess#Current process:C322))
						Mail_MSOurRef
						Case of 
							: (rComp=1)
								MComp_Add("L")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								NEXT RECORD:C51($_ptr_CurrentTable->)
								Mail_MSRec
							: (rCont=1)
								MContComp_Calc
								MCont_Add("L")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								MZComp
							: (rDiary=1)
								RELATE ONE:C42([DIARY:12]Company_Code:1)
								RELATE ONE:C42([DIARY:12]Contact_Code:2)
								MCont_Add("L")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								MZDiary
							: (rContr=1)
								RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
								RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
								MCont_Add("")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								MZContr
							: (rOrd>0)
								If (rOrd=2)
									RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
								End if 
								RELATE ONE:C42([ORDERS:24]Company_Code:1)
								RELATE ONE:C42([ORDERS:24]Contact_Code:2)
								MCont_Add("")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								MZOrd
							: ((rState=1) | (rState=3))
								MState_CalcRel
								MCont_Add("L")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								NEXT RECORD:C51($_ptr_CurrentTable->)
								Mail_MSRec
							: (rState=2)
								RELATE ONE:C42([INVOICES:39]Company_Code:2)
								RELATE ONE:C42([INVOICES:39]Contact_Code:3)
								MCont_Add("")
								Print form:C5([DOCUMENTS:7]; "Mail_Envelope")
								PAGE BREAK:C6
								Mail_LetAlloc("Envelope")
								MZInv
								
						End case 
					End while 
					PRT_SetPrinterPaperOptions("Envelopes")  //NG June 2005
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("MailP_Env"; $_t_oldMethodName)
