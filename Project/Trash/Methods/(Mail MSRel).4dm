//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail MSRel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 08:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail MSRel")
Case of 
	: (rComp=1)
	: (rCont=1)
		MContComp_Calc
	: (rContr=1)
		RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
	: (rOrd=1)
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
	: (rDiary=1)
		RELATE ONE:C42([DIARY:12]Company_Code:1)
	: (rState=1)
	: (rState=2)
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		
End case 
ERR_MethodTrackerReturn("Mail MSRel"; $_t_oldMethodName)