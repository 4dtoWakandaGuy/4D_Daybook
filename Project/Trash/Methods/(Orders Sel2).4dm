//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: Orders_Sel2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	C_BOOLEAN:C305(<>SelOr)
	C_LONGINT:C283(<>AutoProc; <>MENU_l_BarModule; $_l_GetFieldNames; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; $_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_POOrderNumbers; $_t_SearchAT; $_t_SearchWithWIldCard)
	C_TEXT:C284($1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_Sel2")

If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_POOrderNumbers:="◊IA"
Else 
	$_t_POOrderNumbers:=$1
	If (((Length:C16($_t_POOrderNumbers)=1) & (Character code:C91($_t_POOrderNumbers)=64)) | ($_t_POOrderNumbers=""))
		ALL RECORDS:C47([ORDERS:24])  //NG added the specific here
	Else 
		$_l_position:=Position:C15(":"; $1)
		If ($_l_Position>0)
			$_t_Before:=Substring:C12($1; 1; $_l_position-1)
			$_t_After:=Substring:C12($1; $_l_position+1)
			$_l_TableNumber:=Table:C252(->[ORDERS:24])
			$_l_LastField:=Get last field number:C255(Table:C252(->[ORDERS:24]))
			For ($_l_GetFieldNames; 1; $_l_LastField)
				If (Is field number valid:C1000($_l_TableNumber; $_l_GetFieldNames))
					$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_GetFieldNames)
					$_t_FieldName2:=Replace string:C233($_t_FieldName; "_"; " ")
					If ($_t_FieldName=$_t_Before) | ($_t_FieldName=$_t_Before)
						
						$_l_SearchFieldNumber:=$_l_GetFieldNames
						$_l_GetFieldNames:=$_l_LastField
					End if 
				End if 
			End for 
		End if 
		
		
		Case of 
			: ($_t_POOrderNumbers="PO: @") | ($_t_POOrderNumbers="Purchase order: @")
				
				If ($_t_POOrderNumbers="PO: @")
					
					$_t_POOrderNumbers:=Substring:C12($_t_POOrderNumbers; Length:C16("PO: ")+1)
					
					
				Else 
					$_t_POOrderNumbers:=Substring:C12($_t_POOrderNumbers; Length:C16("Purchase order: ")+1)
				End if 
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=$_t_POOrderNumbers)
				DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
				QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
			: ($_l_SearchFieldNumber>0)
				
				$_t_SearchWithWIldCard:=Sel_AtSign($_t_after)
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SearchFieldNumber)
				QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_after)
				If (Records in selection:C76($_Ptr_Table->)=0)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_SearchWithWIldCard)
				End if 
				
			Else 
				If ($_t_POOrderNumbers="Event: @")
					$_t_POOrderNumbers:=Substring:C12($_t_POOrderNumbers; 8; 32000)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Event_Code:48=$_t_POOrderNumbers)
					If ((vAutoFind) & (<>AutoFile="Attendees"))
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Company_Code:1=<>CompCode; *)
						QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Contact_Code:2=<>ContCode)
					End if 
				Else 
					If ($_t_POOrderNumbers="Company: @")
						$_t_POOrderNumbers:=Substring:C12($_t_POOrderNumbers; 10; 32000)
						QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$_t_POOrderNumbers)
					Else 
						If ($_t_POOrderNumbers="Contact: @")
							$_t_POOrderNumbers:=Substring:C12($_t_POOrderNumbers; 10; 32000)
							QUERY:C277([ORDERS:24]; [ORDERS:24]Contact_Code:2=$_t_POOrderNumbers)
						Else 
							If ($_t_POOrderNumbers="Order: @")
								$_t_POOrderNumbers:=Substring:C12($_t_POOrderNumbers; 8; 32000)
								QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_POOrderNumbers)
							Else 
								$_t_SearchAT:=Sel_AtSign($_t_POOrderNumbers)
								Sel_NoAtAt3(->[ORDERS:24]; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2; ->[ORDERS:24]Order_Code:3; $_t_POOrderNumbers; $_t_SearchAT)
								SelOr_1(->[ORDERS:24])
								If ((Records in selection:C76([ORDERS:24])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
									CompCont_Proj($_t_SearchAT; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
									SelOr_3(->[ORDERS:24])
								End if 
							End if 
						End if 
					End if 
				End if 
		End case 
	End if 
End if 
Sel_FindMy(->[ORDERS:24]; ->[ORDERS:24]Person:5; ->[ORDERS:24]Taken_By:17)
If (<>MENU_l_BarModule=10)
	QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Type:43="EVENT")
End if 
ERR_MethodTrackerReturn("Orders_Sel2"; $_t_oldMethodName)
