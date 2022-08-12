If (False:C215)
	//Table Form Method Name: [SOURCES]Sources_Stats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded; DB_bo_NoLoad)
	C_DATE:C307(vDateF; vDateT)
	C_LONGINT:C283($_l_event; vNo1; vNo2; vNo3; vNo4)
	C_REAL:C285(v0; v31; v61; v91; vDue; vInvoiced; vPaid; vTotal)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordState; vTitle1; vTitle2; vTitle3)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [SOURCES].Sources_Stats"; Form event code:C388)
//LP Sources_Stats
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header:K2:17)
		
		If (Not:C34(<>StatesLoaded))
			States_Load
		End if 
		MESSAGES OFF:C175
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4="024"+<>SYS_at_RecStateCodes{24}{1})
		vTitle1:=[TABLE_RECORD_STATES:90]Listing_Name:2
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4="024"+<>SYS_at_RecStateCodes{24}{2})
		vTitle2:=[TABLE_RECORD_STATES:90]Listing_Name:2
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4="024"+<>SYS_at_RecStateCodes{24}{3})
		vTitle3:=[TABLE_RECORD_STATES:90]Listing_Name:2
		MESSAGES ON:C181
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		MESSAGES OFF:C175
		QUERY:C277([ORDERS:24]; [ORDERS:24]Source:18=[SOURCES:6]Source_Code:1)
		CREATE SET:C116([ORDERS:24]; "Master")
		$_t_RecordState:="024"+<>SYS_at_RecStateCodes{24}{1}
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_t_RecordState; *)
		QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Enquiry_Date:25>=vDateF; *)
		QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Enquiry_Date:25<=vDateT)
		vNo1:=Records in selection:C76([ORDERS:24])
		vInvoiced:=0
		FIRST RECORD:C50([ORDERS:24])
		While (Not:C34(End selection:C36([ORDERS:24])))
			vInvoiced:=Round:C94((vInvoiced+[ORDERS:24]Total_Amount:6); 2)
			NEXT RECORD:C51([ORDERS:24])
		End while 
		v0:=Round:C94(([SOURCES:6]Cost:4/vNo1); 2)
		USE SET:C118("Master")
		$_t_RecordState:="024"+<>SYS_at_RecStateCodes{24}{2}
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_t_RecordState; *)
		QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Quotation_Date:26>=vDateF; *)
		QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Quotation_Date:26<=vDateT)
		vNo2:=Records in selection:C76([ORDERS:24])
		vPaid:=0
		FIRST RECORD:C50([ORDERS:24])
		While (Not:C34(End selection:C36([ORDERS:24])))
			vPaid:=Round:C94((vPaid+[ORDERS:24]Total_Amount:6); 2)
			NEXT RECORD:C51([ORDERS:24])
		End while 
		v31:=Round:C94(([SOURCES:6]Cost:4/(vNo1+vNo2)); 2)
		USE SET:C118("Master")
		$_t_RecordState:="024"+<>SYS_at_RecStateCodes{24}{3}
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15>=$_t_RecordState; *)
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Date:4>=vDateF; *)
		QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Order_Date:4<=vDateT)
		vNo3:=Records in selection:C76([ORDERS:24])
		vDue:=0
		FIRST RECORD:C50([ORDERS:24])
		While (Not:C34(End selection:C36([ORDERS:24])))
			vDue:=Round:C94((vDue+[ORDERS:24]Total_Amount:6); 2)
			NEXT RECORD:C51([ORDERS:24])
		End while 
		v61:=Round:C94(([SOURCES:6]Cost:4/(vNo1+vNo2+vNo3)); 2)
		vNo4:=vNo1+vNo2+vNo3
		vTotal:=Round:C94((vInvoiced+vPaid+vDue); 2)
		v91:=Round:C94(([SOURCES:6]Cost:4/vNo4); 2)
		MESSAGES ON:C181
End case 
ERR_MethodTrackerReturn("FM [SOURCES].Sources_Stats"; $_t_oldMethodName)
