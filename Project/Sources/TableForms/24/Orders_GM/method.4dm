If (False:C215)
	//Table Form Method Name: [ORDERS]Orders_GM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StandMA; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch0; ch1; ch2; ch3; r0; r1)
	C_REAL:C285(vAmount; vMarginF; vMarginPF; vT1; vT4; vT5; vT6; vTotal)
	C_TEXT:C284($_t_oldMethodName; vContName; vTitleR)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Orders_GM"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Header:K2:17)
		
		vTitleR:="GROSS MARGIN REPORT "
		If (r0=1)
			vTitleR:=vTitleR+" (Actual Prices"
		Else 
			vTitleR:=vTitleR+" (Standard Prices"
		End if 
		Case of 
			: (ch0=1)
				vTitleR:=vTitleR+", by Person)"
			: (ch1=1)
				vTitleR:=vTitleR+", by Analysis)"
			: (ch2=1)
				vTitleR:=vTitleR+", by Currency)"
			: (ch3=1)
				vTitleR:=vTitleR+", by Company)"
		End case 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		vContName:=[CONTACTS:1]Contact_Name:31
		Orders_Status
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		
		If (r1=1)
			If (<>StandMA)
				vAmount:=[ORDERS:24]Total_Amount:6
			Else 
				vAmount:=[ORDERS:24]Total_StandA:38
			End if 
			vTotal:=[ORDERS:24]Total_StandC:39
			//   vMarginF:=[ORDERS]Total StandM
		Else 
			vAmount:=[ORDERS:24]Total_Amount:6
			vTotal:=[ORDERS:24]Total_Cost:11
			//  vMarginF:=Total Margin
		End if 
		vMarginF:=Round:C94((vAmount-vTotal); 2)
		vMarginPF:=100-(vTotal/vAmount*100)
	: ($_l_event=On Printing Break:K2:19)
		
		vT1:=Subtotal:C97(vAmount)
		vT4:=Subtotal:C97(vTotal)
		vT5:=Subtotal:C97(vMarginF)
		vT6:=100-(vT4/vT1*100)
End case 
ERR_MethodTrackerReturn("FM [ORDERS].Orders_GM"; $_t_oldMethodName)
