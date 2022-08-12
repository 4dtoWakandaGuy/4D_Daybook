//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail SRDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 06:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_SelectedRecord; $_l_TableNumber; rComp; rCont; rContr; rDiary; rOrd; rState)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_ContactName; $_t_oldMethodName; vDetails)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail SRDetails")
$_l_TableNumber:=Table:C252(->[CONTACTS:1])

Case of 
	: (rComp=1)
		
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		
	: (rCont=1)
		
		$_l_TableNumber:=Table:C252(->[CONTACTS:1])
	: (rDiary=1)
		$_l_TableNumber:=Table:C252(->[DIARY:12])
	: (rContr=1)
		$_l_TableNumber:=Table:C252(->[CONTRACTS:17])
		
	: (rOrd=1)
		$_l_TableNumber:=Table:C252(->[ORDERS:24])
	: ((rState=1) | (rState=3))
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
	: (rState=2)
		$_l_TableNumber:=Table:C252(->[INVOICES:39])
		
End case 
$_ptr_Table:=Table:C252($_l_TableNumber)
If (Not:C34(End selection:C36($_ptr_Table->)))
	Mail_MSRec
	Case of 
		: (rComp=1)
			MComp_Add("L")
			Mail_LetAlloc("SR Label")
			NEXT RECORD:C51([COMPANIES:2])
		: (rCont=1)
			
			$_l_SelectedRecord:=Selected record number:C246([CONTACTS:1])
			$_t_ContactName:=[CONTACTS:1]Contact_Name:31
			MContComp_Calc
			$_t_ContactName:=$_t_ContactName+"(2)"+Char:C90(13)+[CONTACTS:1]Contact_Name:31
			MCont_Add("L")
			$_t_ContactName:=$_t_ContactName+"(3)"+Char:C90(13)+[CONTACTS:1]Contact_Name:31
			Mail_LetAlloc("SR Label")
			$_t_ContactName:=$_t_ContactName+"(4)"+Char:C90(13)+[CONTACTS:1]Contact_Name:31
			MZComp
			
			$_t_ContactName:="(4)"+Char:C90(13)+[CONTACTS:1]Contact_Name:31
			//VDetails:=Vdetails+Char(13)+$_t_ContactName
			
		: (rDiary=1)
			RELATE ONE:C42([DIARY:12]Company_Code:1)
			RELATE ONE:C42([DIARY:12]Contact_Code:2)
			MCont_Add("L")
			Mail_LetAlloc("SR Label")
			MZDiary
		: (rContr=1)
			RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
			RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
			MCont_Add("")
			Mail_LetAlloc("SR Label")
			MZContr
		: (rOrd=1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Contact_Code:2)
			MCont_Add("")
			Mail_LetAlloc("SR Label")
			MZOrd
		: ((rState=1) | (rState=3))
			MState_CalcRel
			MCont_Add("L")
			Mail_LetAlloc("SR Label")
			NEXT RECORD:C51
		: (rState=2)
			RELATE ONE:C42([INVOICES:39]Company_Code:2)
			RELATE ONE:C42([INVOICES:39]Contact_Code:3)
			MCont_Add("")
			Mail_LetAlloc("SR Label")
			MZInv
			
	End case 
Else 
	vDetails:=""
End if 
ERR_MethodTrackerReturn("Mail SRDetails"; $_t_oldMethodName)