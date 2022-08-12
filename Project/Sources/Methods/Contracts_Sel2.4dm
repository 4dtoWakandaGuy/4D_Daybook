//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/06/2010 07:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_True)
	C_LONGINT:C283(<>AutoProc; $_l_GetFieldNames; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $_t_SearchWithWIldCard; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([CONTRACTS:17])
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
			: ($_t_Search="Contract: @")
				$_t_Search:=Substring:C12($_t_Search; 11; 32000)
				QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=$_t_Search)
			: ($_t_Search="Company: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=$_t_Search)
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
				
				Sel_NoAtAt(->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; $_t_Search; $_t_SearchAt)
				If (Records in selection:C76([CONTRACTS:17])=0)
					Sel_NoAtAt(->[CONTRACTS:17]; ->[CONTRACTS:17]Company_Code:1; $_t_Search; $_t_SearchAt)
					If (Records in selection:C76([CONTRACTS:17])=0)
						CompCont_Proj($_t_SearchAt; ->[CONTRACTS:17]Company_Code:1; ->[CONTRACTS:17]Contact_Code:2)
					End if 
					
				End if 
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("Contracts_Sel2"; $_t_oldMethodName)