//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_Cont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>MultiCo; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; cList; rCont; vNo; vO; vP; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAnalysis; vOmit; vSource; vSource_; vStatus; vType; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_Cont")
//Mail_Cont
Start_Process
Start_ProcMail
Contacts_File
READ ONLY:C145([CONTACTS:1])
READ ONLY:C145([COMPANIES:2])
rCont:=1
While (vO=1)
	DB_t_CurrentFormUsage:="Omit"
	Cont_Sel
	If (vO=1)
		If (Records in selection:C76([CONTACTS:1])>0)
			vNo:=Records in selection:C76([CONTACTS:1])
			ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Company_Code:1; >; [CONTACTS:1]Forename:4; >; [CONTACTS:1]Title:3; >)
			DB_t_CurrentFormUsage:="Print"
			
			Open_Pro_Window("Mail_Contacts"; 0; 1; ->[CONTACTS:1]; WIN_t_CurrentOutputform)
			
			DISPLAY SELECTION:C59([CONTACTS:1]; *)  //NG may 2004 added table
			If (OK=1)
				If (Records in set:C195("userset")>0)
					USE SET:C118("userset")
				End if 
				
				vNo:=Records in selection:C76([CONTACTS:1])
				
				MAsk_Print(->[CONTACTS:1])
				
				
				If (vP=1)
					If (<>MultiCo)
						vType:=""
						vStatus:=""
						vSource:=""
						vOmit:=""
						vAnalysis:=""
						vSource_:=""
						Open_AnyTypeWindow(258; 483; 5; "Company Requirements")
						DIALOG:C40([DOCUMENTS:7]; "dAsk_Comp")
						$_l_OK:=OK
						OK:=1
						CLOSE WINDOW:C154
						If (WIN_bo_TrackerInited)
							$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
							If ($_l_WindowReferenceRow>0)
								WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
							End if 
						End if 
					Else 
						$_l_OK:=1
					End if 
					If ($_l_OK=1)
						
						MAsk_MS(->[CONTACTS:1])
						If (OK=1)
							If (cList=1)
								FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_List")
								MList_Print(->[CONTACTS:1])
							End if 
							MailP_Let(->[CONTACTS:1])
							MailP_Lab(->[CONTACTS:1])
							MailP_Env(->[CONTACTS:1])
							MailP_Exp(->[CONTACTS:1])
						End if 
					End if 
				End if 
			End if 
			Close_ProWin
			vO:=0
		Else 
			Gen_None("Contacts"; ->vO)
		End if 
	End if 
End while 
Process_End
ERR_MethodTrackerReturn("Mail_Cont"; $_t_oldMethodName)