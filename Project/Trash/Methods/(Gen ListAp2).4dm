//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ListAp2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Boolean; 0)
	ARRAY DATE:C224($_ad_Date; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	ARRAY REAL:C219($_ar_Real; 0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	ARRAY TEXT:C222($_at_Stamps; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305($_bo_ClearValues; $_bo_YN; $6; DB_bo_RecordModified; VTextIsListItem)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_FieldLength; $_l_FieldNumber; $_l_FieldRow; $_l_FieldType; $_l_Index; $_l_PreviewRow; $_l_Process; $_l_Progress; $_l_RecordsCount; $_l_TableArrayRow)
	C_LONGINT:C283($_l_TableNumberRow; $_l_ValueN; $_l_Y; $1; ch1; r0; r1; r2; r3; r4; vNo)
	C_LONGINT:C283(VTextID)
	C_POINTER:C301($_ptr_Field; $_ptr_FieldPointer; $2)
	C_REAL:C285(vAmount)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ChangeType; $_t_Message; $_t_oldMethodName; $_t_oldMethodName2; $_t_PreviewName; $_t_Stamp; $_t_Text; $3; $4; $5)
	C_TEXT:C284(vName; Vtext; vTitle20)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_ListAp2")

//Gen_ListAp2
If (Count parameters:C259>=3)
	$_t_PreviewName:=$3
	
	$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; VNO)
	$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewTypeN; $_t_PreviewName)
	
	If ($_t_PreviewName#"FF:@")
		If ($_l_PreviewRow>0)
			$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_TableNumberRow}{$_l_PreviewRow}
		Else 
			$_l_FieldNumber:=0
		End if 
	Else 
		$_l_FieldNumber:=0
	End if 
Else 
	$_t_PreviewName:=vName
End if 
If (Count parameters:C259>=5)
	$_t_Text:=$5
Else 
	$_t_Text:=Vtext
End if 
If (Count parameters:C259>=4)
	$_t_ChangeType:=$4
Else 
	$_t_ChangeType:=""
End if 
If (Count parameters:C259>=5)
	$_bo_ClearValues:=$6
Else 
	$_bo_ClearValues:=False:C215
	
