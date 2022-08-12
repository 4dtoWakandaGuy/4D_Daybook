//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders BWBEx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Save; $_bo_Unload)
	C_DATE:C307($_d_OrderDate)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_CharPosition; $_l_DN; $_l_ItemIndex; $_t_OrderBatchNumber; MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_BatchNumberS; $_t_DC; $_t_DNS; $_t_OCI; $_t_oldMethodName; vContrCode; vTitle5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders BWBEx")
//Orders BWBEx
COPY NAMED SELECTION:C331([ORDERS:24]; "$Selection")
Userset
FIRST RECORD:C50([ORDERS:24])
$_t_OrderBatchNumber:=[ORDERS:24]Export_Batch_Number:45
If ($_t_OrderBatchNumber#0)
	Gen_Confirm("BWB Export Function"+Char:C90(13)+Char:C90(13)+"Do you want to find Orders not exported, or those with Batch No "+String:C10($_t_OrderBatchNumber)+"?"; "Not exported"; "Batch No")
	If (OK=1)
		$_t_OrderBatchNumber:=0
	End if 
End if 
QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Export_Batch_Number:45=$_t_OrderBatchNumber)
If (Records in selection:C76([ORDERS:24])>0)
	Gen_Confirm(String:C10(Records in selection:C76([ORDERS:24]))+" Orders to be Exported"+Char:C90(13)+Char:C90(13)+"Please Name the file to store them in"; ""; "")
	If (OK=1)
		
		If ($_t_OrderBatchNumber=0)
			$_t_OrderBatchNumber:=Gen_Code(26; ->[ORDERS:24]Export_Batch_Number:45)
		End if 
		If ($_t_OrderBatchNumber>0)
			If ($_t_OrderBatchNumber>999)
				$_t_OrderBatchNumber:=$_t_OrderBatchNumber-999
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=26)
				[IDENTIFIERS:16]Number:2:=$_t_OrderBatchNumber
				DB_SaveRecord(->[IDENTIFIERS:16])
				UNLOAD RECORD:C212([IDENTIFIERS:16])
			End if 
			$_t_BatchNumberS:=Str LeadZeros(String:C10($_t_OrderBatchNumber); 3)
			
			SET CHANNEL:C77(12; "")
			If (OK=1)
				READ ONLY:C145([USER:15])
				$_bo_Unload:=(Records in selection:C76([USER:15])=0)
				If (<>SYS_l_LoggedInaccount=0)
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
				Else 
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
				End if 
				
				SEND PACKET:C103("A00"+$_t_BatchNumberS+(" "*122)+Char:C90(13)+Char:C90(10))
				
				FIRST RECORD:C50([ORDERS:24])
				While (Not:C34(End selection:C36([ORDERS:24])))
					SEND PACKET:C103("A01"+$_t_BatchNumberS)
					If ([ORDERS:24]Total_Amount:6<0)
						$_t_OCI:="OC"
						$_t_DC:="C"
					Else 
						$_t_OCI:="OI"
						$_t_DC:="D"
					End if 
					SEND PACKET:C103($_t_OCI)
					$_bo_Save:=False:C215
					If ([ORDERS:24]Export_Document_Number:46#0)
						$_l_DN:=[ORDERS:24]Export_Document_Number:46
					Else 
						$_l_DN:=Gen_Code(27; ->[ORDERS:24]Export_Document_Number:46)
						[ORDERS:24]Export_Document_Number:46:=$_l_DN
						$_bo_Save:=True:C214
					End if 
					If ([ORDERS:24]Export_Batch_Number:45=0)
						[ORDERS:24]Export_Batch_Number:45:=$_t_OrderBatchNumber
						$_bo_Save:=True:C214
					End if 
					If ($_bo_Save)
						DB_SaveRecord(->[ORDERS:24])
						AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
					End if 
					If (($_l_DN>[USER:15]BWB Doc No T:167) | ($_l_DN<[USER:15]BWB Doc No F:166))
						$_l_DN:=[USER:15]BWB Doc No F:166
						QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=27)
						[IDENTIFIERS:16]Number:2:=$_l_DN
						DB_SaveRecord(->[IDENTIFIERS:16])
						UNLOAD RECORD:C212([IDENTIFIERS:16])
					End if 
					$_t_DNS:=Str LeadZeros(String:C10($_l_DN); 8)
					SEND PACKET:C103($_t_DNS+"01")
					
					$_l_CharPosition:=Position:C15("/"; [ORDERS:24]Company_Code:1)
					SEND PACKET:C103(Str_TrailSpaces(Substring:C12([ORDERS:24]Company_Code:1; $_l_CharPosition+1; 5); 5)+(" "*7)+"01"+$_t_DC)
					Case of 
						: ([ORDERS:24]Order_Date:4>!00-00-00!)
							$_d_OrderDate:=[ORDERS:24]Order_Date:4
						: ([ORDERS:24]Quotation_Date:26>!00-00-00!)
							$_d_OrderDate:=[ORDERS:24]Quotation_Date:26
						Else 
							$_d_OrderDate:=[ORDERS:24]Enquiry_Date:25
					End case 
					SEND PACKET:C103(Date_DDMMYYSl($_d_OrderDate)+"Y")
					
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
					SEND PACKET:C103(Str LeadZeros(Substring:C12(String:C10(Records in selection:C76([ORDER_ITEMS:25])+1); 1; 2); 2))  //no of A02 +1 for the A01
					SEND PACKET:C103(Str LeadZeros(Substring:C12(String:C10(Abs:C99(Sum:C1([ORDER_ITEMS:25]Quantity:3))); 1; 5); 5))  //=#Qty field! =total of the qties of A02, 45;5
					SEND PACKET:C103(Str_ZeroAmt(Abs:C99([ORDERS:24]Total_Amount:6); 17))
					SEND PACKET:C103((" "*62)+Char:C90(13)+Char:C90(10))
					
					$_l_ItemIndex:=2
					ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
					FIRST RECORD:C50([ORDER_ITEMS:25])
					While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
						
						SEND PACKET:C103("A02"+$_t_BatchNumberS+$_t_OCI+$_t_DNS+Str LeadZeros(String:C10($_l_ItemIndex); 2))
						SEND PACKET:C103(Str_TrailSpaces(Uppercase:C13(Substring:C12([ORDER_ITEMS:25]Product_Name:13; 1; 24)); 24))
						If (([ORDER_ITEMS:25]TAX_Amount:8=0) & ([ORDER_ITEMS:25]Sales_Price:4=0))
							SEND PACKET:C103((" "*24)+(" "*5)+(" "*17)+(" "*3))
						Else 
							SEND PACKET:C103(Str_TrailSpaces(Uppercase:C13(Substring:C12([USER:15]BWB Acc No:165; 1; 24)); 24))
							SEND PACKET:C103(Str LeadZeros(String:C10(Abs:C99(Int:C8([ORDER_ITEMS:25]Quantity:3))); 5))
							SEND PACKET:C103(Str_ZeroAmt(Abs:C99([ORDER_ITEMS:25]Sales_Price:4); 17))
							SEND PACKET:C103(" ")
							If ([ORDER_ITEMS:25]TAX_Amount:8#0)
								SEND PACKET:C103("YS")
							Else 
								SEND PACKET:C103("NX")
							End if 
						End if 
						SEND PACKET:C103((" "*37)+Char:C90(13)+Char:C90(10))
						
						$_l_ItemIndex:=$_l_ItemIndex+1
						If ($_l_ItemIndex>99)
							$_l_ItemIndex:=2
						End if 
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End while 
					
					NEXT RECORD:C51([ORDERS:24])
				End while 
				
				SET CHANNEL:C77(11)
				If ($_bo_Unload)
					UNLOAD RECORD:C212([USER:15])
				End if 
			End if 
			
		End if 
	End if 
	
	If ($_t_OrderBatchNumber>0)
		Gen_Confirm("Do you want to print a list of the data?"; "Yes"; "No")
		If (OK=1)
			READ ONLY:C145([USER:15])
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (<>SYS_l_LoggedInaccount=0)
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
			Else 
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
			End if 
			vTitle5:=Str_TrailSpaces(Uppercase:C13(Substring:C12([USER:15]BWB Acc No:165; 1; 24)); 24)
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			vContrCode:=Str LeadZeros(String:C10($_t_OrderBatchNumber); 3)
			FORM SET OUTPUT:C54([ORDERS:24]; "Orders BWB")
			PRINT SELECTION:C60([ORDERS:24])
			
			FORM SET OUTPUT:C54([ORDERS:24]; "Orders Out"+("V"*(Num:C11(MOD_l_CurrentModuleAccess=13))))
		End if 
	End if 
	
Else 
	Gen_Alert("No Orders need exporting"; "Cancel")
	USE NAMED SELECTION:C332("$Selection")
End if 
CLEAR NAMED SELECTION:C333("$Selection")
ERR_MethodTrackerReturn("Orders BWBEx"; $_t_oldMethodName)
