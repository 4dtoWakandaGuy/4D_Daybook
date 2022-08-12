//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 21:39
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>ForceCred)
	//C_UNKNOWN(<>SalesOrder)
	//C_UNKNOWN(<>StatesLoaded)
	//C_UNKNOWN(ch1)
	//C_UNKNOWN(vCallCode)
	//C_UNKNOWN(vOrderCode)
	//C_UNKNOWN(vStPrevOLD)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	ARRAY LONGINT:C221($_al_ContactIDS; 0)
	ARRAY LONGINT:C221($_al_RelatedContactsIDS; 0)
	//ARRAY TEXT(<>SYS_at_RecStateAbbrev;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>CCM_bo_Inited; <>ForceCred; <>SalesOrder; <>StatesLoaded; $_bo_CardIsFound; $_bo_NoMessage; <>CCM_bo_Inited; $_bo_CardIsFound; $_bo_NoMessage)
	C_DATE:C307(ORD_d_EntryDateFrom)
	C_LONGINT:C283($_l_CreditCardLength; $_l_CreditStateRow; CCM_l_CardToUse; CCM_l_LastNoofDigits; ch1; $_l_CreditCardLength; $_l_CreditStateRow; CCM_l_CardToUse; CCM_l_LastNoofDigits)
	C_POINTER:C301($1)
	C_REAL:C285(CCM_r_isinternal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CompanyCode; $_t_ContactCode; $_t_Expires; $_t_NameOnCard; $_t_NewOrderState; $_t_oldMethodName; $_t_PreviousState; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; vCallCode)
	C_TEXT:C284(vOrderCode; vStPrevOLD; <>Source; <>SYS_t_BaseCurrency; $_t_CompanyCode; $_t_ContactCode; $_t_Expires; $_t_NameOnCard; $_t_NewOrderState; $_t_oldMethodName; $_t_PreviousState)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPX")
//Orders_InLPX
If (Not:C34(<>StatesLoaded))
	States_Load
End if 

