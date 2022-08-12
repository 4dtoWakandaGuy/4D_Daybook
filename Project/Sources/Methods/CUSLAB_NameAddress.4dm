//%attributes = {}
If (False:C215)
	//Project Method Name:      CUSLAB_NameAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 08:54:21If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(rOrd)
	C_TEXT:C284($_t_oldMethodName; vDesc1; vDetails; vDetails1; vOurRef; vSubGroup1; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUSLAB_NameAddress")
//cuslab_nameaddress
Case of 
	: (Table:C252(Current default table:C363)=Table:C252(->[CONTACTS:1]))
		MContComp_Calc
		MCont_Add("L")
		[CONTACTS:1]CUS_LabelPrint:34:=vDetails
		
		Mail_MSOurRef
		vTitle1:=vOurRef
		MailP_LabCC(->vDesc1; ->vSubGroup1)
		Mail_LetAlloc("Label")
	: (Table:C252(Current default table:C363)=Table:C252(->[COMPANIES:2]))
		MComp_Add("L")
		
		Mail_MSOurRef
		vTitle1:=vOurRef
		MailP_LabCC(->vDesc1; ->vSubGroup1)
		Mail_LetAlloc("Label")
		[COMPANIES:2]CUS_LabelPrint:67:=vDetails
	: (Table:C252(Current default table:C363)=Table:C252(->[DIARY:12]))
		RELATE ONE:C42([DIARY:12]Company_Code:1)
		RELATE ONE:C42([DIARY:12]Contact_Code:2)
		MCont_Add("L")
		vDetails1:=vDetails
		Mail_MSOurRef
		vTitle1:=vOurRef
		MailP_LabCC(->vDesc1; ->vSubGroup1)
		Mail_LetAlloc("Label")
		[COMPANIES:2]CUS_LabelPrint:67:=vDetails
	: (Table:C252(Current default table:C363)=Table:C252(->[CONTRACTS:17]))
		RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
		RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
		MCont_Add("")
		vDetails1:=vDetails
		Mail_MSOurRef
		vTitle1:=vOurRef
		Mail_LetAlloc("Label")
		[COMPANIES:2]CUS_LabelPrint:67:=vDetails
	: (Table:C252(Current default table:C363)=Table:C252(->[ORDERS:24]))
		If (rOrd=2)
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		End if 
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		MCont_Add("")
		vDetails1:=vDetails
		Mail_MSOurRef
		vTitle1:=vOurRef
		Mail_LetAlloc("Label")
		[COMPANIES:2]CUS_LabelPrint:67:=vDetails
	: (Table:C252(Current default table:C363)=Table:C252(->[INVOICES:39]))
		MState_CalcRel
		MCont_Add("L")
		vDetails1:=vDetails
		Mail_MSOurRef
		vTitle1:=vOurRef
		[COMPANIES:2]CUS_LabelPrint:67:=vDetails
		
End case 
ERR_MethodTrackerReturn("CUSLAB_NameAddress"; $_t_oldMethodName)