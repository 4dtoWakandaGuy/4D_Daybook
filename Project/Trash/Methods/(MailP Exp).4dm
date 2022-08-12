//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MailP Exp
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
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AddMode; $_l_TableNumber; bd2; bd3; cExport; rComp; rCont; rContr; rDiary; rOrd)
	C_LONGINT:C283(rState; Vadd; vControl; vNo)
	C_POINTER:C301($_ptr_CurrentTable; $1; vFilePtr)
	C_TEXT:C284($_t_CurrentOutputform; $_t_formReference; $_t_oldMethodName; $_t_Status; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SR_Search; vFld; vJobTitle; vOurRef)
	C_TEXT:C284(vRec; vSalutation; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP Exp")
//MailP Exp
<>SYS_l_CancelProcess:=0
vOurRef:=""
$_ptr_CurrentTable:=$1
Case of 
	: (vFld="Tab")
		vFld:=Char:C90(9)
	: (vFld="Comma")
		vFld:=","
	: ((vFld="CR") | (vFld="Ret") | (vFld="Return"))
		vFld:=Char:C90(13)
	: (Num:C11(vFld)#0)
		If (Num:C11(vFld)<256)
			vFld:=Char:C90(Num:C11(vFld))
		End if 
End case 
vRec:=Char:C90(13)
If (cExport=1)
	MailP_Ready("Are you ready to Export?")
	If (OK=1)
		SET CHANNEL:C77(12; "")
		If (OK=1)
			If ((DB_GetModuleSettingByNUM(31))>1)
				$_t_Status:="SSC"
			Else 
				$_t_Status:="Unused"
			End if 
			SEND PACKET:C103("Company Code"+vFld+"Contact Code"+vFld+"Status"+vFld+$_t_Status+vFld+"Salutation"+vFld+"Name"+vFld+"Job Title"+vFld+"Dept/Room"+vFld+"Company"+vFld+"Add1"+vFld+"Add2"+vFld+"Town"+vFld+"County"+vFld+"Postcode"+vFld+"Country"+vRec)
			FIRST RECORD:C50($_ptr_CurrentTable->)
			Mail_MSRec
			While ((Not:C34(End selection:C36($_ptr_CurrentTable->))) & (<>SYS_l_CancelProcess#Current process:C322))
				Case of 
					: (rComp=1)
						MComp_Add("L")
					: (rCont=1)
						MContComp_Calc
						MCont_Add("L")
					: (rDiary=1)
						RELATE ONE:C42([DIARY:12]Company_Code:1)
						RELATE ONE:C42([DIARY:12]Contact_Code:2)
						MCont_Add("L")
					: (rContr=1)
						RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
						RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
						MCont_Add("L")
					: (rOrd>0)
						If (rOrd=2)
							RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
						End if 
						RELATE ONE:C42([ORDERS:24]Company_Code:1)
						RELATE ONE:C42([ORDERS:24]Contact_Code:2)
						MCont_Add("L")
					: ((rState=1) | (rState=3))
						MState_CalcRel
						MCont_Add("L")
					: (rState=2)
						RELATE ONE:C42([INVOICES:39]Company_Code:2)
						RELATE ONE:C42([INVOICES:39]Contact_Code:3)
						MCont_Add("L")
						
				End case 
				If ((rComp=1) | ([CONTACTS:1]Status:14=""))
					$_t_Status:=[COMPANIES:2]Status:12
				Else 
					$_t_Status:=[CONTACTS:1]Status:14
				End if 
				Letter_Print2  // sorts out the salutation
				SEND PACKET:C103([COMPANIES:2]Company_Code:1+vFld+[CONTACTS:1]Contact_Code:2+vFld+$_t_Status+vFld+([COMPANIES:2]Mailsort_SSC:49*Num:C11(DB_GetModuleSettingByNUM(31)>1))+vFld+vSalutation+vFld)
				If (rComp=1)
					If (Records in selection:C76([CONTACTS:1])>0)
						MailP_ExpCont
					Else 
						If (Length:C16(vJobTitle)<2)
							SEND PACKET:C103(vFld+vFld+vFld)
						Else 
							SEND PACKET:C103(vFld+vJobTitle+vFld+vFld)
						End if 
					End if 
				Else 
					MailP_ExpCont
				End if 
				SEND PACKET:C103([COMPANIES:2]Company_Name:2+vFld+[COMPANIES:2]Address_Line_one:3+vFld+[COMPANIES:2]Address_Line_two:4+vFld+[COMPANIES:2]Town_or_City:5+vFld+[COMPANIES:2]County_or_State:6+vFld+[COMPANIES:2]Postal_Code:7+vFld+[COMPANIES:2]Country:8+vRec)
				Mail_LetAlloc("Export")
				NEXT RECORD:C51($_ptr_CurrentTable->)
				Mail_MSRec
			End while 
		End if 
		SET CHANNEL:C77(11)
	End if 
End if 

If (bd2=1)
	MailP_Ready("Are you ready to use SuperReport?")
	If (OK=1)
		//Gen_PallHide
		SR_Search:=""
		//$No:=0-(Int(Records in selection/bd3)+Num(Int
		//(Records in selection/bd3)#(Records in selection/bd3)))
		//SuperReport ($No;"";513+(8*Num(◊Screen="13")))
		//SRPurge
		//Gen_PallShow
		$_t_CurrentOutputform:=WIN_t_CurrentOutputform
		READ WRITE:C146([DOCUMENTS:7])
		Reports_FileI
		//OUTPUT FORM([DOCUMENTS];"Reports Out")
		WIN_t_CurrentOutputform:="Reports Out"  //added NG may 2004
		$_l_TableNumber:=Table:C252($_ptr_CurrentTable)
		vFilePtr:=$_ptr_CurrentTable
		vNo:=Records in selection:C76($_ptr_CurrentTable->)
		vControl:=(Int:C8(vNo/bd3)+Num:C11(Int:C8(vNo/bd3)#(vNo/bd3)))
		DB_t_CurrentFormUsage:="Mail"
		Userset_Empty(->[DOCUMENTS:7])
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
		Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
		vNo:=Records in selection:C76([DOCUMENTS:7])
		$_t_formReference:=""
		$_l_AddMode:=Vadd
		If (vNo=0)
			Open_Pro_Window("Create a SuperReport"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)  //NG may 2004 added form reference
			$_t_formReference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
			
			vAdd:=1
			
			ADD RECORD:C56([DOCUMENTS:7]; *)
		Else 
			//Open_Pro_Window ("View SuperReports";0;1;->[DOCUMENTS];"Reports Out")
			//vAdd:=0
			//C_TEXT(WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[DOCUMENTS];"Reports Out")
			//MODIFY SELECTION([DOCUMENTS];*)
			//COPY NAMED SELECTION([DOCUMENTS];"CURRENT")
			DB_t_CurrentFormUsage:="Mail"
			DB_PrintSelectSRReport
			
			
		End if 
		Vadd:=$_l_AddMode
		If ($_t_formReference#"")
			Close_ProWin($_t_formReference)
		Else 
			Close_ProWin
		End if 
		
		$_t_CurrentOutputform:=WIN_t_CurrentOutputform
		
	End if 
End if 
//End if
ERR_MethodTrackerReturn("MailP Exp"; $_t_oldMethodName)
