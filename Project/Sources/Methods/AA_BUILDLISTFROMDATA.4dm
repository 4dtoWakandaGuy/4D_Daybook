//%attributes = {}
If (False:C215)
	//Project Method Name: AA_BUILDLISTFROMDATA
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:22`Method: AA_BUILDLISTFROMDATA
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_)
	//C_UNKNOWN(vContName)
	ARRAY TEXT:C222($_at_DistinctiveValues; 0)
	ARRAY TEXT:C222($_at_Proffesionaladditions; 0)
	ARRAY TEXT:C222($_at_Salutations; 0)
	ARRAY TEXT:C222($_at_SNPrefixes; 0)
	//ARRAY TEXT(AA_at_Proffesionaladditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_BOOLEAN:C305(<>DB_Bo_UnitTestMode; <>SYS_bo_DefaultSalutation; $_Bo_AutoOK; $_bo_hasArray; $_bo_OK; $4; <>DB_Bo_UnitTestMode; <>SYS_bo_DefaultSalutation; $_Bo_AutoOK; $_bo_hasArray; $_bo_OK)
	C_BOOLEAN:C305($4)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_Index2; $_l_SalutationPosition; $_l_TableNumber; $_l_FieldNumber; $_l_Index; $_l_Index2; $_l_SalutationPosition; $_l_TableNumber)
	C_OBJECT:C1216($_obj_ListItem; $_obj_ListItemArray)
	C_POINTER:C301($_ptr_Array; $_Ptr_Table; $2; $3; $_ptr_Array; $_Ptr_Table; $2; $3)
	C_TEXT:C284($_t_FieldName; $_t_FirstNames; $_t_ListName; $_t_oldMethodName; $_t_ReplacementSalutation; $_t_Salutation; $_t_Surnames; $_t_TableName; $1; vContName; $_t_FieldName)
	C_TEXT:C284($_t_FirstNames; $_t_ListName; $_t_oldMethodName; $_t_ReplacementSalutation; $_t_Salutation; $_t_Surnames; $_t_TableName; $1)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("AA_BUILDLISTFROMDATA")






ARRAY TEXT:C222($_at_DistinctiveValues; 0)

If (Count parameters:C259>=2)
	$_Ptr_Table:=$2
	$_t_ListName:=$1
	If (Count parameters:C259>=3)
		$_bo_hasArray:=True:C214
		$_ptr_Array:=$3
		If (Count parameters:C259>=4)
			$_Bo_AutoOK:=$4
		End if 
	Else 
		
	End if 
	$_l_TableNumber:=Table:C252($_Ptr_Table)
	$_l_FieldNumber:=Field:C253($_Ptr_Table)
	$_t_TableName:=Table name:C256($_l_TableNumber)
	$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
	
	QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->#"")
	DISTINCT VALUES:C339(Field:C253($_l_TableNumber; $_l_FieldNumber)->; $_at_DistinctiveValues)
	For ($_l_Index; 1; Size of array:C274($_at_DistinctiveValues))
		RemoveLeadTr($_at_DistinctiveValues{$_l_Index}; ->$_at_DistinctiveValues{$_l_Index})
	End for 
	
	Gen_Alert("BEWARE OF TITLES THAT LOOK OK (LIKE Mr)-THEY PROBABLY CONTAIN FAULTY CHARACTERS!")
	
	SORT ARRAY:C229($_at_DistinctiveValues)
	For ($_l_Index; 1; Size of array:C274($_at_DistinctiveValues))
		If ($_at_DistinctiveValues{$_l_Index}#"")
			//C_OBJECT($_obj_ListItem)
			//$_obj_ListItem.List:=$_t_ListName
			//$_obj_ListItem.Name:=$_at_DistinctiveValues{$_l_Index}
			//$_obj_ListItem.AskAdd:=True
			//$_obj_listItem.HasArray:=$_bo_hasArray
			//$_obj_ListItem.Array:=->$_ptr_Array
			
			//AA_CreateListItem
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_t_ListName; *)
			QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2=$_at_DistinctiveValues{$_l_Index})
			If (Records in selection:C76([LIST_ITEMS:95])=0)
				Gen_Confirm("Do you wish to add"+Char:C90(13)+$_at_DistinctiveValues{$_l_Index}+Char:C90(13)+" to "+$_t_ListName+"List"; " Fix"; "Yes")
				$_bo_OK:=(ok=0)
			Else 
				$_bo_OK:=$4
			End if 
			If ($_bo_OK)
				If (Not:C34($_bo_hasArray))
					CREATE RECORD:C68([LIST_ITEMS:95])
					[LIST_ITEMS:95]List_Name:1:=$_t_ListName
					[LIST_ITEMS:95]List_Entry:2:=$_at_DistinctiveValues{$_l_Index}
					DB_SaveRecord(->[LIST_ITEMS:95])
					AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				Else 
					APPEND TO ARRAY:C911($_ptr_Array->; $_at_DistinctiveValues{$_l_Index})
				End if 
			Else 
				If (Not:C34(<>DB_Bo_UnitTestMode))
					Gen_Confirm("Title contains incorrect characters, or reparse name"; "Reparse"; "Incorrect")
					
					If (OK=0)
						$_t_ReplacementSalutation:=Gen_Request("What is the title For "+$_at_DistinctiveValues{$_l_Index}+"( Leave Blank for unknown)")
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Title:3=$_at_DistinctiveValues{$_l_Index})
						If (Not:C34(In transaction:C397))
							DB_lockFile(->[CONTACTS:1])
							APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Title:3:=$_t_ReplacementSalutation)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
						Else 
							FIRST RECORD:C50([CONTACTS:1])
							For ($_l_Index2; 1; Records in selection:C76([CONTACTS:1]))
								[CONTACTS:1]Title:3:=$_t_ReplacementSalutation
								DB_SaveRecord(->[CONTACTS:1])
								AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
						
					Else 
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Title:3=$_at_DistinctiveValues{$_l_Index})
					End if 
					For ($_l_Index2; 1; Records in selection:C76([CONTACTS:1]))
						[CONTACTS:1]Contact_Name:31:=Cont Name
						$_t_Salutation:=[CONTACTS:1]Title:3
						$_t_FirstNames:=[CONTACTS:1]Forename:4
						$_t_Surnames:=[CONTACTS:1]Surname:5
						AA_LoadNameArrays(->$_at_Salutations; ->$_at_SNPrefixes; ->$_at_Proffesionaladditions)
						AA_ParseName([CONTACTS:1]Contact_Name:31; 0; ->[CONTACTS:1]Title:3; ->[CONTACTS:1]Forename:4; ->[CONTACTS:1]Surname:5; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
						[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
						[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
						If ([CONTACTS:1]Title:3#"")
							//to ensure capitalization is correct
							
							$_l_SalutationPosition:=Find in array:C230(AA_at_Salutations; [CONTACTS:1]Title:3)
							If ($_l_SalutationPosition>0)
								[CONTACTS:1]Title:3:=AA_at_Salutations{$_l_SalutationPosition}
							End if 
						End if 
						
						
						If ($_t_Salutation#[CONTACTS:1]Title:3)
							vContName:=Cont NameJT
							Contacts_InLPM
							Macro_AccTypePt(->[CONTACTS:1]Title:3)
						End if 
						If ($_t_FirstNames#[CONTACTS:1]Forename:4)
							[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
							If (([CONTACTS:1]Forename:4#"") & ([CONTACTS:1]Salutation:7="") & (<>SYS_bo_DefaultSalutation))
								If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
									[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
								End if 
							End if 
							Cont_Check
							vContName:=Cont NameJT
							Contacts_InLPM
							Macro_AccTypePt(->[CONTACTS:1]Forename:4)
						End if 
						If ($_t_Surnames#[CONTACTS:1]Surname:5)
							[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
							vContName:=Cont NameJT
							Cont_Check
							Contacts_InLPM
							Macro_AccTypePt(->[CONTACTS:1]Surname:5)
						End if 
						[CONTACTS:1]Contact_Name:31:=Cont Name
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
						NEXT RECORD:C51([CONTACTS:1])
					End for 
					
					
				Else 
					APPEND TO ARRAY:C911($_ptr_Array->; $_at_DistinctiveValues{$_l_Index})
				End if 
			End if 
		End if 
		
	End for 
	
End if 
ERR_MethodTrackerReturn("AA_BUILDLISTFROMDATA"; $_t_oldMethodName)
