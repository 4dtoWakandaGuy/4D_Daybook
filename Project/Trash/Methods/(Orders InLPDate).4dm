//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPDate
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
	//ARRAY TEXT(<>SYS_at_RecStateAbbrev;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_DATE:C307(ORD_d_EntryDateFrom)
	C_TEXT:C284($_t_oldMethodName; vDateTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPDate")
//Orders_InLPDate - fills in date field from the ORD_d_EntryDateFrom variable
If (Not:C34(<>StatesLoaded))
	States_Load
End if 

If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
	If (vDateTitle=(<>SYS_at_RecStateAbbrev{24}{1}+" Date"))
		[ORDERS:24]Enquiry_Date:25:=ORD_d_EntryDateFrom
	Else 
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
			If (vDateTitle=(<>SYS_at_RecStateAbbrev{24}{2}+" Date"))
				[ORDERS:24]Quotation_Date:26:=ORD_d_EntryDateFrom
			Else 
				If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
					If (vDateTitle=(<>SYS_at_RecStateAbbrev{24}{3}+" Date"))
						[ORDERS:24]Order_Date:4:=ORD_d_EntryDateFrom
					Else 
						Case of 
							: (vDateTitle="Order Date")
								[ORDERS:24]Order_Date:4:=ORD_d_EntryDateFrom
							: (vDateTitle=Term_OrdWT("Qtn Date"))
								[ORDERS:24]Quotation_Date:26:=ORD_d_EntryDateFrom
							: (vDateTitle=Term_OrdWT("Enquiry Date"))
								[ORDERS:24]Enquiry_Date:25:=ORD_d_EntryDateFrom
						End case 
					End if 
				Else 
					Case of 
						: (vDateTitle="Order Date")
							[ORDERS:24]Order_Date:4:=ORD_d_EntryDateFrom
						: (vDateTitle=Term_OrdWT("Qtn Date"))
							[ORDERS:24]Quotation_Date:26:=ORD_d_EntryDateFrom
						: (vDateTitle=Term_OrdWT("Enquiry Date"))
							[ORDERS:24]Enquiry_Date:25:=ORD_d_EntryDateFrom
					End case 
				End if 
			End if 
		Else 
			Case of 
				: (vDateTitle="Order Date")
					[ORDERS:24]Order_Date:4:=ORD_d_EntryDateFrom
				: (vDateTitle=Term_OrdWT("Qtn Date"))
					[ORDERS:24]Quotation_Date:26:=ORD_d_EntryDateFrom
				: (vDateTitle=Term_OrdWT("Enquiry Date"))
					[ORDERS:24]Enquiry_Date:25:=ORD_d_EntryDateFrom
			End case 
		End if 
	End if 
Else 
	Case of 
		: (vDateTitle="Order Date")
			[ORDERS:24]Order_Date:4:=ORD_d_EntryDateFrom
		: (vDateTitle=Term_OrdWT("Qtn Date"))
			[ORDERS:24]Quotation_Date:26:=ORD_d_EntryDateFrom
		: (vDateTitle=Term_OrdWT("Enquiry Date"))
			[ORDERS:24]Enquiry_Date:25:=ORD_d_EntryDateFrom
	End case 
End if 
[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
ERR_MethodTrackerReturn("Orders_InLPDate"; $_t_oldMethodName)
