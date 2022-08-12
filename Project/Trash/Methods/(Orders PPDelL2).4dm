//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_PPDelL2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ORD_bo_NewDeliverynote)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vDelDate; vDoDateF)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; STK_T_DeliveryReference; vButtDisOrd; vComments; vDetails; vLayCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vNumber; vOurRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDelL2")
Orders_PPDelDet
Forms_DelTit
vOurRef:=[ORDERS:24]Order_Code:3
If ([ORDER_ITEMS:25]Invoice_Number:17#"")
	vOurRef:=vOurRef+" / "+[ORDER_ITEMS:25]Invoice_Number:17
End if 
If (vLayCode#[ORDERS:24]Order_Code:3)
	If (vButtDisOrd#"OI@")
		If (DB_t_CurrentFormUsage2="Sel")
			//don't search again cos you've come from Orders entry & want just those selected
		Else 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			Orders_PPDelSrc
		End if 
	Else 
		If (DB_t_CurrentFormUsage="Subs")
			Subscript_OIFin
		End if 
	End if 
	If (STK_T_DeliveryReference#"")
		vNumber:=STK_T_DeliveryReference
	Else 
		If ([ORDER_ITEMS:25]Delivery_Number:49="") | (ORD_bo_NewDeliverynote)
			vNumber:=Gen_CodePref(13; ->[ORDER_ITEMS:25]Delivery_Number:49)
		Else 
			vNumber:=[ORDER_ITEMS:25]Delivery_Number:49
		End if 
	End if 
	If (vDoDateF=!00-00-00!)
		vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
	End if 
	vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
	vDate:=[ORDER_ITEMS:25]Invoice_Date:25
	If (vDelDate=!00-00-00!)
		vDelDate:=<>DB_d_CurrentDate
	End if 
	If (DB_t_CurrentFormUsage2#"Sel")  //4.0.036z
		Orders_PPDel5
		Orders_InvCalc
	End if 
	Address_Lines(vDetails)
	Forms_GenTit(->[ORDERS:24]Analysis_Code:33)
	vLayCode:=[ORDERS:24]Order_Code:3
	If ([ORDERS:24]Print_Comments:44=False:C215)
		vComments:=""
	Else 
		vComments:=[ORDERS:24]Comments:14
	End if 
	r1:=0
End if 
ERR_MethodTrackerReturn("Orders_PPDelL2"; $_t_oldMethodName)