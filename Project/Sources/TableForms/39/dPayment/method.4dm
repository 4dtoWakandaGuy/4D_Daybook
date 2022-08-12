If (False:C215)
	//Table Form Method Name: [INVOICES]dPayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(INV_at_PaymentTypes;0)
	C_BOOLEAN:C305(ACC_bo_LockAmounts; DB_bo_NoLoad; INV_bo_HidePaymentType)
	C_LONGINT:C283($_l_event; INV_l_btnPaymentTypeCard; INV_l_btnPaymentTypeCash; INV_l_btnPaymentTypeCheque)
	C_REAL:C285(VPayment; vT1; Vtotal)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; INV_t_DefaultPaymentType; INV_t_PaymentType; VCountry; Vlayer)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES]dPayment"; Form event code:C388)

$_l_event:=Form event code:C388

//******************* added 11/12/08 v631b120l -kmw *******************

//**************************************************************************


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INVOICES:39]); "dPayment")
		
		
		
		If (ACC_bo_LockAmounts)  //set when refunding
			OBJECT SET ENTERABLE:C238(Vlayer; False:C215)
			OBJECT SET ENTERABLE:C238(VCountry; False:C215)
			OBJECT SET ENTERABLE:C238(ACC_t_CurrencyCode; False:C215)
			OBJECT SET ENTERABLE:C238(VPayment; False:C215)
			OBJECT SET ENTERABLE:C238(ACC_t_CurrencyCode; False:C215)
			OBJECT SET ENTERABLE:C238(Vtotal; False:C215)
		End if 
		//INV_t_PaymenetType:=""
		INV_t_PaymentType:=""  //fixed typo -kmw 10/10/08 v631b120
		If (INV_bo_HidePaymentType=False:C215)
			ARRAY TEXT:C222(INV_at_PaymentTypes; 3)
			INV_at_PaymentTypes{1}:="Cash"
			INV_at_PaymentTypes{2}:="Cheque"
			INV_at_PaymentTypes{3}:="Card"
			INV_t_PaymentType:=""
			//INV_at_PaymenetTypes:=0
			INV_at_PaymentTypes:=0  //fixed typo -kmw 10/10/08 v631b120 - possible cause of occasional crash because INV_at_PaymentTypes not initialised properly leading to it containing random data and therefore pointing to random place in memory when used to index into itself?
			If (INV_t_DefaultPaymentType#"")
				INV_t_PaymentType:=INV_t_DefaultPaymentType
				//INV_at_PaymenetTypes:=Find in array(INV_at_PaymentTypes;INV_tDefaultType)
				INV_at_PaymentTypes:=Find in array:C230(INV_at_PaymentTypes; INV_t_DefaultPaymentType)  //fixed typo -kmw 10/10/08 v631b120 - possible cause of occasional crash because INV_at_PaymentTypes not initialised properly leading to it containing random data and therefore pointing to random place in memory when used to index into itself?
			End if 
			
		Else 
			//************************************* can't see how this might have caused crash problem but changed to correct typo on array names to tidy it up -kmw 09/12/08 v631b120k  *****************************************
			ARRAY TEXT:C222(INV_at_PaymentTypes; 0)
			OBJECT SET VISIBLE:C603(INV_at_PaymentTypes; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "INV_l_btnPaymentType@"; False:C215)  //added -kmw 15/01/09 - v631b120h_4 / v631b120m
			
			
			//**********************************************************************************************************************************************************************************************************************
			//INV_t_PaymenetType:=""
			INV_t_PaymentType:=""  //fixed typo -kmw 10/10/08 v631b120
		End if 
		
		//*************** added -kmw 15/01/09 - v631b120h_4 / v631b120m ***************
		INV_l_btnPaymentTypeCash:=0
		INV_l_btnPaymentTypeCheque:=0
		INV_l_btnPaymentTypeCard:=0
		If ((Size of array:C274(INV_at_PaymentTypes)>0) & (INV_at_PaymentTypes>0) & (INV_at_PaymentTypes<=Size of array:C274(INV_at_PaymentTypes)))
			Case of 
				: (INV_at_PaymentTypes{INV_at_PaymentTypes}="Cash")
					INV_l_btnPaymentTypeCash:=1
				: (INV_at_PaymentTypes{INV_at_PaymentTypes}="Cheque")
					INV_l_btnPaymentTypeCheque:=1
				: (INV_at_PaymentTypes{INV_at_PaymentTypes}="Card")
					INV_l_btnPaymentTypeCard:=1
			End case 
		End if 
		//*************************************************************************************
		
		
		WS_AutoscreenSize(3; 264; 394)
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			OBJECT SET ENTERABLE:C238(ACC_t_CurrencyCode; False:C215)
		End if 
		vT1:=vPayment
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[INVOICES:39])
		
	Else   //Added 11/12/08 v631b120l
		
End case 

//******************* added 11/12/08 v631b120l -kmw *******************
//**************************************************************************
ERR_MethodTrackerReturn("FM:dPayment"; $_t_oldMethodName)
