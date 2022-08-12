//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB_SelPvs
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
	C_DATE:C307(vDoDateF; vDoDateT; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vTDateF; SRCH_d_TransToDate)
	C_LONGINT:C283(vNo1; vNo2)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT)
	C_TEXT:C284($_t_oldMethodName; vLayer; vText; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_SelPvs")
vNo1:=0
vNo2:=0
vTDateF:=!00-00-00!
SRCH_d_TransToDate:=!00-00-00!
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vDoDateF:=!00-00-00!
vDoDateT:=!00-00-00!
vAmountF:=0
vAmountT:=0
vText:=""
vLayer:=""
vFilePtr:=->[TRANSACTION_BATCHES:30]
vTitle13:="vNo1+vNo2+vTDateF+SRCH_d_TransToDate+SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vDoDateF+"
vTitle13:=vTitle13+"vDoDateT+vAmountF+vAmountT+vText+vLayer+ch0+ch1+ch2+r1+r2+"
ERR_MethodTrackerReturn("TransB_SelPvs"; $_t_oldMethodName)