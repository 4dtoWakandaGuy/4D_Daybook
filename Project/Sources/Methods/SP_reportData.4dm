//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_reportData
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
	C_TEXT:C284($_t_oldMethodName; SP_t_PeriodCode; SP_t_ProjectionStatus; SP_t_ProjectionType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_reportData")
SP_t_ProjectionStatus:=""
SP_t_ProjectionType:=""
SP_t_PeriodCode:=""

If ([SALES_PROJECTION:113]PersonnelOwnerID:4>0)
	QUERY:C277([PERSONNEL:11]Personnel_ID:48=[SALES_PROJECTION:113]PersonnelOwnerID:4)
Else 
	UNLOAD RECORD:C212([PERSONNEL:11])
End if 
If ([SALES_PROJECTION:113]PersonnelGroupID:5>0)
	QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=[SALES_PROJECTION:113]PersonnelGroupID:5)
Else 
	UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
End if 
If ([SALES_PROJECTION:113]CompanyID:6>0)
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=[SALES_PROJECTION:113]CompanyID:6)
Else 
	UNLOAD RECORD:C212([COMPANIES:2])
End if 
If ([SALES_PROJECTION:113]ContactID:7>0)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[SALES_PROJECTION:113]ContactID:7)
Else 
	UNLOAD RECORD:C212([CONTACTS:1])
End if 
If ([SALES_PROJECTION:113]CurrencyID:12>0)
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[SALES_PROJECTION:113]CurrencyID:12)
Else 
	UNLOAD RECORD:C212([CURRENCIES:71])
End if 
If ([SALES_PROJECTION:113]Status:20>0)
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[SALES_PROJECTION:113]Status:20)
	SP_t_ProjectionStatus:=[LIST_ITEMS:95]List_Entry:2
Else 
	UNLOAD RECORD:C212([LIST_ITEMS:95])
End if 
If ([SALES_PROJECTION:113]Class_ID:2>0)
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[SALES_PROJECTION:113]Class_ID:2)
	SP_t_ProjectionType:=[LIST_ITEMS:95]List_Entry:2
Else 
	UNLOAD RECORD:C212([LIST_ITEMS:95])
End if 
If ([SALES_PROJECTION:113]Expected_date:16>!00-00-00!)
	QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<[SALES_PROJECTION:113]Expected_date:16; *)
	QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>[SALES_PROJECTION:113]Expected_date:16)
	If (Records in selection:C76([PERIODS:33])>0)
		SP_t_PeriodCode:=[PERIODS:33]Period_Code:1
	End if 
End if 
ERR_MethodTrackerReturn("SP_reportData"; $_t_oldMethodName)
