//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail MSPlanRep
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; vAct1; vAct2; vAct3; vNo; vNo1; vNo2; vNo3; vNo4; vNo5; vSNo)
	C_LONGINT:C283(vStockLevel; vStockUA)
	C_REAL:C285(vDue; vInvoiced; vPaid; vSubtotal; vT1; vT2; vT3; vT4; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail MSPlanRep")
MailP_Ready("Are you ready to print the Mailsort Planning Report?")
$_l_OK:=PRINT_SetSIZE("A4"; "P"; "MailsortPlanning")
If ($_l_OK>=0)
	If ($_l_OK=1)
		PRINT SETTINGS:C106
		$_l_OK:=OK
	Else 
		$_l_OK:=1
	End if 
	If ($_l_OK=1)
		//PRINT SETTINGS
		If (OK=1)
			
			QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1#999999)
			vNo:=Records in selection:C76([MAILSORT_MAIL:83])
			QUERY SELECTION:C341([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3#"000@")
			vNo1:=Records in selection:C76([MAILSORT_MAIL:83])
			vNo2:=vNo-vNo1
			
			vT1:=Round:C94(((vNo3/vNo1)*100); 1)
			vT2:=Round:C94(((vNo4/vNo1)*100); 1)
			vT3:=vT1+vT2
			vT4:=Round:C94(((vNo5/vNo1)*100); 1)
			
			QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1=999999; *)
			QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]SSC:3#"000@"; *)
			QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Residue:2=0)
			vSubtotal:=Records in selection:C76([MAILSORT_MAIL:83])
			vAct1:=Sum:C1([MAILSORT_MAIL:83]Count:5)
			vStockLevel:=Sum:C1([MAILSORT_MAIL:83]Bags:6)
			
			QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1=999999; *)
			QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]SSC:3#"000@"; *)
			QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Residue:2=1)
			vVAT:=Records in selection:C76([MAILSORT_MAIL:83])
			vAct2:=Sum:C1([MAILSORT_MAIL:83]Count:5)
			vStockUA:=Sum:C1([MAILSORT_MAIL:83]Bags:6)
			
			vTotal:=vSubtotal+vVAT
			vAct3:=vAct1+vAct2
			vSNo:=vStockLevel+vStockUA
			
			vInvoiced:=(vAct1/vAct3)*100
			vPaid:=(vAct2/vAct3)*100
			vDue:=100
			
			Print form:C5([DOCUMENTS:7]; "Planning Rep")
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions("MailsortPlanning")  //NG June 2005
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Mail MSPlanRep"; $_t_oldMethodName)