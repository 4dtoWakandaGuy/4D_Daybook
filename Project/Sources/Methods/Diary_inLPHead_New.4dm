//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_inLPHead_New
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
	C_BOOLEAN:C305(EMAIL_bo_MailListBuilt)
	C_TEXT:C284($_t_FormLayout; $_t_Header; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vContName; vLetterDate)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Diary_inLPHead_New")

If (Count parameters:C259>=1)
	$_t_FormLayout:=$1
	Case of 
		: ($_t_FormLayout="Q")
			If (([DIARY:12]Document_Heading:32="") | ([DIARY:12]Document_Heading:32="Quote @"))
				$_t_Header:="Quote "+vLetterDate+" to "+vContName+", "+[COMPANIES:2]Company_Name:2
				If (Length:C16($_t_Header)>51)
					$_t_Header:="Quote "+vLetterDate+" to "+vContName
				End if 
				[DIARY:12]Document_Heading:32:=$_t_Header
			End if 
			Address_Details
			Address_Contact
		: ($_t_FormLayout="E")
			If (([DIARY:12]Document_Heading:32="") | ([DIARY:12]Document_Heading:32="Email @"))
				$_t_Header:="Email "+vLetterDate+" to "+vContName+", "+[COMPANIES:2]Company_Name:2
				If (Length:C16($_t_Header)>51)
					$_t_Header:="Email "+vLetterDate+" to "+vContName
				End if 
				[DIARY:12]Document_Heading:32:=$_t_Header
			End if 
			RELATE MANY:C262([DIARY:12]Diary_Code:3)
		Else 
			If (([DIARY:12]Document_Heading:32="") | ([DIARY:12]Document_Heading:32="Letter @"))
				$_t_Header:="Letter "+vLetterDate+" to "+vContName+", "+[COMPANIES:2]Company_Name:2
				If (Length:C16($_t_Header)>51)
					$_t_Header:="Letter "+vLetterDate+" to "+vContName
				End if 
				[DIARY:12]Document_Heading:32:=$_t_Header
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("Diary_inLPHead_New"; $_t_oldMethodName)