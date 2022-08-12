//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_DocumentCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharIndex; $_l_Clash; $_l_Dashes; $_l_Number; $1)
	C_TEXT:C284($_t_DocumentCode; $_t_LetterCode; $_t_oldMethodName; $2; $3; DOC_t_DocumentCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Set_DocumentCode")
//C_LONGINT($1)  ` the document type
//C_TEXT($2)  `The value to pass to Let_No
Case of 
	: ($1=1)  //making a template
		Let_No("T")
		[DOCUMENTS:7]Document_Code:1:="T"+DOC_t_DocumentCode
		
	: ($1=2)  //making a duplicate of a template
		$_l_CharacterPosition:=Position:C15("/"; [DOCUMENTS:7]Document_Code:1)  //take out slash
		If ($_l_CharacterPosition>1)
			[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; $_l_CharacterPosition-1)
		End if 
		If (Length:C16([DOCUMENTS:7]Document_Code:1)>9)  //make sure no more than 10 chars
			[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; 9)
		End if 
		$_t_DocumentCode:=[DOCUMENTS:7]Document_Code:1
		
		If (Count parameters:C259>=3)
			$_t_LetterCode:=$3
		Else 
			Let_No($2)
			$_t_LetterCode:=DOC_t_DocumentCode
		End if 
		//check this does not clash
		Repeat 
			SET QUERY DESTINATION:C396(3; $_l_Clash)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode+"/"+$2+$_t_LetterCode)
			SET QUERY DESTINATION:C396(0)
			If ($_l_Clash>0)
				Let_No($2)
				$_t_LetterCode:=DOC_t_DocumentCode
			End if 
			
		Until ($_l_Clash=0)
		
		[DOCUMENTS:7]Document_Code:1:=[DOCUMENTS:7]Document_Code:1+"/"+$2+$_t_LetterCode
		If (Length:C16([DOCUMENTS:7]Document_Code:1)>15)
			[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; 15)
		End if 
	: ($1=3)  //making a modifable copy of a letter
		$_l_Dashes:=0
		For ($_l_CharIndex; Length:C16([DOCUMENTS:7]Document_Code:1); 1; -1)
			If ([DOCUMENTS:7]Document_Code:1[[$_l_CharIndex]]="-")
				$_l_Dashes:=$_l_CharIndex
				$_l_CharIndex:=0
			End if 
		End for 
		
		If ($_l_Dashes>0)
			$_t_DocumentCode:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; $_l_Dashes-1)
			$_l_Number:=Num:C11(Substring:C12([DOCUMENTS:7]Document_Code:1; $_l_Dashes+1; Length:C16([DOCUMENTS:7]Document_Code:1)))
			If ($_l_Number>0)
				$_l_Number:=$_l_Number+1
			End if 
		Else 
			$_t_DocumentCode:=[DOCUMENTS:7]Document_Code:1
			$_l_Number:=1
		End if 
		[DOCUMENTS:7]Document_Code:1:=$_t_DocumentCode+"-"+("0"*(3-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
	: ($1=4)  //making a revised copy of a template
		$_l_Dashes:=0
		For ($_l_CharIndex; Length:C16([DOCUMENTS:7]Document_Code:1); 1; -1)
			If ([DOCUMENTS:7]Document_Code:1[[$_l_CharIndex]]="-")
				$_l_Dashes:=$_l_CharIndex
				$_l_CharIndex:=0
			End if 
		End for 
		If ($_l_Dashes>0)
			$_t_DocumentCode:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; $_l_Dashes-1)
		Else 
			$_t_DocumentCode:=[DOCUMENTS:7]Document_Code:1
		End if 
		$_l_CharacterPosition:=Position:C15("/"; [DOCUMENTS:7]Document_Code:1)  //take out slash
		If ($_l_CharacterPosition>1)
			[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; $_l_CharacterPosition-1)
		End if 
		If (Length:C16([DOCUMENTS:7]Document_Code:1)>7)  //make sure no more than 10 chars
			[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; 7)
		End if 
		$_t_DocumentCode:=[DOCUMENTS:7]Document_Code:1
		SET QUERY DESTINATION:C396(3; $_l_Clash)  //check this does not clash
		$_l_Number:=1
		Repeat 
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode+"R"+String:C10($_l_Number))
			
			If ($_l_Clash>0)
				$_l_Number:=$_l_Number+1
			End if 
		Until ($_l_Clash=0)
		SET QUERY DESTINATION:C396(0)
		[DOCUMENTS:7]Document_Code:1:=$_t_DocumentCode+"R"+String:C10($_l_Number)
End case 
ERR_MethodTrackerReturn("Set_DocumentCode"; $_t_oldMethodName)
