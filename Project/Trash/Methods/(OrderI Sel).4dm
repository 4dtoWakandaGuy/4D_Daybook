//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_True; $2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(<>AutoProc; $_l_GetFieldNames; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber; vOrdI; xNext)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284(<>OrderCode; <>ProdCode; $_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_SearchWithWIldCard; $1; $_t_Search; $_t_SearchAt)
	C_TEXT:C284(VSELPREV)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI Sel")

vOrdI:=1
If (vSelPrev="•FSC")
	OrderI_SelP
Else 
	If (<>OrderCode#"")
		$_t_Search:="Order: "+<>OrderCode
	Else 
		$_t_Search:=""
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:=$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	If (Count parameters:C259=0)
		$_t_Search:=Gen_SearchA("Order, Company or Product Code to find:"; vSelPrev; "Find Order Items"; $_t_Search; Sel_CompCode; <>ProdCode)
	End if 
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			If (<>AutoProc=987654321)
				<>AutoProc:=0
				USE NAMED SELECTION:C332("◊IA")
				$_t_Search:="◊IA"
			Else 
				If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1#"")
				Else 
					$_l_position:=Position:C15(":"; $1)
					If ($_l_Position>0)
						$_t_Before:=Substring:C12($1; 1; $_l_position-1)
						$_t_After:=Substring:C12($1; $_l_position+1)
						$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
						$_l_LastField:=Get last field number:C255($_l_TableNumber)
						For ($_l_GetFieldNames; 1; $_l_LastField)
							If (Is field number valid:C1000($_l_TableNumber; $_l_GetFieldNames))
								$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_GetFieldNames)
								$_t_FieldName2:=Replace string:C233($_t_FieldName; "_"; " ")
								If ($_t_FieldName=$_t_Before) | ($_t_FieldName2=$_t_Before)
									$_l_SearchFieldNumber:=$_l_GetFieldNames
									$_l_GetFieldNames:=$_l_LastField
								End if 
							End if 
						End for 
					End if 
					
					
					Case of 
						: ($_t_Search="Order: @")
							$_t_Search:=Substring:C12($_t_Search; 8; 32000)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_Search)
							
						: ($_t_Search="Company: @")
							$_t_Search:=Substring:C12($_t_Search; 10; 32000)
							QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$_t_Search)
							If (Records in selection:C76([ORDERS:24])>0)
								Project_SelFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1)
							End if 
						: ($_l_SearchFieldNumber>0)  //we know what field to search
							
							$_t_SearchWithWIldCard:=Sel_AtSign($_t_after)
							$_Ptr_Table:=Table:C252($_l_TableNumber)
							$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SearchFieldNumber)
							
							Case of 
								: (Type:C295($_Ptr_Field->)=Is text:K8:3) | (Type:C295($_Ptr_Field->)=Is alpha field:K8:1)
									
									QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_after)
								: (Type:C295($_Ptr_Field->)=Is longint:K8:6) | (Type:C295($_Ptr_Field->)=Is integer:K8:5) | (Type:C295($_Ptr_Field->)=Is real:K8:4)
									
									QUERY:C277($_Ptr_Table->; $_Ptr_Field->=Num:C11($_t_after))
								: (Type:C295($_Ptr_Field->)=Is boolean:K8:9)
									$_bo_True:=($_t_after="1") | ($_t_after="TRUE")
									
									QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_bo_True)
								: (Type:C295($_Ptr_Field->)=Is date:K8:7)
									QUERY:C277($_Ptr_Table->; $_Ptr_Field->=Date:C102($_t_after))
								: (Type:C295($_Ptr_Field->)=Is time:K8:8)
									QUERY:C277($_Ptr_Table->; $_Ptr_Field->=Time:C179($_t_after))
									
							End case 
							If (Records in selection:C76($_Ptr_Table->)=0)
								Case of 
									: (Type:C295($_Ptr_Field->)=Is text:K8:3) | (Type:C295($_Ptr_Field->)=Is alpha field:K8:1)
										QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_SearchWithWIldCard)
										
								End case 
							End if 
							
							
						Else 
							$_t_SearchAt:=Sel_AtSign($_t_Search)
							Sel_NoAtAt(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1; $_t_Search; $_t_SearchAt)
							If (Records in selection:C76([ORDER_ITEMS:25])=0)
								Sel_NoAtAt(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Product_Code:2; $_t_Search; $_t_SearchAt)
								If (Records in selection:C76([ORDER_ITEMS:25])=0)
									Sel_NoAtAt(->[ORDERS:24]; ->[ORDERS:24]Company_Code:1; $_t_Search; $_t_SearchAt)
									If (Records in selection:C76([ORDERS:24])>0)
										Project_SelFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1)
									Else 
										CompCont_Proj($_t_SearchAt; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
										If (Records in selection:C76([ORDERS:24])>0)
											Project_SelFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1)
										End if 
									End if 
								End if 
							End if 
					End case 
					
				End if 
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1#"")
			End if 
		Else 
			OrderI_SelP
		End if 
	Else 
		vOrdI:=0
	End if 
End if 
ERR_MethodTrackerReturn("OrderI Sel"; $_t_oldMethodName)