Case of 
	: ($1=(->[ORDERS:24]Comments:14))
		ch1:=1
	: ($1=(->[ORDERS:24]Contact_Code:2))
		$_t_CompanyCode:=[ORDERS:24]Company_Code:1
		Check_Contact(->[ORDERS:24]Contact_Code:2; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24])
		Orders_InLPArea
		$_l_CreditStateRow:=Find in array:C230(ST_ai_StatusUsage; 1)
		If (($_t_CompanyCode="") & ([ORDERS:24]Company_Code:1#"") & ($_l_CreditStateRow>0))
			If (DB_t_CurrentFormUsage#"None")
				Gen_CreditCheck
			Else 
				Gen_CreditCheck(""; False:C215; ->[ORDERS:24]Comments_2:40)
			End if 
			If ((vSNo>0) & (<>ForceCred)) & (DB_t_CurrentFormUsage#"None")
				[ORDERS:24]Company_Code:1:=""
				[ORDERS:24]Contact_Code:2:=""
				Comp_vClear
			End if 
		End if 
		Layer_InDDef(->[ORDERS:24]Layer_Code:47)
		If (Records in selection:C76([ORDER_ITEMS:25])=0)
			Currency_InDDefault(->[ORDERS:24]Currency_Code:32)
		End if 
		
	: ($1=(->[ORDERS:24]Order_Code:3))
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		If ((Records in selection:C76([ORDER_ITEMS:25])>0) & (vOrderCode#""))
			If (DB_t_CurrentFormUsage#"None")
				Gen_Alert("You cannot change the code unless you delete the Items"; "Cancel")
			End if 
			[ORDERS:24]Order_Code:3:=vOrderCode
		Else 
			If ([ORDERS:24]Order_Code:3="")
				If (DB_t_CurrentFormUsage#"None")
					Gen_Alert("You must specify a unique Order Code"; "Try again")
				End if 
				[ORDERS:24]Order_Code:3:=vOrderCode
				WS_KeepFocus
			Else 
				RemoveLeadTr(Uppercase:C13([ORDERS:24]Order_Code:3); ->[ORDERS:24]Order_Code:3)
				vOrderCode:=[ORDERS:24]Order_Code:3
			End if 
		End if 
	: ($1=(->[ORDERS:24]Company_Code:1))
		
		Orders_InLPDCom(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2; ->[ORDERS:24]; vCallCode)
		
		
	: ($1=(->[ORDERS:24]Enquiry_Date:25))
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
			If (vDateTitle=(<>SYS_at_RecStateAbbrev{24}{1}+" Date"))
				ORD_d_EntryDateFrom:=[ORDERS:24]Enquiry_Date:25
			End if 
		End if 
	: ($1=(->[ORDERS:24]Quotation_Date:26))
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
			If (vDateTitle=(<>SYS_at_RecStateAbbrev{24}{2}+" Date"))
				ORD_d_EntryDateFrom:=[ORDERS:24]Quotation_Date:26
			End if 
		End if 
		
	: ($1=(->[ORDERS:24]Order_Date:4))
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
			If (vDateTitle=(<>SYS_at_RecStateAbbrev{24}{3}+" Date"))
				ORD_d_EntryDateFrom:=[ORDERS:24]Order_Date:4
			End if 
		End if 
		If ([ORDERS:24]Order_Date:4>!00-00-00!)
			Orders_InLPPer
		End if 
	: ($1=(->[ORDERS:24]Order_Period:42))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[ORDERS:24]Order_Period:42; "Period"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2)
		End if 
		
		If ([ORDERS:24]Order_Date:4=!00-00-00!)
			[ORDERS:24]Order_Date:4:=[PERIODS:33]From_Date:3
		End if 
	: ($1=(->[ORDERS:24]Source:18))
		If (DB_t_CurrentFormUsage#"None")
			//29/10/2009
			
			Check_Minor(->[ORDERS:24]Source:18; "Source"; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Sources_In"; "Source"; "4")
		End if 
		
		
		Orders_InLPDSou
		<>Source:=[ORDERS:24]Source:18
		If (DB_t_CurrentFormUsage#"None")
			Orders_InLPß("S1")
		End if 
		
	: ($1=(->[ORDERS:24]Order_Type:43))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[ORDERS:24]Order_Type:43; "OrderType"; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2; "Types In"; "Order Type"; "1")
		End if 
		//29/10/2009
		
		
		
	: ($1=(->[ORDERS:24]Person:5))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[ORDERS:24]Person:5; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Name")
		End if 
		
		Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
	: ($1=(->[ORDERS:24]Taken_By:17))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[ORDERS:24]Taken_By:17; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Name")
		End if 
		If ([ORDERS:24]Analysis_Code:33="")
			Check_PersAnal(->[ORDERS:24]Taken_By:17; ->[ORDERS:24]Analysis_Code:33)
		End if 
	: ($1=(->[ORDERS:24]Comments:14))
		ch1:=1
	: ($1=(->[ORDERS:24]Your_Order_Number:10))
		[ORDERS:24]Your_Order_Number:10:=Uppercase:C13([ORDERS:24]Your_Order_Number:10)
		//  If (([ORDERS]Your Order No#"") & ([ORDERS]State<-1))
		//  Gen_Confirm ("You have specified an Order No, so should this now be a NEW ORDE
		//R?";"Yes";"No")
		// If (OK=1)
		//   [ORDERS]State:=-1
		//  [ORDERS]Order Date:=◊CDate
		//   Order_Title
		//  End if
		//  End if
	: ($1=(->[ORDERS:24]Delivery_Company:29))
		If (DB_t_CurrentFormUsage#"None")
			Check_Company(->[ORDERS:24]Delivery_Company:29; ->[ORDERS:24]Delivery_Contact:30; ->[ORDERS:24])
		End if 
		
		If ([ORDERS:24]Delivery_Company:29#"")
			If (DB_t_CurrentFormUsage#"")
				Check_ContDef(->[ORDERS:24]Delivery_Company:29; ->[ORDERS:24]Delivery_Contact:30)
			End if 
			
		End if 
		Orders_InLPDelC
		Orders_InLPArea
		Orders_InLPDCo
	: ($1=(->[ORDERS:24]Delivery_Contact:30))
		Check_Contact(->[ORDERS:24]Delivery_Contact:30; ->[ORDERS:24]Delivery_Company:29; ->[ORDERS:24])
		Orders_InLPDelC
		Orders_InLPArea
		Orders_InLPDCo
	: ($1=(->[ORDERS:24]Deliver_To:31))  //NG March 22nd This field will now be disabled(modify button)
		
	: ($1=(->[ORDERS:24]Currency_Code:32))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[ORDERS:24]Currency_Code:32; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
		End if 
		
		If ([ORDERS:24]Currency_Code:32="")
			[ORDERS:24]Currency_Code:32:=<>SYS_t_BaseCurrency
		End if 
	: ($1=(->[ORDERS:24]Delivery_Terms:52))
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[ORDERS:24]Delivery_Terms:52; "Del Terms")
		End if 
		
	: ($1=(->[ORDERS:24]Shipping_Agent:41))
	: ($1=(->[ORDERS:24]Analysis_Code:33))
		If (DB_t_CurrentFormUsage#"None")
			Check_Analysis(->[ORDERS:24]Analysis_Code:33; "Analysis")
		End if 
		
	: ($1=(->[ORDERS:24]Area_Code:35))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[ORDERS:24]Area_Code:35; "Area"; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Areas In")
		End if 
		
		[ORDERS:24]Tax_Rate:34:=[AREAS:3]Tax_Rate:4
		Orders_InLPAr2
	: ($1=(->[ORDERS:24]Tax_Rate:34))
		Orders_InLPAr2
	: ($1=(->[ORDERS:24]Layer_Code:47))
		
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[ORDERS:24]Layer_Code:47; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
		End if 
		If (DB_t_CurrentFormUsage#"None")
			Layer_Fill(->[ORDERS:24]Layer_Code:47)
		End if 
		
		
	: ($1=(->[ORDERS:24]Credit_Card_No:49))
		If (False:C215)
			If (DB_t_CurrentFormUsage#"None")
				If (Check_CCNo(->[ORDERS:24]Credit_Card_No:49))
					If ((DB_GetModuleSettingByNUM(1)#5) & (Records in table:C83([X_URL_LInks:101])>0))
						If (Check_CCIssuer(->[ORDERS:24]Credit_Card_No:49))
							If (DB_t_CurrentFormUsage#"None")
								Gen_Confirm("Card Type: "+[X_URL_LInks:101]x_UUID:4+Char:C90(13)+Char:C90(13)+"Card Issuer: "+[X_URL_LInks:101]Nul_2:5; "OK"; "Try again")
							End if 
						Else 
							If (DB_t_CurrentFormUsage#"None")
								Gen_Confirm("No Issuer details found"; "OK"; "Try again")
							End if 
							
						End if 
						If (OK=0)
							GOTO OBJECT:C206([ORDERS:24]Credit_Card_No:49)
						End if 
					End if 
				Else 
					If (DB_t_CurrentFormUsage#"None")
						Gen_Alert("That Credit Card No appears to be invalid"; "Try again")
					End if 
					GOTO OBJECT:C206([ORDERS:24]Credit_Card_No:49)
				End if 
			End if 
			[ORDERS:24]CC_Auth:56:="Required"
		End if 
		If (Not:C34(<>CCM_bo_Inited))
			CCM_InitCreditCardModule
		End if 
		If ([ORDERS:24]Credit_Card_No:49#"")
			CCM_r_isinternal:=801801801801
			ARRAY LONGINT:C221($_al_ContactIDS; 0)
			$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[ORDERS:24]Company_Code:1; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			SELECTION TO ARRAY:C260([CONTACTS:1]x_ID:33; $_al_ContactIDS)
			QUERY WITH ARRAY:C644([xCreditCardDetails:132]RelatedRecordIdent:13; $_al_ContactIDS)
			$_l_CreditCardLength:=Length:C16([ORDERS:24]Credit_Card_No:49)
			CCM_l_LastNoofDigits:=$_l_CreditCardLength
			QUERY SELECTION BY FORMULA:C207([xCreditCardDetails:132]; ([ORDERS:24]Credit_Card_No:49=CCM_GetCardNumber))
			CCM_r_isinternal:=0
			$_bo_NoMessage:=False:C215
			$_bo_CardIsFound:=False:C215
			If (Records in selection:C76([xCreditCardDetails:132])>0)
				CREATE SET:C116([xCreditCardDetails:132]; "MatchCardNos")
				SELECTION TO ARRAY:C260([xCreditCardDetails:132]RelatedRecordIdent:13; $_al_RelatedContactsIDS)
				QUERY WITH ARRAY:C644([CONTACTS:1]x_ID:33; $_al_RelatedContactsIDS)
				SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
				QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[ORDERS:24]Company_Code:1)
				SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
				QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
				If (Records in selection:C76([CONTACTS:1])>0)
					SELECTION TO ARRAY:C260([CONTACTS:1]x_ID:33; $_al_RelatedContactsIDS)
					QUERY WITH ARRAY:C644([xCreditCardDetails:132]RelatedRecordIdent:13; $_al_RelatedContactsIDS)
					CREATE SET:C116([xCreditCardDetails:132]; "MatchContactNos")
					INTERSECTION:C121("MatchCardNos"; "MatchContactNos"; "MatchCardNos")
					USE SET:C118("MatchCardNos")
					QUERY SELECTION:C341([xCreditCardDetails:132]; [xCreditCardDetails:132]xDeleted:18=0)
					If (Records in selection:C76([xCreditCardDetails:132])>0)
						//Really this should only be one!
						CCM_l_CardToUse:=[xCreditCardDetails:132]x_ID:1
						If ([xCreditCardDetails:132]xDeleted:18>0)
							$_bo_NoMessage:=True:C214
							Gen_Alert("Sorry that card is deleted from the system")
						Else 
							If ([xCreditCardDetails:132]EndDate:8<Current date:C33)
								$_bo_NoMessage:=True:C214
								Gen_Alert("Sorry that card is expired")
							Else 
								$_bo_CardIsFound:=True:C214
							End if 
						End if 
					End if 
				End if 
			End if 
			If (Not:C34($_bo_CardIsFound))
				If (Not:C34($_bo_NoMessage))
					Gen_Alert("Sorry that card is not found in relation to this company")
				End if 
			Else 
				$_t_NameOnCard:=CCM_DecryptCardName
				$_t_Expires:=String:C10([xCreditCardDetails:132]EndDate:8; 4)
				
				Gen_Confirm("This card is registered to "+$_t_NameOnCard+", and expires: "+$_t_Expires+".  Use this card?"; "Yes"; "No")
				
				If (OK=0)
					CCM_l_CardToUse:=0
					[ORDERS:24]Credit_Card_No:49:=""
				End if 
			End if 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
		Else 
			CCM_l_CardToUse:=0
		End if 
	: ($1=(->[ORDERS:24]CC_Expiry:50))
		If (Check_CCExp(->[ORDERS:24]CC_Expiry:50))
		Else 
			If (DB_t_CurrentFormUsage#"None")
				Gen_Confirm("That Expiry Date has Expired!"; "Try again"; "Never mind")
			End if 
			
			If (OK=1)
				GOTO OBJECT:C206([ORDERS:24]CC_Expiry:50)
			End if 
		End if 
		[ORDERS:24]CC_Auth:56:="Required"
		
		
	: ($1=(->[ORDERS:24]CC_Valid_From:53))
		If (DB_t_CurrentFormUsage#"None")
			If (Check_CCValFr(->[ORDERS:24]CC_Valid_From:53))
			Else 
				If (DB_t_CurrentFormUsage#"None")
					Gen_Confirm("That Valid From Date is not yet Valid!"; "Try again"; "Never mind")
				End if 
				
				If (OK=1)
					GOTO OBJECT:C206([ORDERS:24]CC_Valid_From:53)
				End if 
			End if 
		End if 
	: ($1=(->[ORDERS:24]CC_Issue_No:54))
		
	: ($1=(->[ORDERS:24]CC_Address:51))
	: ($1=(->[ORDERS:24]State:15))
		If (Not:C34(<>StatesLoaded))
			States_Load
		End if 
		
		$_t_PreviousState:=vStPrevOLD
		States_Relate(->[ORDERS:24]State:15)
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
			$_t_NewOrderState:="024"+<>SYS_at_RecStateCodes{24}{3}
		Else 
			$_t_NewOrderState:="024ZZZ"
		End if 
		If (Not:C34(((<>SalesOrder=False:C215) | (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=3)) & ([ORDERS:24]State:15>$_t_NewOrderState) & (vProcaMod=13)))
			
			Order_TitCheck($_t_PreviousState)
		Else 
			If (DB_t_CurrentFormUsage#"")
				Gen_Alert("You do not have access to that State"; "Try again")
			End if 
			
			[ORDERS:24]State:15:=$_t_PreviousState
			States_CUArr(->[ORDERS:24]State:15)
			GOTO OBJECT:C206([ORDERS:24]State:15)
		End if 
	: ($1=(->[ORDERS:24]Delivery_Method:19))
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[ORDERS:24]Delivery_Method:19; "Del Methods")
		End if 
	: ($1=(->[ORDERS:24]Terms:16))
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[ORDERS:24]Terms:16; "Terms")
		End if 
		
End case 
Orders_InLPM
//29/10/2009

Macro_AccTypePt($1)
ERR_MethodTrackerReturn("Orders_InLPX"; $_t_oldMethodName)
