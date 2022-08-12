If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.OInsertDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OL_lb_DateIterations;0)
	//ARRAY BOOLEAN(PRD_aB_IssueInsert;0)
	//ARRAY BOOLEAN(PRD_abo_IssueInsert;0)
	//ARRAY DATE(PRD_ad_IssueDate;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY TEXT(OI_at_MultipleCodes;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	//ARRAY TEXT(PRD_at_IssueCode;0)
	C_DATE:C307($_d_FirstDate; $_d_LastDate; PRD_d_FIrstDate; PRD_d_LastDate)
	C_LONGINT:C283($_l_Column; $_l_Count; $_l_event; $_l_IssueRow; $_l_IssuesIndex; $_l_MultiplesRow; $_l_Row; $_l_SectionID; PRD_l_ExtraDates)
	C_REAL:C285(PRD_R_Quantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.OInsertDates"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(OL_lb_DateIterations; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			
			Case of 
				: ($_l_Column=1)
					$_l_SectionID:=OI_al_ComponentSectionID{OI_at_ProductSections}
					$_l_MultiplesRow:=Find in array:C230(OI_al_MultiplesIndex; $_l_SectionID)
					If ($_l_MultiplesRow<0)
						APPEND TO ARRAY:C911(OI_al_MultiplesIndex; $_l_SectionID)
						INSERT IN ARRAY:C227(OI_at_MultipleCodes; Size of array:C274(OI_at_MultipleCodes)+1; 1)
						$_l_MultiplesRow:=Size of array:C274(OI_at_MultipleCodes)
					End if 
					
					$_l_Count:=0
					$_d_FirstDate:=!00-00-00!
					$_d_LastDate:=!00-00-00!
					For ($_l_IssuesIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
						If (PRD_abo_IssueInsert{$_l_IssuesIndex})
							$_l_IssueRow:=Find in array:C230(OI_at_MultipleCodes{$_l_MultiplesRow}; PRD_at_IssueCode{$_l_IssuesIndex})
							If ($_l_IssueRow<0)  //it should not be there already if we just clicked on it but other than that it should be!
								$_l_IssueRow:=Find in array:C230(OI_at_MultipleCodes{$_l_MultiplesRow}; "")
								If ($_l_IssueRow<0)  //no blanks
									APPEND TO ARRAY:C911(OI_at_MultipleCodes{$_l_MultiplesRow}; "")
									$_l_IssueRow:=Size of array:C274(OI_at_MultipleCodes{$_l_MultiplesRow})
								End if 
								OI_at_MultipleCodes{$_l_MultiplesRow}{$_l_IssueRow}:=PRD_at_IssueCode{$_l_IssuesIndex}
							End if 
							$_l_Count:=$_l_Count+1
							If ($_d_FirstDate=!00-00-00!)
								$_d_FirstDate:=PRD_ad_IssueDate{$_l_IssuesIndex}
							End if 
							$_d_LastDate:=PRD_ad_IssueDate{$_l_IssuesIndex}
						Else 
							$_l_IssueRow:=Find in array:C230(OI_at_MultipleCodes{$_l_MultiplesRow}; PRD_at_IssueCode{$_l_IssuesIndex})
							If ($_l_IssueRow>0)
								OI_at_MultipleCodes{$_l_MultiplesRow}{$_l_IssueRow}:=""
							End if 
						End if 
					End for 
					PRD_R_Quantity:=$_l_Count+PRD_l_ExtraDates
					PRD_d_FIrstDate:=$_d_FirstDate
					PRD_d_LastDate:=$_d_LastDate
			End case 
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.OInsertDates"; $_t_oldMethodName)
