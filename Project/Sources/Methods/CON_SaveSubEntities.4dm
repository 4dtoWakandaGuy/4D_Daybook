//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_SaveSubEntities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>StatesLoaded)
	//ARRAY BOOLEAN(CON_abo_ContactMod;0)
	//ARRAY BOOLEAN(CON_abo_FurtherMod;0)
	//ARRAY BOOLEAN(CON_abo_IsChargable;0)
	ARRAY DATE:C224($_ad_DiaryDatesToCreate; 0)
	ARRAY DATE:C224($_ad_DoFromDates; 0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(CON_at_ActionsCodes;0)
	//ARRAY TEXT(CON_at_ChargableActions;0)
	//ARRAY TEXT(CON_at_ContactCodes;0)
	//ARRAY TEXT(CON_at_DelContactCodes;0)
	//ARRAY TEXT(CON_at_DelFurtherCode;0)
	//ARRAY TEXT(CON_at_FurtherCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_4DWriteInstalled; $_bo_Create; $_bo_Update; CONT_bo_FurtherFieldsLoaded; $_bo_4DWriteInstalled; $_bo_Create; $_bo_Update; CONT_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_ChargableCount; $_l_Index; $_l_TableNumber; CONT_4DWriteText; CONT_l_FurtherFieldsMod; $_l_ChargableCount; $_l_Index; $_l_TableNumber; CONT_l_FurtherFieldsMod)
	C_OBJECT:C1216($_obj_WPRange; CONT_Obj_4DwriteText; $_obj_WPRange; CONT_Obj_4DwriteText)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_Semaphore; $_t_TableNumAsString; $_t_WPText; SD_t_CallingContactCode; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_Semaphore; $_t_TableNumAsString; $_t_WPText)
	C_TEXT:C284(SD_t_CallingContactCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_SaveSubEntities")
If (Size of array:C274(CON_at_DelContactCodes)>0)
	//there are subrecords to be deleted
	
	If (False:C215)
		For ($_l_Index; 1; Size of array:C274(CON_at_DelContactCodes))
			QUERY:C277([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
			QUERY SELECTION:C341([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contact_Code:1=CON_at_DelContactCodes{$_l_Index})
			DELETE RECORD:C58([CONTRACTS_CONTACTS:151])
		End for 
		
	End if 
	
	If (Size of array:C274(CON_abo_ContactMod)>0)
		QUERY:C277([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
		$_l_ChargableCount:=Records in selection:C76([CONTRACTS_CONTACTS:151])
		For ($_l_Index; 1; Size of array:C274(CON_abo_ContactMod))
			If ($_l_Index>$_l_ChargableCount)
				CREATE RECORD:C68([CONTRACTS_CONTACTS:151])
				[CONTRACTS_CONTACTS:151]Contract_Code:3:=[CONTRACTS:17]Contract_Code:3
				[CONTRACTS_CONTACTS:151]ID:2:=AA_GetNextID(->[CONTRACTS_CONTACTS:151]ID:2)
			End if 
			[CONTRACTS_CONTACTS:151]Contact_Code:1:=CON_at_ContactCodes{$_l_Index}
			DB_SaveRecord(->[CONTRACTS_CONTACTS:151])
			If ($_l_Index<=$_l_ChargableCount)
				NEXT RECORD:C51([CONTRACTS_CONTACTS:151])
				
			End if 
			
		End for 
		
	End if 
Else 
	SET BLOB SIZE:C606([CONTRACTS:17]xContactCodes:15; 0)
	
	VARIABLE TO BLOB:C532(CON_at_ContactCodes; [CONTRACTS:17]xContactCodes:15; *)
End if 
//`
If (CONT_bo_FurtherFieldsLoaded)  // Further fields exist for the Contract table and are loaded
	If (CONT_l_FurtherFieldsMod>0)
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ WRITE:C146([CUSTOM_FIELDS:98])
		If (Records in set:C195("COnt_FFSelection")>0)
			USE SET:C118("CONT_FFSelection")
			DELETE SELECTION:C66([CUSTOM_FIELDS:98])
		End if 
		CLEAR SET:C117("COnt_FFSelection")
		FUR_UpdateFurtherFields(->[CONTRACTS:17])
		
		
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ ONLY:C145([CUSTOM_FIELDS:98])
		//at least one further field has been modified
		
		
	End if 
	$_l_TableNumber:=Table:C252(->[CONTRACTS:17])
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
	$_t_Semaphore:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
	CLEAR SEMAPHORE:C144($_t_Semaphore)
	CLEAR SET:C117("COnt_FFSelection")
End if 

//```````
If (Size of array:C274(CON_at_DelFurtherCode)>0)
	For ($_l_Index; 1; Size of array:C274(CON_at_DelFurtherCode))
		READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
		
		If ($_l_Index<=Size of array:C274(CON_at_DelFurtherCode))
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=[CONTRACTS:17]Contract_Code:3; *)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=CON_at_DelFurtherCode{$_l_Index})
			DB_DeletionControl(->[CONTRACT_RECORD_ANALYSIS:88])
		End if 
		DELETE RECORD:C58([CONTRACT_RECORD_ANALYSIS:88])
	End for 
End if 
If (Size of array:C274(CON_abo_FurtherMod)>0)
	
	For ($_l_Index; 1; CON_abo_FurtherMod)
		If (CON_abo_FurtherMod{$_l_Index})
			READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=[CONTRACTS:17]Contract_Code:3; *)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=CON_at_FurtherCodes{$_l_Index})
			If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
				CREATE RECORD:C68([CONTRACT_RECORD_ANALYSIS:88])
				[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1:=[CONTRACTS:17]Contract_Code:3
				[CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2:=CON_at_FurtherCodes{$_l_Index}
				SAVE RECORD:C53([CONTRACT_RECORD_ANALYSIS:88])
			End if 
			
		End if 
	End for 
End if 
// and save the updated contract properties
$_bo_4DWriteInstalled:=False:C215
If (UTIL_4DwriteEnabled) & (User in group:C338(Current user:C182; "4D Write Group"))
	$_bo_4DWriteInstalled:=True:C214
End if 


$_bo_Update:=False:C215
If ($_bo_4DWriteInstalled)
	If ([CONTRACTS:17]Contract_DocRef:14#"")
		$_bo_Update:=True:C214
		READ WRITE:C146([DOCUMENTS:7])
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[CONTRACTS:17]Contract_DocRef:14)
	Else 
		$_obj_WPRange:=WP Text range:C1341(CONT_Obj_4DwriteText; wk start text:K81:165; wk end text:K81:164)
		$_t_WPText:=WP Get text:C1575($_obj_WPRange; wk expressions as value:K81:255)
		$_l_ChargableCount:=Length:C16(Replace string:C233(Replace string:C233($_t_WPText; " "; ""); Char:C90(13); ""))
		
		
		If ($_l_ChargableCount>0)
			$_bo_Update:=True:C214
			//Document to be created
		End if 
	End if 
Else 
	$_bo_Update:=False:C215
End if 
If ($_bo_Update=True:C214)
	If (Records in selection:C76([DOCUMENTS:7])=0)
		CREATE RECORD:C68([DOCUMENTS:7])
		CREATE RECORD:C68([DOCUMENTS:7])
		[DOCUMENTS:7]Document_Class:14:=4D Write Letter
		[DOCUMENTS:7]Document_Status:15:=1
		[DOCUMENTS:7]Table_Number:11:=Table:C252(->[CONTRACTS:17])
		
		Set_DocumentCode(3)
	End if 
	[DOCUMENTS:7]Heading:2:="Contract "+[CONTRACTS:17]Contract_Code:3
	//[DOCUMENTS]Write_:=‘12000;139‘(CONT_4DWriteText; 1; 1) THis was WR area to picture, the paramters 1(is not saved and parameter 2 the pricture is creates
	//CONT_4DWriteText WAS a longint var referring to an on screen 4D write area
	//this becomes CONT_Obj_4DwriteText
	[DOCUMENTS:7]DocumentWPPro:35:=CONT_Obj_4DwriteText
	
	
	
	DB_SaveRecord(->[DOCUMENTS:7])
	UNLOAD RECORD:C212([DOCUMENTS:7])
End if 
ARRAY TEXT:C222(CON_at_ChargableActions; 0)

ARRAY TEXT:C222(CON_at_ChargableActions; Size of array:C274(CON_abo_IsChargable))
$_l_ChargableCount:=0
For ($_l_Index; 1; Size of array:C274(CON_abo_IsChargable))
	If (CON_abo_IsChargable{$_l_Index})
		$_l_ChargableCount:=$_l_ChargableCount+1
		CON_at_ChargableActions{$_l_ChargableCount}:=CON_at_ActionsCodes{$_l_Index}
	End if 
End for 
If ([CONTRACTS:17]X_Contract_Billing_Product:11#"")
	If ([CONTRACTS:17]End_Date:6>Current date:C33(*))
		If ([CONTRACTS:17]Start_Date:5<=Current date:C33(*))
			$_bo_Create:=False:C215
			
			QUERY:C277([ORDERS:24]; [ORDERS:24]X_contractCode:61=[CONTRACTS:17]Contract_Code:3)
			If (Records in selection:C76([ORDERS:24])=0)
				QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[CONTRACTS:17]X_Contract_Billing_Product:11; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=[CONTRACTS:17]Start_Date:5)
				If ([CONTRACTS:17]End_Date:6#!00-00-00!)
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=[CONTRACTS:17]End_Date:6)
				Else 
					If ([CONTRACTS:17]xOpenEndedStatus:16=1)
						QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=[CONTRACTS:17]Start_Date:5+365)
					End if 
				End if 
				SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DoFromDates; [DIARY:12]Diary_Code:3; $_at_DiaryCodes)
				COPY ARRAY:C226($_ad_DoFromDates; $_ad_DiaryDatesToCreate)
				$_bo_Create:=True:C214
			Else 
				ARRAY DATE:C224($_ad_DiaryDatesToCreate; 0)
				QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[CONTRACTS:17]X_Contract_Billing_Product:11; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=[CONTRACTS:17]Start_Date:5)
				If ([CONTRACTS:17]End_Date:6#!00-00-00!)
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=[CONTRACTS:17]End_Date:6)
				Else 
					If ([CONTRACTS:17]xOpenEndedStatus:16=1)
						QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=[CONTRACTS:17]Start_Date:5+365)
					End if 
				End if 
				SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DoFromDates; [DIARY:12]Diary_Code:3; $_at_DiaryCodes)
				
				SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
				QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
				CREATE SET:C116([ORDER_ITEMS:25]; "$Billings")
				For ($_l_Index; 1; Size of array:C274($_ad_DoFromDates))
					USE SET:C118("$Billings")
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Required_Date:10>=$_ad_DoFromDates{$_l_Index})
					If (Records in selection:C76([ORDER_ITEMS:25])=0)
						APPEND TO ARRAY:C911($_ad_DiaryDatesToCreate; $_ad_DoFromDates{$_l_Index})
					End if 
				End for 
				
			End if 
			If ($_bo_Create)
				Gen_Confirm("There does not appear to an order created for the all the billing of this contract. Do you want to create it")
				If (OK=1)
					If (Not:C34(<>StatesLoaded))
						States_Load
					End if 
					CREATE RECORD:C68([ORDERS:24])
					[ORDERS:24]Order_Code:3:=Gen_CodePref(6; ->[ORDERS:24]Order_Code:3)
					[ORDERS:24]Company_Code:1:=[CONTRACTS:17]Company_Code:1
					[ORDERS:24]Contact_Code:2:=[CONTRACTS:17]Contact_Code:2
					[ORDERS:24]X_contractCode:61:=[CONTRACTS:17]Contract_Code:3
					If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
						RELATE ONE:C42([ORDERS:24]Company_Code:1)
					End if 
					[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
					Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
					If (SD_t_CallingContactCode="")
						Check_ContDef(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
					End if 
					Orders_InLPArea
					If ([COMPANIES:2]Default_Layer:51#"")
						[ORDERS:24]Layer_Code:47:=[COMPANIES:2]Default_Layer:51
					End if 
					If ([COMPANIES:2]Default_Currency:59#"")
						[ORDERS:24]Currency_Code:32:=[COMPANIES:2]Default_Currency:59
					End if 
					Orders_InLPBDef
					[ORDERS:24]Order_Date:4:=Current date:C33(*)
					//[ORDERS]Order Type
					[ORDERS:24]Person:5:=<>PER_t_CurrentUserInitials
					[ORDERS:24]Required_Date:9:=Current date:C33(*)
					[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{3}
					[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[CONTRACTS:17]X_Contract_Billing_Product:11)
					For ($_l_Index; 1; Size of array:C274($_ad_DiaryDatesToCreate))
						CREATE RECORD:C68([ORDER_ITEMS:25])
						[ORDER_ITEMS:25]Item_Number:27:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
						[ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58)
						[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
						[ORDER_ITEMS:25]Required_Date:10:=$_ad_DiaryDatesToCreate{$_l_Index}
						[ORDER_ITEMS:25]Product_Code:2:=[PRODUCTS:9]Product_Code:1
						OrderI_SubLPPC
						SAVE RECORD:C53([ORDER_ITEMS:25])
					End for 
					Orders_InLPTot
					DB_SaveRecord(->[ORDERS:24])
					Gen_Alert("The created order is "+[ORDERS:24]Order_Code:3)
					
				End if 
			End if 
		End if 
	End if 
End if 
SVS_ContractLoadRules(True:C214)
ERR_MethodTrackerReturn("CON_SaveSubEntities"; $_t_oldMethodName)
