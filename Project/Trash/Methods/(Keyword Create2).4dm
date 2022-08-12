//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Keyword_Create2
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
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $_ptr_table)
	C_TEXT:C284($_t_FindString; $_t_KeywordCode; $_t_oldMethodName; $_t_TableName; $_t_Text; $_t_Word; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Keyword_Create2")
//Keyword_Create2
Load_Fields


$_t_Text:=""
$_t_TableName:=$1
$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
If ($_l_TableNumber>0)
	If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
		$_ptr_table:=Table:C252(<>DB_al_TableNums{$_l_TableNumber})
		$_ptr_Field:=Field:C253($_ptr_table->; <>SYS_al_TableUniqueField{$_l_TableNumber})
		READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
		If ($3="")
			$_t_KeywordCode:="K"+Str LeadZeros(String:C10(<>DB_al_TableNums{$_l_TableNumber}); 3)+$_ptr_Field->
		Else 
			$_t_KeywordCode:="K"+Str LeadZeros(String:C10(<>DB_al_TableNums{$_l_TableNumber}); 3)+$3
		End if 
		$_t_FindString:=Str_KeyChars($2)
		If (($_t_KeywordCode#"") & ($2#""))
			
			$_t_Word:=FirstWord($_t_FindString)
			$_t_FindString:=Substring:C12($_t_FindString; Length:C16($_t_Word)+2; 32000)
			If (Length:C16($_t_Word)>15)
				$_t_Word:=Substring:C12($_t_Word; 1; 15)
			End if 
			While ($_t_Word#"")
				//If (Length($_t_Word)>1)
				CREATE RECORD:C68([CONTRACT_RECORD_ANALYSIS:88])
				[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1:=$_t_KeywordCode
				[CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2:=$_t_Word
				DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
				//End if
				$_t_Word:=FirstWord($_t_FindString)
				$_t_FindString:=Substring:C12($_t_FindString; Length:C16($_t_Word)+2; 32000)
				If (Length:C16($_t_Word)>15)
					$_t_Word:=Substring:C12($_t_Word; 1; 15)
				End if 
			End while 
			
		End if 
		READ ONLY:C145([CONTRACT_RECORD_ANALYSIS:88])
		UNLOAD RECORD:C212([CONTRACT_RECORD_ANALYSIS:88])
	Else 
		$_t_Text:="Keyword Value Error - This File cannot have Keywords"
	End if 
Else 
	$_t_Text:="Keyword Value Error - Incorrect File Name"
End if 
If ($_t_Text#"")
	Error_MessGen($_t_Text)
End if 
ERR_MethodTrackerReturn("Keyword_Create2"; $_t_oldMethodName)