//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/06/2010 21:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr; $_bo_True; $0)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283(<>AutoProc; $_l_GetFieldNames; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $_t_SearchWithWIldCard; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Sel2")
If (Count parameters:C259>=1)
	$_t_Search:=$1
End if 

If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
	$0:=False:C215
Else 
	$0:=True:C214
	If (Count parameters:C259>=1)
		$_t_Search:=$1
	End if 
	vSelPrev:=$_t_Search
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([INVOICES:39])
	Else 
		If ($_t_Search="Invoice: @")
			$_t_Search:=Substring:C12($_t_Search; 10; 32000)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_Search)
		Else 
			$_l_position:=Position:C15(":"; $1)
			If ($_l_Position>0)
				$_t_Before:=Substring:C12($1; 1; $_l_position-1)
				$_t_After:=Substring:C12($1; $_l_position+1)
				$_l_TableNumber:=Table:C252(->[INVOICES:39])
				$_l_LastField:=Get last field number:C255($_l_TableNumber)
				For ($_l_GetFieldNames; 1; $_l_LastField)
					If (Is field number valid:C1000($_l_TableNumber; $_l_GetFieldNames))
						$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_GetFieldNames)
						$_t_FieldName:=Replace string:C233($_t_FieldName; "_"; " ")
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
					READ ONLY:C145([ORDER_ITEMS:25])
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_Search)
					Join_SelFast(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Invoice_Number:17; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1)
					UNLOAD RECORD:C212([ORDER_ITEMS:25])
					
				: ($_t_Search="Job: @")
					$_t_Search:=Substring:C12($_t_Search; 6; 32000)
					READ ONLY:C145([JOB_STAGES:47])
					QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_t_Search)
					Join_SelFast(->[JOB_STAGES:47]; ->[JOB_STAGES:47]Invoice_Number:10; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1)
					UNLOAD RECORD:C212([JOB_STAGES:47])
					
					
				: ($_t_Search="Company: @")
					$_t_Search:=Substring:C12($_t_Search; 10; 32000)
					CREATE SET:C116([COMPANIES:2]; "$Temp")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_Search)
					If (Records in selection:C76([COMPANIES:2])=0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_Search+"@")
					End if 
					If (Records in selection:C76([COMPANIES:2])>0)
						CREATE SET:C116([INVOICES:39]; "1")
						
						RELATE MANY SELECTION:C340([INVOICES:39]Company_Code:2)
						CREATE SET:C116([INVOICES:39]; "2")
						UNION:C120("1"; "2"; "1")
						CLEAR SET:C117("1")
						CLEAR SET:C117("2")
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
					
				: ($_t_Search#"◊IA")
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; $_t_Search; $_t_SearchAt)
					SelOr_1(->[INVOICES:39])
					If ((Records in selection:C76([INVOICES:39])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						Sel_NoAtAt(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; $_t_Search; $_t_SearchAt)
						SelOr_2(->[INVOICES:39])
						If ((Records in selection:C76([INVOICES:39])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							$_d_Date:=Date:C102($_t_Search)
							If ($_d_Date>!1982-01-01!)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Date:4=$_d_Date)
								SelOr_2(->[INVOICES:39])
							End if 
							If ((Records in selection:C76([INVOICES:39])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
								CompCont_Proj($_t_SearchAt; ->[INVOICES:39]Company_Code:2; ->[INVOICES:39]Contact_Code:3)
								SelOr_3(->[INVOICES:39])
							End if 
						End if 
					End if 
			End case 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Invoices_Sel2"; $_t_oldMethodName)