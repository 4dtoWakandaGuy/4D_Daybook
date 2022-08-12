//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_InEOrd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_CountRecords; $i; u1; w2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InEOrd")
DB_SaveRecord(->[ORDERS:24])
AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
If (u1=1)
	If ([CONTACTS:1]Contact_Code:2="")
		REDUCE SELECTION:C351([ORDERS:24]; 0)
	Else 
		QUERY:C277([ORDERS:24]; [ORDERS:24]Contact_Code:2=[CONTACTS:1]Contact_Code:2)
	End if 
Else 
	If ([CONTACTS:1]Company_Code:1="")
		REDUCE SELECTION:C351([ORDERS:24]; 0)
	Else 
		QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=[CONTACTS:1]Company_Code:1)
	End if 
End if 
If (SYS_at_RecordStateNames>1)
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=("024"+<>SYS_at_RecStateCodes{24}{SYS_at_RecordStateNames-1}))
End if 
If (w2=1)
	$_l_CountRecords:=Records in selection:C76([ORDERS:24])
	Case of 
		: ($_l_CountRecords=0)
			REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
		: ($_l_CountRecords=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			OrderI_LevelSrc(0)
		Else 
			ARRAY TEXT:C222($_at_OrderCodes; 0)
			SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
			OrderI_LevelSrc(0)
	End case 
End if 
ERR_MethodTrackerReturn("Contacts_InEOrd"; $_t_oldMethodName)