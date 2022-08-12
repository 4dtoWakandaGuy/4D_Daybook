//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_Comp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cList)
	//C_UNKNOWN(rComp)
	//C_UNKNOWN(vC)
	//C_UNKNOWN(vJobTitle)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vP)
	//C_UNKNOWN(vRole)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; cList; rComp; vC; vNo; vP; WIN_l_CurrentWinRef; $_l_OK; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vJobTitle; vRole; WIN_t_CurrentOutputform; $_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_Comp")
//Mail_Comp
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
Companies_File
READ ONLY:C145
READ ONLY:C145([CONTACTS:1])
rComp:=1
While (vC=1)
	DB_t_CurrentFormUsage:="Omit"
	Comp_Sel
	If (vC=1)
		If (Records in selection:C76([COMPANIES:2])>0)
			vNo:=Records in selection:C76([COMPANIES:2])
			ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2; >)
			DB_t_CurrentFormUsage:="Print"
			Open_Pro_Window("Mail_Companies"; 0; 1; ->[COMPANIES:2]; WIN_t_CurrentOutputform)
			FS_SetFormSort(WIN_t_CurrentOutputform)
			WIn_SetFormSize(1; ->[COMPANIES:2]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([COMPANIES:2]; *)  //NG may 2004 added table
			If (OK=1)
				vNo:=Records in selection:C76([COMPANIES:2])
				
				MAsk_Print(->[COMPANIES:2])
				//we now have a document if we are printing a mail merge
				
				If (vP=1)
					vJobTitle:=""
					vRole:=""
					Open_AnyTypeWindow(258; 483; 5; "Contact Requirements")
					DIALOG:C40([DOCUMENTS:7]; "dAsk_Cont")
					$_l_OK:=OK
					OK:=1
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					If ($_l_OK=1)
						MAsk_MS(->[COMPANIES:2])  //Mail sort
						If (OK=1)
							If (cList=1)
								FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_List")
								MList_Print(->[COMPANIES:2])
							End if 
							MailP_Let(->[COMPANIES:2])
							MailP_Lab(->[COMPANIES:2])
							MailP_Env(->[COMPANIES:2])
							MailP_Exp(->[COMPANIES:2])
						End if 
					End if 
				End if 
			End if 
			Close_ProWin
			vC:=0
		Else 
			Gen_None("Companies"; ->vC)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Mail_Comp"; $_t_oldMethodName)
