//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ListVGB4
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
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded; vFromIn)
	C_DATE:C307($_d_DateF; vFDateF)
	C_LONGINT:C283($_l_CH0; $_l_ch1; $_l_ch2; $_l_ch3; $_l_Ch4; $_l_Ch5; $_l_Ch6; $_l_Ch7; $_l_Ch8; $_l_S1; $_l_S2)
	C_LONGINT:C283(ch0; ch1; ch2; ch3; ch4; ch5; ch6; ch7; ch8; r1; s1)
	C_LONGINT:C283(s2; vNo; vNo2)
	C_TEXT:C284($_t_Comments; $_t_CurrentOutputForm; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vComments; vOrderCode; vProdCode)
	C_TEXT:C284(vSelPrev; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB4")
$_t_CurrentOutputForm:=WIN_t_CurrentOutputform
If (ch8=1)
	$_l_CH0:=ch0
	$_l_ch1:=ch1
	$_l_ch2:=ch2
	$_l_ch3:=ch3
	$_l_Ch4:=ch4
	$_l_Ch5:=ch5
	$_l_Ch6:=ch6
	$_l_Ch7:=ch7
	$_l_Ch8:=ch8
	$_l_S1:=s1
	$_l_s2:=s2
	$_t_ProductCode:=vProdCode
	$_t_Comments:=vComments
	$_t_OrderCode:=vOrderCode
	$_d_DateF:=vFDateF
	vSelPrev:=""
	Orders_SelP
	ch0:=$_l_CH0
	ch1:=$_l_ch1
	ch2:=$_l_ch2
	ch3:=$_l_ch3
	ch4:=$_l_Ch4
	ch5:=$_l_Ch5
	ch6:=$_l_Ch6
	ch7:=$_l_Ch7
	ch8:=$_l_Ch8
	s1:=$_l_S1
	s2:=$_l_S2
	vProdCode:=$_t_ProductCode
	vComments:=$_t_Comments
	vOrderCode:=$_t_OrderCode
	vFDateF:=$_d_DateF
	r1:=1
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{3})
Else 
	QUERY:C277([ORDERS:24]; [ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{3})
End if 
If (vOrderCode#"")
	QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3>=vOrderCode)
End if 
If ((vProdCode#"") | (vComments#""))
	CREATE SET:C116([ORDERS:24]; "Or")
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2>=vProdCode; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Product_Code:2<=vComments)
	// CREATE SET([ORDER ITEMS];"OIMaster")
	SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDERS:24]State:15=-1)
	SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
	RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
	CREATE SET:C116([ORDERS:24]; "Ex")
	INTERSECTION:C121("Or"; "Ex"; "Or")
	USE SET:C118("Or")
	CLEAR SET:C117("Or")
	CLEAR SET:C117("Ex")
	
	// AUTOMATIC RELATIONS(True;True)
	// SEARCH SELECTION([ORDERS];[ORDER ITEMS]Product Code>=vProdCode;*)
	// SEARCH SELECTION([ORDERS]; & ;[ORDER ITEMS]Product Code<=vComments)
	// AUTOMATIC RELATIONS(False;False)
End if 
ORDER BY:C49([ORDERS:24]; [ORDERS:24]Order_Code:3; >)
If (ch7=1)
	vNo:=Records in selection:C76([ORDERS:24])
	vNo2:=vNo
	DB_t_CurrentFormUsage:="Print"
	vFromIn:=True:C214
	WIN_t_CurrentOutputform:="Orders_Out"
	FS_SetFormSort(WIN_t_CurrentOutputform)
	WIn_SetFormSize(1; ->[ORDERS:24]; WIN_t_CurrentOutputform)
	DISPLAY SELECTION:C59([ORDERS:24]; *)
	If (vNo2#vNo)
		ORDER BY:C49([ORDERS:24]; [ORDERS:24]Order_Code:3; >)
	End if 
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputForm
ERR_MethodTrackerReturn("Orders_ListVGB4"; $_t_oldMethodName)
