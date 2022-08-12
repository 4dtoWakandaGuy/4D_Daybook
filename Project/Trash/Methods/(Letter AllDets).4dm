//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter AllDets
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 21:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283(rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284($_t_oldMethodName; vOurRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter AllDets")
Case of 
	: (rComp=1)
		If ($1)
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[DOCUMENTS:7]Document_Code:1
		End if 
		MComp_Add("")
	: (rCont=1)
		MContComp_Calc
		If ($1)
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
		End if 
		MCont_Add("")
	: (rContr=1)
		RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
		RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
		If ($1)
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
		End if 
		MCont_Add("")
	: (rOrd>0)
		If (rOrd=2)  //Subscription Order Items
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		End if 
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		If ($1)
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
		End if 
		MCont_Add("")
		If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
			Subscript_LetDe
		End if 
		
	: (rState=1)
		MState_Calc
		MCont_Add("")
		If ($1)
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[DOCUMENTS:7]Document_Code:1
		End if 
		
	: (rDiary=1)
		RELATE ONE:C42([DIARY:12]Company_Code:1)
		RELATE ONE:C42([DIARY:12]Contact_Code:2)
		MCont_Add("")
		If ($1)
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
		End if 
		
End case 
ERR_MethodTrackerReturn("Letter AllDets"; $_t_oldMethodName)