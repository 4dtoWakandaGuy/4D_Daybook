//%attributes = {}
If (False:C215)
	//Project Method Name:      Order_CustomerLabel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Vdetails)
	ARRAY TEXT:C222($_at_Printers; 0)
	C_BOOLEAN:C305($_bo_DymoInstalled; $_bo_DymoPrint; LAB_bo_Modified; $_bo_DymoInstalled; $_bo_DymoPrint; LAB_bo_Modified)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CurrentWinRefOLD; $_l_Index; $_l_OK; LAB_l_BUTTONNUM; LAB_l_Continue; LAB_t_BUTTONNUM; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CharacterPosition; $_l_CurrentWinRefOLD)
	C_LONGINT:C283($_l_Index; $_l_OK; LAB_l_BUTTONNUM; LAB_l_Continue; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; $_t_TextAdd; LAB_T_ADDRESS; LAB_t_AddressCounty; LAB_t_AddressLine1; LAB_t_AddressLine2; LAB_t_AddressPostCode; LAB_t_AddressPostCountry; LAB_t_AddressTown; LAB_t_BUTTON; LAB_t_CompanyName)
	C_TEXT:C284(Lab_t_Data1; Lab_t_Data10; Lab_t_Data12; Lab_t_Data13; Lab_t_Data14; Lab_t_Data15; Lab_t_Data16; Lab_t_Data17; Lab_t_Data18; Lab_t_Data19; Lab_t_Data2)
	C_TEXT:C284(Lab_t_Data20; Lab_t_Data3; Lab_t_Data5; Lab_t_Data6; Lab_t_Data7; Lab_t_Data8; Lab_t_Data9; LAB_t_PersonName; Vdetails; $_t_oldMethodName; $_t_TextAdd)
	C_TEXT:C284(LAB_T_ADDRESS; LAB_t_AddressCounty; LAB_t_AddressLine1; LAB_t_AddressLine2; LAB_t_AddressPostCode; LAB_t_AddressPostCountry; LAB_t_AddressTown; LAB_t_BUTTON; LAB_t_CompanyName; Lab_t_Data1; Lab_t_Data11)
	C_TEXT:C284(Lab_t_Data4; LAB_t_PersonName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_CustomerLabel")
//First Confirm the address for the label
LAB_t_PersonName:=""
LAB_t_CompanyName:=""
LAB_t_AddressLine1:=""
LAB_t_AddressLine2:=""
LAB_t_AddressTown:=""
LAB_t_AddressCounty:=""
LAB_t_AddressPostCode:=""
LAB_t_AddressPostCountry:=""
ARRAY TEXT:C222($_at_Printers; 0)
PRINTERS LIST:C789($_at_Printers)
$_bo_DymoInstalled:=False:C215
For ($_l_Index; 1; Size of array:C274($_at_Printers))
	$_l_CharacterPosition:=Position:C15("DYMO"; $_at_Printers{$_l_Index})
	If ($_l_CharacterPosition>0)
		$_bo_DymoInstalled:=True:C214
	End if 
End for 

If ($_bo_DymoInstalled)
	Gen_Confirm_WithHideOption(303; "Print to Dymo?"; "Yes"; "No")
	$_bo_DymoPrint:=(OK=1)
Else 
	$_bo_DymoPrint:=False:C215
End if 
OK:=1
If (Not:C34($_bo_DymoPrint))
	Case of 
		: ([ORDERS:24]X_DeliveryAddressID:59>0)
			QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[ORDERS:24]X_DeliveryAddressID:59)
			Vdetails:=[AddressRecords:125]FormattedAddress:12
		: ([ORDERS:24]Deliver_To:31#"")
			vDetails:=[ORDERS:24]Deliver_To:31
			//Extract the address from that!!
			$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
			If ($_l_CharacterPosition>0)
				LAB_t_PersonName:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
				Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
				$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
				If ($_l_CharacterPosition>0)
					
					LAB_t_CompanyName:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
					Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
					$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
					If ($_l_CharacterPosition>0)
						LAB_t_AddressLine1:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
						Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
						$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
						If ($_l_CharacterPosition>0)
							LAB_t_AddressLine2:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
							Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
							$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
							If ($_l_CharacterPosition>0)
								LAB_t_AddressTown:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
								Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
								$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
								If ($_l_CharacterPosition>0)
									LAB_t_AddressCounty:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
									Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
									$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
									If ($_l_CharacterPosition>0)
										LAB_t_AddressPostCode:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
										Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
										$_l_CharacterPosition:=Position:C15(Char:C90(13); Vdetails)
										If ($_l_CharacterPosition>0)
											LAB_t_AddressPostCountry:=Substring:C12(Vdetails; 1; $_l_CharacterPosition-1)
											Vdetails:=Substring:C12(Vdetails; ($_l_CharacterPosition+1); Length:C16(Vdetails))
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
			
			
		Else 
			If ([ORDERS:24]Delivery_Company:29#"")
				RELATE ONE:C42([ORDERS:24]Delivery_Company:29)
				RELATE ONE:C42([ORDERS:24]Delivery_Contact:30)
			Else 
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				RELATE ONE:C42([ORDERS:24]Contact_Code:2)
			End if 
			LAB_t_PersonName:=[CONTACTS:1]Contact_Name:31
			LAB_t_CompanyName:=[COMPANIES:2]Company_Name:2
			LAB_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
			LAB_t_AddressLine2:=[COMPANIES:2]Address_Line_two:4
			LAB_t_AddressTown:=[COMPANIES:2]Town_or_City:5
			LAB_t_AddressCounty:=[COMPANIES:2]County_or_State:6
			LAB_t_AddressPostCode:=[COMPANIES:2]Postal_Code:7
			LAB_t_AddressPostCountry:=[COMPANIES:2]Country:8
			
			
			
	End case 
	
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	DIALOG:C40([USER:15]; "Address_Confirm")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (LAB_l_Continue=1)
		//the user has confirmed the delivery details
		//format them and store them as the delivery address
		LAB_T_ADDRESS:=LAB_BuildAddress(LAB_t_AddressLine1; LAB_t_AddressLine2; LAB_t_AddressTown; LAB_t_AddressCounty; LAB_t_AddressPostCode; LAB_t_AddressPostCountry)
		$_t_TextAdd:=""
		If (LAB_t_PersonName#"")
			$_t_TextAdd:=LAB_t_PersonName+Char:C90(13)
		End if 
		If (LAB_t_CompanyName#"")
			$_t_TextAdd:=$_t_TextAdd+LAB_t_CompanyName+Char:C90(13)
		End if 
		LAB_T_ADDRESS:=$_t_TextAdd+LAB_T_ADDRESS
		If (LAB_bo_Modified)
			[ORDERS:24]Deliver_To:31:=LAB_T_Address
		End if 
		CONFIRM:C162("Large Labels/Small Labels?"; "Large"; "Small")
		If (OK=1)
			//ONE LABEL-no setup
			Lab_t_Data1:=LAB_T_ADDRESS
			$_l_OK:=PRINT_SetSIZE("A4"; "P"; "LAB7167")
			If ($_l_OK>=0)
				If ($_l_OK=1)
					PRINT SETTINGS:C106
					$_l_OK:=OK
				Else 
					$_l_OK:=1
				End if 
				If ($_l_OK=1)
					Print form:C5([USER:15]; "LAB_L7167")
					PAGE BREAK:C6
					PRT_SetPrinterPaperOptions("LAB7167")
				End if 
			End if 
		Else 
			Open window:C153(20; 20; 20; 20; 1)
			DIALOG:C40([CONTACTS:1]; "LAB_SelectL7160")
			CLOSE WINDOW:C154
			
			If (LAB_l_Continue=1)
				If (Num:C11(LAB_t_BUTTON)=0)
					LAB_l_BUTTONNUM:=1
				Else 
					LAB_l_BUTTONNUM:=Num:C11(LAB_t_BUTTON)
					
				End if 
				For ($_l_Index; 1; 21)
					
					$_ptr_Variable:=Get pointer:C304("Lab_t_Data"+String:C10($_l_Index))
					$_ptr_Variable->:=""
				End for 
				
				$_ptr_Variable:=Get pointer:C304("Lab_t_Data"+String:C10(LAB_l_BUTTONNUM))
				$_ptr_Variable->:=LAB_T_ADDRESS
				$_l_OK:=PRINT_SetSIZE("A4"; "P"; "LAB7160")
				If ($_l_OK>=0)  // See in PRint_setSize about this
					If ($_l_OK=1)
						PRINT SETTINGS:C106
						$_l_OK:=OK
					Else 
						$_l_OK:=1
					End if 
					If ($_l_OK=1)
						Print form:C5([USER:15]; "LAB_L7160")
						PAGE BREAK:C6
						PRT_SetPrinterPaperOptions("LAB7160")
					End if 
					
				End if 
				
			End if 
			
			
			
			
			
		End if 
		
	End if 
Else 
	PRT_DymoLabel("Order Customer Label"; ->[ORDERS:24]; 1)
End if 
ERR_MethodTrackerReturn("Order_CustomerLabel"; $_t_oldMethodName)
