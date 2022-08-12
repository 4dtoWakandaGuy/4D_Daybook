//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_No
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
	C_BOOLEAN:C305(<>ResetNumber)
	C_LONGINT:C283(<>OINo; $_l_Clash; $_l_FieldNumber; $_l_ItemNumber; $_l_SetIDProcess; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_No")
If (<>OINo=0)
	READ ONLY:C145([IDENTIFIERS:16])
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
	<>OINo:=[IDENTIFIERS:16]Number:2
	UNLOAD RECORD:C212([IDENTIFIERS:16])
End if 
Repeat 
	$_l_ItemNumber:=<>OINo+AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
	SET QUERY DESTINATION:C396(3; $_l_Clash)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_ItemNumber)
	SET QUERY DESTINATION:C396(0)
	If ($_l_Clash>0)
		$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
		$_l_FieldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
		<>ResetNumber:=False:C215
		$_l_SetIDProcess:=New process:C317("AA_SetNextID"; 256000; "Fixing_Number"; $_l_TableNumber; $_l_FieldNumber; $_l_ItemNumber; <>OINo)
		Repeat 
			DelayTicks(60)
		Until (<>ResetNumber)
		<>ResetNumber:=False:C215
	End if 
	
Until ($_l_Clash=0)

//Copied to OrderI_SubLPB
[ORDER_ITEMS:25]Item_Number:27:=$_l_ItemNumber
//Gen_Code (14)
ERR_MethodTrackerReturn("OrderI_No"; $_t_oldMethodName)
