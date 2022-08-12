//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont_Sel2
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
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_BOOLEAN:C305(<>MultiCo; <>SelOr; $_bo_True)
	C_LONGINT:C283(<>AutoProc; $_l_CharPosition; $_l_GetFieldNames; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_ForeName; $_t_oldMethodName; $_t_SearchWithWIldCard; $_t_Surname; $1; vForename; vSurname)
	C_TEXT:C284(Vtitle; VwholeName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_Sel2")
//Cont_Sel2
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$1:="◊IA"
Else 
	If (((Length:C16($1)=1) & (Character code:C91($1)=64)) | ($1=""))
		//   ALL RECORDS([CONTACTS]) `10/07/02 pb
		//    QUERY SELECTION([CONTACTS];[CONTACTS]Deleted#1)  ` 10/07/02 pb
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)  //10/07/02 pb
	Else 
		$_l_position:=Position:C15(":"; $1)
		If ($_l_Position>0)
			$_t_Before:=Substring:C12($1; 1; $_l_position-1)
			$_t_After:=Substring:C12($1; $_l_position+1)
			$_l_TableNumber:=Table:C252(->[CONTACTS:1])
			$_l_LastField:=Get last field number:C255(Table:C252(->[CONTACTS:1]))
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
			: ($1="Contact: @")
				$1:=Substring:C12($1; 10; 32000)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1)
			: ($_l_SearchFieldNumber>0)
				
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
				If ($1="Company: @")
					$1:=Substring:C12($1; 10; 32000)
					If (<>MultiCo)
						QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$1; *)
						QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
						
						SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
						QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
						
					Else 
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$1)
					End if 
				Else 
					
					//``````````
					AA_LoadNameArrays
					VwholeName:=$1
					AA_ParseName(VwholeName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
					vForename:=Uppers2(vForename; 1)
					vSurname:=Uppers2(UppersSurname(vSurname); 1)
					VWholeName:=""
					Case of 
						: (VForename#"") & (VSurname#"")
							$_t_SearchWithWIldCard:=Sel_AtSign(vForename)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithWIldCard; *)
							$_t_SearchWithWIldCard:=Sel_AtSign(vSurname)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_SearchWithWIldCard)
							If (VTitle#"")
								$_t_SearchWithWIldCard:=Sel_AtSign(vTitle)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithWIldCard)
							End if 
							
						: (VSurname#"")
							$_t_SearchWithWIldCard:=Sel_AtSign(VSurname)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithWIldCard)
							If (VTitle#"")
								$_t_SearchWithWIldCard:=Sel_AtSign(vTitle)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithWIldCard)
							End if 
						: (VForename#"")
							$_t_SearchWithWIldCard:=Sel_AtSign(vForename)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithWIldCard; *)
							//there was not a first and surname entered
							QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Surname:5=$_t_SearchWithWIldCard)
							If (VTitle#"")
								$_t_SearchWithWIldCard:=Sel_AtSign(vTitle)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithWIldCard)
							End if 
							
							//``````````````
						Else 
							$_t_SearchWithWIldCard:=Sel_AtSign($1)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithWIldCard)
					End case 
					$_t_SearchWithWIldCard:=Sel_AtSign($1)
					SelOr_1(->[CONTACTS:1])
					If ((Records in selection:C76([CONTACTS:1])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithWIldCard)
						SelOr_2(->[CONTACTS:1])
						If ((Records in selection:C76([CONTACTS:1])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							If (($1="@ @") | ($1="@,@"))
								$_l_CharPosition:=Position:C15(","; $_t_SearchWithWIldCard)
								If ($_l_CharPosition>0)
									$_t_Surname:=Substring:C12($_t_SearchWithWIldCard; 1; $_l_CharPosition-1)
									$_t_ForeName:=RemoveLead(Substring:C12($_t_SearchWithWIldCard; $_l_CharPosition+1; 32000))
								Else 
									$_l_CharPosition:=Position:C15(" "; $_t_SearchWithWIldCard)
									$_t_ForeName:=Substring:C12($_t_SearchWithWIldCard; 1; $_l_CharPosition-1)
									$_t_Surname:=RemoveLead(Substring:C12($_t_SearchWithWIldCard; $_l_CharPosition+1; 32000))
								End if 
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
								SelOr_2(->[CONTACTS:1])
							End if 
							If ((Records in selection:C76([CONTACTS:1])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
								Sel_NoAtAt(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; $1; $_t_SearchWithWIldCard)
								SelOr_2(->[CONTACTS:1])
								If ((Records in selection:C76([CONTACTS:1])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
									If (<>MultiCo)
										Sel_NoAtAt(->[CONTACTS_COMPANIES:145]; ->[CONTACTS_COMPANIES:145]Company_Code:1; $1; $_t_SearchWithWIldCard)
										QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
										SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
										QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
										
									Else 
										Sel_NoAtAt(->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1; $1; $_t_SearchWithWIldCard)
									End if 
									SelOr_2(->[CONTACTS:1])
									If ((Records in selection:C76([CONTACTS:1])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
										If (<>MultiCo)
											Comp_Proj($_t_SearchWithWIldCard; ->[CONTACTS_COMPANIES:145]Company_Code:1)
											QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
											SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
											QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
											
										Else 
											Comp_Proj($_t_SearchWithWIldCard; ->[CONTACTS:1]Company_Code:1)
										End if 
										SelOr_3(->[CONTACTS:1])
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
		End case 
	End if 
End if 
QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
ERR_MethodTrackerReturn("Cont_Sel2"; $_t_oldMethodName)
