//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_MSRec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/03/2011 07:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch5; rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_MSRec")
If (ch5=1) & (False:C215)
	If ((DB_GetModuleSettingByNUM(31))>1)
		If (([MAILSORT_MAIL:83]Record_Number:1#999999) & (Not:C34(End selection:C36([MAILSORT_MAIL:83]))))
			Case of 
				: ((rComp=1) | (rState>0))
					GOTO RECORD:C242([COMPANIES:2]; [MAILSORT_MAIL:83]Record_Number:1)
				: (rCont=1)
					GOTO RECORD:C242([CONTACTS:1]; [MAILSORT_MAIL:83]Record_Number:1)
				: (rDiary=1)
					GOTO RECORD:C242([DIARY:12]; [MAILSORT_MAIL:83]Record_Number:1)
				: (rContr=1)
					GOTO RECORD:C242([CONTRACTS:17]; [MAILSORT_MAIL:83]Record_Number:1)
				: (rOrd=1)
					GOTO RECORD:C242([ORDERS:24]; [MAILSORT_MAIL:83]Record_Number:1)
			End case 
		Else 
			Case of 
				: ((rComp=1) | (rState>0))
					UNLOAD RECORD:C212([COMPANIES:2])
				: (rCont=1)
					UNLOAD RECORD:C212([CONTACTS:1])
				: (rDiary=1)
					UNLOAD RECORD:C212([DIARY:12])
				: (rContr=1)
					UNLOAD RECORD:C212([CONTRACTS:17])
				: (rOrd=1)
					UNLOAD RECORD:C212([ORDERS:24])
			End case 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Mail_MSRec"; $_t_oldMethodName)