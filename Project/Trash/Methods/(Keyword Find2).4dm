//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Keyword_Find2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_LONGINT:C283($_l_TableNumber; $0; $4; $5)
	C_POINTER:C301($_ptr_Field; $_ptr_table)
	C_TEXT:C284($_t_Find; $_t_KeywordCode; $_t_oldMethodName; $_t_TableName; $_t_Text; $_t_Word; $1; $2; $3; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Keyword_Find2")
//Keyword_Find2
Load_Fields

$0:=0
$_t_Text:=""
$_t_TableName:=$1
$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
If ($_l_TableNumber>0)
	If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
		$_ptr_table:=Table:C252(<>DB_al_TableNums{$_l_TableNumber})
		$_ptr_Field:=Field:C253(<>DB_al_TableNums{$_l_TableNumber}; <>SYS_al_TableUniqueField{$_l_TableNumber})
		READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
		If ($6="")
			$_t_KeywordCode:="K"+Str LeadZeros(String:C10(<>DB_al_TableNums{$_l_TableNumber}); 3)+"@"
		Else 
			$_t_KeywordCode:="K"+Str LeadZeros(String:C10(<>DB_al_TableNums{$_l_TableNumber}); 3)+$6
		End if 
		
		$_t_Find:=Str_KeyChars($2)
		If ($4#0)
			CREATE SET:C116($_ptr_table->; "Big one")
		End if 
		
		If ($3="exact")
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=($_t_Find+"@"))
			If ($5>0)
				If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])>$5)
					QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
					QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_Find)
					If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=($_t_Find+"@"))
					End if 
				End if 
			End if 
			Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; $_ptr_table; $_ptr_Field; 4)
			If ($4#0)
				CREATE SET:C116($_ptr_table->; "master")
			End if 
		Else 
			$_t_Word:=FirstWord($_t_Find)
			$_t_Find:=Substring:C12($_t_Find; Length:C16($_t_Word)+2; 32000)
			If (Length:C16($_t_Word)>14)
				$_t_Word:=Substring:C12($_t_Word; 1; 14)
			End if 
			If ($_t_Find#"")
				
				If ($3="and")
					ALL RECORDS:C47($_ptr_table->)
				End if 
				CREATE SET:C116($_ptr_table->; "Master")
				While ($_t_Word#"")
					QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
					QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=($_t_Word+"@"))
					If ($5>0)
						If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])>$5)
							QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
							QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_Word)
							If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
								QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
								QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=($_t_Word+"@"))
							End if 
						End if 
					End if 
					Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; $_ptr_table; $_ptr_Field; 4)
					CREATE SET:C116($_ptr_table->; "extra")
					If ($3="and")
						INTERSECTION:C121("Master"; "Extra"; "Master")
					Else 
						UNION:C120("Master"; "Extra"; "Master")
					End if 
					$_t_Word:=FirstWord($_t_Find)
					$_t_Find:=Substring:C12($_t_Find; Length:C16($_t_Word)+2; 32000)
					If (Length:C16($_t_Word)>14)
						$_t_Word:=Substring:C12($_t_Word; 1; 14)
					End if 
				End while 
				If ($4=0)
					USE SET:C118("Master")
				End if 
				
			Else 
				QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
				QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=($_t_Word+"@"))
				If ($5>0)
					If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])>$5)
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_Word)
						If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
							QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=$_t_KeywordCode; *)
							QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=($_t_Word+"@"))
						End if 
					End if 
				End if 
				Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; $_ptr_table; $_ptr_Field; 4)
				If ($4#0)
					CREATE SET:C116($_ptr_table->; "master")
				End if 
			End if 
			
		End if 
		
		If ($4#0)
			If ($4=1)
				INTERSECTION:C121("Big One"; "Master"; "Big One")
			Else 
				UNION:C120("Big One"; "Master"; "Big One")
			End if 
			USE SET:C118("Big One")
		End if 
		$0:=Records in selection:C76($_ptr_table->)
	Else 
		$_t_Text:="Keyword_Find Error - This File cannot have Keywords"
	End if 
Else 
	$_t_Text:="Keyword_Find Error - Incorrect File Name"
End if 
If ($_t_Text#"")
	Error_MessGen($_t_Text)
End if 
ERR_MethodTrackerReturn("Keyword_Find2"; $_t_oldMethodName)