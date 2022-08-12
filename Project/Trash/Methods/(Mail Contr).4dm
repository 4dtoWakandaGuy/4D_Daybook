//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail_Contr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 13:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cList; rContr; vContr; vNo; vNo2; vP)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_Contr")
//Mail_Contracts
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
If (Contracts_File)
	READ ONLY:C145([CONTRACTS:17])
	
	READ ONLY:C145([COMPANIES:2])
	READ ONLY:C145([CONTACTS:1])
	rContr:=1
	While (vContr=1)
		If (DB_t_CurrentFormUsage#"Button")
			Contracts_Sel
		End if 
		If (vContr=1)
			If (Records in selection:C76([CONTRACTS:17])>0)
				If (DB_t_CurrentFormUsage#"Button")
					vNo:=Records in selection:C76([CONTRACTS:17])
					vNo2:=vNo
					ORDER BY:C49([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1; >)
					DB_t_CurrentFormUsage:="Print"
					Open_Pro_Window("Mail_Contracts"; 0; 1; ->[CONTRACTS:17]; WIN_t_CurrentOutputform)
					FS_SetFormSort(WIN_t_CurrentOutputform)
					WIn_SetFormSize(1; ->[CONTRACTS:17]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([CONTRACTS:17]; *)  //NG may 2004 added table
					If (OK=1)
						vNo:=Records in selection:C76([CONTRACTS:17])
						If (vNo2#vNo)
							ORDER BY:C49([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1; >)
						End if 
					End if 
					MAsk_Print(->[CONTRACTS:17])
					
					If (vP=1)
						MAsk_MS(->[CONTRACTS:17])
						If (OK=1)
							If (cList=1)
								FORM SET OUTPUT:C54([CONTRACTS:17]; "Contracts_List")
								MList_Print(->[CONTRACTS:17])
							End if 
							MailP_Let(->[CONTRACTS:17])
							MailP_Lab(->[CONTRACTS:17])
							MailP_Env(->[CONTRACTS:17])
							MailP_Exp(->[CONTRACTS:17])
						End if 
					End if 
				End if 
				Close_ProWin
				vContr:=0
			Else 
				Gen_None("Contracts"; ->vContr)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Mail_Contr"; $_t_oldMethodName)
