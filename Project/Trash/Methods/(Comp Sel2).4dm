//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	C_BOOLEAN:C305(<>MultiCo; <>SelOr; $_bo_Exit; COM_bo_TypesInited)
	C_LONGINT:C283(<>AutoProc; <>COMPSELPROC; $_l_GetFieldNames; $_l_LabelLength; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_After; $_t_Before; $_t_CompanyAbbreviated; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_SearchFlag; $_t_SearchWithWIldCard; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_Sel2")
//Comp_Sel2
If (Not:C34(COM_bo_TypesInited))
	ARRAY TEXT:C222(COM_at_CompanyTypes; 4)
	
	COM_at_CompanyTypes{1}:="Show Companies only"
	COM_at_CompanyTypes{2}:="Show Private Individuals only"
	COM_at_CompanyTypes{3}:="-"
	COM_at_CompanyTypes{4}:="Show Companies and Private Individuals"
	COM_bo_TypesInited:=True:C214
End if 
//COM_at_CompanyTypes:=0
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_SearchFlag:="◊IA"
Else 
	If (((Length:C16($1)=1) & (Character code:C91($1)=64)) | ($1=""))
		ALL RECORDS:C47([COMPANIES:2])
	Else 
		$_l_position:=Position:C15(":"; $1)
		If ($_l_Position>0)
			$_t_Before:=Substring:C12($1; 1; $_l_position-1)
			$_t_After:=Substring:C12($1; $_l_position+1)
			$_l_TableNumber:=Table:C252(->[COMPANIES:2])
			$_l_LastField:=Get last field number:C255(Table:C252(->[COMPANIES:2]))
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
			: ($1="Company Code: @")
				$_l_LabelLength:=Length:C16("Company Code:")
				$1:=Substring:C12($1; $_l_LabelLength+1)
				Repeat 
					$_bo_Exit:=False:C215
					If (Length:C16($1)>1)
						If ($1[[1]]=" ")
							$1:=Substring:C12($1; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
				
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
				If (Records in selection:C76([COMPANIES:2])=0)
					$_t_SearchWithWIldCard:=Sel_AtSign($1)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_SearchWithWIldCard)
				End if 
			: ($1="Company:@")
				$_l_LabelLength:=Length:C16("Company: ")
				$1:=Substring:C12($1; $_l_LabelLength+1)
				Repeat 
					$_bo_Exit:=False:C215
					If (Length:C16($1)>1)
						If ($1[[1]]=" ")
							$1:=Substring:C12($1; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
				
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$1)
				If (Records in selection:C76([COMPANIES:2])=0)
					$_t_SearchWithWIldCard:=Sel_AtSign($1)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_SearchWithWIldCard)
				End if 
			: ($_l_SearchFieldNumber>0)  //we know what field to search
				
				$_t_SearchWithWIldCard:=Sel_AtSign($_t_after)
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SearchFieldNumber)
				QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_after)
				If (Records in selection:C76($_Ptr_Table->)=0)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_SearchWithWIldCard)
				End if 
			Else 
				$_t_SearchWithWIldCard:=Sel_AtSign($1)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
				SelOr_1(->[COMPANIES:2])
				If ((Records in selection:C76([COMPANIES:2])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_SearchWithWIldCard; *)
					QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Company_Name:2=$_t_SearchWithWIldCard; *)
					QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Also_Known_As:43=$_t_SearchWithWIldCard; *)
					$_t_CompanyAbbreviated:=Companies_Abbr($1)+"@"
					QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Company_Abbreviated_Name:52=$_t_CompanyAbbreviated)
					SelOr_2(->[COMPANIES:2])
					If ((Records in selection:C76([COMPANIES:2])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_SearchWithWIldCard)
						SelOr_2(->[COMPANIES:2])
						If ((Records in selection:C76([COMPANIES:2])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_SearchWithWIldCard)
							SelOr_2(->[COMPANIES:2])
							If (((Records in selection:C76([COMPANIES:2])=0) | ((<>SelOr) & (vAutoFind=False:C215))) & (Count parameters:C259=1))
								Cont_SelFS($_t_SearchWithWIldCard)
								If (<>MultiCo)
									
									Comp_SelMCRel
									
									
								Else 
									MESSAGES OFF:C175
									RELATE ONE SELECTION:C349([CONTACTS:1]; [COMPANIES:2])
									MESSAGES ON:C181
								End if 
								SelOr_3(->[COMPANIES:2])
							Else 
								If (Count parameters:C259#1)
									SelOr_3(->[COMPANIES:2])
								End if 
							End if 
						End if 
					End if 
				End if 
		End case 
	End if 
End if 

Sel_FindMy(->[COMPANIES:2]; ->[COMPANIES:2]Sales_Person:29; ->[COMPANIES:2]Taken_By:26)
QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61#1)
If (COM_at_CompanyTypes>0)
	Case of 
		: (COM_at_CompanyTypes=1)  //COmpanies
			QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37#True:C214)
		: (COM_at_CompanyTypes=2)  //people
			QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
	End case 
End if 

CREATE SET:C116([COMPANIES:2]; "<>FOUNDSELECTION")
<>COMPSELPROC:=0
ERR_MethodTrackerReturn("Comp_Sel2"; $_t_oldMethodName)