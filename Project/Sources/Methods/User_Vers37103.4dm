//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37103
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_TaxPeriods; 0)
	C_LONGINT:C283($_l_CountRecords; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; vPeriod)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37103")
//User_Vers37103
READ WRITE:C146([TRANSACTIONS:29])
READ ONLY:C145([PERIODS:33])
QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12#"")
If (Records in selection:C76([TRANSACTIONS:29])>0)
	vPeriod:=""
	While ((vPeriod="") & (OK=1))
		Gen_Alert("IMPORTANT NOTICE: This version updates the way VAT "+"Returns are calculated.  In the next window please specify the end Period"+" of your last successful VAT Return.  "+"If unsure, please contact your System Administrator."; "Continue")
		vPeriod:=Gen_Request("VAT Return printed up to end of Period:")
		If (OK=0)
			Gen_Confirm("You Cancelled the request for a Period.  If you do so "+"the next VAT Return printed will show all Transactions up to and including "+"the Quarter you select.  Are you sure you want to Cancel?"; "Try again"; "Cancel")
			vPeriod:=""
		Else 
			If (vPeriod#"")
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=vPeriod)
				If (Records in selection:C76([PERIODS:33])>1)
					Check_MinorFS("Period"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2)
					vPeriod:=[PERIODS:33]Period_Code:1
				End if 
				If ((Records in selection:C76([PERIODS:33])=0) | (OK=0))
					Gen_Alert("That is not a valid Period"; "Try again")
					vPeriod:=""
				End if 
			End if 
		End if 
	End while 
	If ((OK=1) & (vPeriod#""))
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=vPeriod)
		$_l_CountRecords:=Records in selection:C76([TRANSACTIONS:29])
		ARRAY TEXT:C222($_at_TaxPeriods; $_l_CountRecords)
		User_Message(Char:C90(13)+"    Updating Transactions' Tax Period")
		For ($_l_Index; 1; $_l_CountRecords)
			$_at_TaxPeriods{$_l_Index}:="*OM"
		End for 
		ARRAY TO SELECTION:C261($_at_TaxPeriods; [TRANSACTIONS:29]Tax_Period:27)
	End if 
End if 
UNLOAD RECORD:C212([TRANSACTIONS:29])
READ ONLY:C145([TRANSACTIONS:29])

QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1#"")
If (Records in selection:C76([JOBS:26])>0)
	READ WRITE:C146([JOBS:26])
	FIRST RECORD:C50([JOBS:26])
	While (Not:C34(End selection:C36([JOBS:26])))
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
		
		If (Records in selection:C76([JOB_STAGES:47])>0)
			[JOBS:26]Actual_TR:29:=True:C214
			Jobs_InRecalc
		End if 
		NEXT RECORD:C51([JOBS:26])
	End while 
	READ ONLY:C145([JOBS:26])
	UNLOAD RECORD:C212([JOBS:26])
End if 
ERR_MethodTrackerReturn("User_Vers37103"; $_t_oldMethodName)