End if 
If ($_t_PreviewName#"")
	If ((Records in set:C195("Userset")=0) & (Records in selection:C76($2->)>1))
		vNo:=Records in selection:C76($2->)
		Gen_Confirm("Are you sure you want to apply the change to all "+String:C10(vNo)+" records?"; "Yes"; "No")
	Else 
		Userset
		vNo:=Records in selection:C76($2->)
		Gen_Confirm("Apply change to "+String:C10(vNo)+" record"+("s"*(Num:C11(vNo>1)))+"?"; "Yes"; "No")
	End if 
	//TRACE
	If ((OK=1) & (($_t_Text="") | ($_bo_ClearValues)))
		If ($_bo_ClearValues)
			$_t_Text:=""
		End if 
		Gen_Confirm("Are you sure you want to clear entries from this field?"; "No"; "Yes")
		If (OK=1)
			OK:=0
		Else 
			OK:=1
		End if 
	End if 
	If (OK=1)
		If ($_t_PreviewName="FF:@")
			If (Count parameters:C259<6)
				Gen_ListApFF($1; $2)
			Else 
				
				Gen_ListApFF($1; $2; $3; $4; $5; $6)
			End if 
		Else 
			$_l_Y:=1
			$_ptr_FieldPointer:=Field:C253($1; $_l_FieldNumber)
			GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
			$_l_FieldRow:=0
			If (False:C215)
				$_l_FieldRow:=Find in array:C230(<>SYS_at_CurrentTableFieldNames; "Export")
				If ($_l_FieldRow>0)
					$_l_TableArrayRow:=Find in array:C230(<>DB_al_TableNums; $1)
					$_l_FieldRow:=<>SYS_al_2DFieldNumbers{$_l_TableArrayRow}{$_l_FieldRow}
				End if 
				
				If (($_l_FieldRow>0) & (ch1=1))
					If ($_l_FieldRow=$_l_FieldNumber)
						$_l_FieldRow:=0
					Else 
						$_ptr_Field:=Field:C253($1; $_l_FieldRow)
					End if 
				End if 
			End if 
			$_l_RecordsCount:=Records in selection:C76($2->)
			If ($_l_RecordsCount>9)
				$_t_Message:="Applying to "+String:C10($_l_RecordsCount)+" records ..."
				$_l_Progress:=Progress2_Start($_t_Message)
			Else 
				$_t_Message:=""
				$_l_Progress:=0
			End if 
			If ($_l_Progress=0)
				$_l_Process:=Current process:C322
			Else 
				$_l_Process:=$_l_Progress
			End if 
			<>SYS_l_CancelProcess:=0
			
			Case of 
				: (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
					If (VTextIsListItem)
						$_l_ValueN:=VTextID
						VTextIsListItem:=False:C215
					Else 
						$_l_ValueN:=Num:C11($_t_Text)
					End if 
					
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Change to")
						ARRAY REAL:C219($_ar_Real; $_l_RecordsCount)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_ar_Real{$_l_Index}:=$_l_ValueN
						End for 
						Progress2_Call($_l_Progress; $_t_Message; 2; 10)
						If (<>SYS_l_CancelProcess#$_l_Process)
							ARRAY TO SELECTION:C261($_ar_Real; $_ptr_FieldPointer->)
						End if 
					Else 
						$_l_Index:=1
						FIRST RECORD:C50($2->)
						While ((Not:C34(End selection:C36($2->))) & (<>SYS_l_CancelProcess#$_l_Process))
							Case of 
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Add to@")
									
									$_ptr_FieldPointer->:=Round:C94(($_ptr_FieldPointer->+$_l_ValueN); 2)
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Subtract From@")
									$_ptr_FieldPointer->:=Round:C94(($_ptr_FieldPointer->-$_l_ValueN); 2)
								: ((r3=1) & (Count parameters:C259<3)) | ($_t_ChangeType="%@")
									$_ptr_FieldPointer->:=Round:C94(($_ptr_FieldPointer->*($_l_ValueN/100)); 2)
								: ((r4=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Evaluated@")
									$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vAmount:="+$_t_Text)
									EXECUTE FORMULA:C63("vAmount:="+$_t_Text)
									$_ptr_FieldPointer->:=Round:C94((vAmount); 2)
							End case 
							If (False:C215)
								If (($_l_FieldRow>0) & (ch1=1))
									$_ptr_Field->:=Export_Stamp2($_ptr_Field->)
								End if 
							End if 
							DB_SaveRecord($2)
							Progress2_Call($_l_Progress; "Applied "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsCount); $_l_Index; $_l_RecordsCount)
							NEXT RECORD:C51($2->)
							$_l_Index:=$_l_Index+1
						End while 
					End if 
					
				: ($_l_FieldType=4)
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Change to")
						$_d_Date:=Date:C102($_t_Text)
						ARRAY DATE:C224($_ad_Date; $_l_RecordsCount)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_ad_Date{$_l_Index}:=$_d_Date
						End for 
						Progress2_Call($_l_Progress; $_t_Message; 2; 10)
						If (<>SYS_l_CancelProcess#$_l_Process)
							ARRAY TO SELECTION:C261($_ad_Date; $_ptr_FieldPointer->)
						End if 
					Else 
						$_l_Index:=1
						FIRST RECORD:C50($2->)
						While ((Not:C34(End selection:C36($2->))) & (<>SYS_l_CancelProcess#$_l_Process))
							Case of 
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Add to@")
									$_ptr_FieldPointer->:=$_ptr_FieldPointer->+Num:C11($_t_Text)
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Subtract From@")
									$_ptr_FieldPointer->:=$_ptr_FieldPointer->-Num:C11($_t_Text)
								: ((r4=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Evaluated@")
									$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vDate:="+$_t_Text)
									EXECUTE FORMULA:C63("$_d_Date:="+$_t_Text)
									$_ptr_FieldPointer->:=$_d_Date
							End case 
							If (False:C215)
								If (($_l_FieldRow>0) & (ch1=1))
									$_ptr_Field->:=Export_Stamp2($_ptr_Field->)
								End if 
							End if 
							
							DB_SaveRecord($2)
							Progress2_Call($_l_Progress; "Applied "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsCount); $_l_Index; $_l_RecordsCount)
							NEXT RECORD:C51($2->)
							$_l_Index:=$_l_Index+1
						End while 
					End if 
					
				: (($_l_FieldType=3) | ($_l_FieldType=7))
					$_l_Y:=0
					
				: ($_l_FieldType=6)
					If ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Change to")
						$_bo_YN:=(($_t_Text="1") | ($_t_Text="Y@") | ($_t_Text="true"))
						ARRAY BOOLEAN:C223($_abo_Boolean; $_l_RecordsCount)
						//  For ($_l_Index;1;$_l_RecordsCount)
						// $_abo_Boolean{$_l_Index}:=$_bo_YN
						// End for
						Progress2_Call($_l_Progress; $_t_Message; 2; 10)
						If (<>SYS_l_CancelProcess#$_l_Process)
							If (Not:C34(In transaction:C397))
								DB_lockFile($2)
								APPLY TO SELECTION:C70($2->; $_ptr_FieldPointer->:=(($_t_Text="1") | ($_t_Text="Y@") | ($_t_Text="true")))
								
								AA_CheckFileUnlockedByTableNUM(Table:C252($2))
							Else 
								FIRST RECORD:C50($2->)
								For ($_l_Index; 1; Records in selection:C76($2->))
									$_ptr_FieldPointer->:=(($_t_Text="1") | ($_t_Text="Y@") | ($_t_Text="true"))
									DB_SaveRecord($2)
									AA_CheckFileUnlockedByTableNUM(Table:C252($2->))
									NEXT RECORD:C51($2->)
								End for 
							End if 
						End if 
					Else 
						$_l_Index:=1
						FIRST RECORD:C50($2->)
						While ((Not:C34(End selection:C36($2->))) & (<>SYS_l_CancelProcess#$_l_Process))
							$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+"DB_bo_RecordModified:="+$_t_Text)
							EXECUTE FORMULA:C63("DB_bo_RecordModified:="+$_t_Text)
							$_ptr_FieldPointer->:=DB_bo_RecordModified
							If (False:C215)
								If (($_l_FieldRow>0) & (ch1=1))
									$_ptr_Field->:=Export_Stamp2($_ptr_Field->)
								End if 
							End if 
							DB_SaveRecord($2)
							Progress2_Call($_l_Progress; "Applied "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsCount); $_l_Index; $_l_RecordsCount)
							NEXT RECORD:C51($2->)
							$_l_Index:=$_l_Index+1
						End while 
					End if 
				Else 
					
					If ((((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Change to")) & (Not:C34(($1=9) & (($_l_FieldNumber=3) | ($_l_FieldNumber=4) | ($_l_FieldNumber=5)))))
						ARRAY TEXT:C222($_at_TextData; $_l_RecordsCount)
						For ($_l_Index; 1; $_l_RecordsCount)
							$_at_TextData{$_l_Index}:=$_t_Text
						End for 
						Progress2_Call($_l_Progress; $_t_Message; 2; 10)
						If (<>SYS_l_CancelProcess#$_l_Process)
							ARRAY TO SELECTION:C261($_at_TextData; $_ptr_FieldPointer->)
						End if 
					Else 
						$_l_Index:=1
						FIRST RECORD:C50($2->)
						While ((Not:C34(End selection:C36($2->))) & (<>SYS_l_CancelProcess#$_l_Process))
							Case of 
								: ((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Change to@")
									$_ptr_FieldPointer->:=$_t_Text
								: ((r1=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Add to End@")
									$_ptr_FieldPointer->:=$_ptr_FieldPointer->+$_t_Text
								: ((r2=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Add to Start@")
									$_ptr_FieldPointer->:=$_t_Text+$_ptr_FieldPointer->
								: ($_t_ChangeType="Remove String@")
									$_ptr_FieldPointer->:=Replace string:C233($_ptr_FieldPointer->; $_t_Text; "")
									
								: ((r4=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Evaluated@")
									$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vTitle20:="+$_t_Text)
									EXECUTE FORMULA:C63("vTitle20:="+$_t_Text)
									$_ptr_FieldPointer->:=vTitle20
							End case 
							If (($1=9) & (($_l_FieldNumber=3) | ($_l_FieldNumber=4) | ($_l_FieldNumber=5)))
								Products_InLPPC
							End if 
							If (False:C215)
								If (($_l_FieldRow>0) & (ch1=1))
									$_ptr_Field->:=Export_Stamp2($_ptr_Field->)
								End if 
							End if 
							DB_SaveRecord($2)
							Progress2_Call($_l_Progress; "Applied "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsCount); $_l_Index; $_l_RecordsCount)
							NEXT RECORD:C51($2->)
							$_l_Index:=$_l_Index+1
						End while 
					End if 
					
			End case 
			
			If ((<>SYS_l_CancelProcess#$_l_Process) & ((((r0=1) & (Count parameters:C259<3)) | ($_t_ChangeType="Change to"))) & (Not:C34(($1=9) & (($_l_FieldNumber=3) | ($_l_FieldNumber=4) | ($_l_FieldNumber=5)))))
				
				If (False:C215)
					If (($_l_FieldRow>0) & (ch1=1))  //if have to update the Remote Stamp
						Progress2_Call($_l_Progress; $_t_Message; 5; 10)
						QUERY SELECTION:C341($2->; $_ptr_Field-><":")
						If (Records in selection:C76($2->)>0)
							GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength)
							If ($_l_Index=15)
								$_t_Stamp:=Export_Stamp+<>PER_t_CurrentUserInitials
							Else 
								$_t_Stamp:=Export_Stamp
							End if 
							$_l_RecordsCount:=Records in selection:C76($2->)
							ARRAY TEXT:C222($_at_Stamps; $_l_RecordsCount)
							For ($_l_Index; 1; $_l_RecordsCount)
								$_at_Stamps{$_l_Index}:=$_t_Stamp
							End for 
							Progress2_Call($_l_Progress; $_t_Message; 7; 10)
							ARRAY TO SELECTION:C261($_at_Stamps; $_ptr_Field->)
						End if 
						Progress2_Call($_l_Progress; $_t_Message; 10; 10)
					Else 
						Progress2_Call($_l_Progress; $_t_Message; 10; 10)
					End if 
				End if 
			End if 
			
			If (($_l_Y=0) & (<>SYS_l_CancelProcess#$_l_Process))
				//Add to Comp & Cont's Furthers
				If (($_l_FieldType=7) & ($1=1) | ($1=2) & ($_t_PreviewName="FURTHERS"))
					FIRST RECORD:C50($2->)
					While (Not:C34(End selection:C36($2->)))
						If ($1=1)
							
							CREATE RECORD:C68([CONTACTS_RECORD_ANALYSIS:144])
							[CONTACTS_RECORD_ANALYSIS:144]ID:2:=AA_GetNextID(->[CONTACTS_RECORD_ANALYSIS:144]ID:2)
							[CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3:=[CONTACTS:1]Contact_Code:2
							[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1:=Uppercase:C13($_t_Text)
							SAVE RECORD:C53([CONTACTS_RECORD_ANALYSIS:144])
						Else 
							CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
							
							[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=Uppercase:C13($_t_Text)
							[COMPANIES_RECORD_ANALYSIS:146]ID:2:=AA_GetNextID(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
							[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
							SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
						End if 
						DB_SaveRecord($2)
						NEXT RECORD:C51($2->)
					End while 
				Else 
					Gen_Alert("Cannot apply to that Field"; "Cancel")
				End if 
			End if 
			
			Progress2_Call($_l_Progress; "")
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ListAp2"; $_t_oldMethodName)